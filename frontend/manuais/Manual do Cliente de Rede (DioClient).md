-----

# Manual de Arquitetura: Padrão do Cliente de Rede *(DioClient)*

*(v2.0 - Revisado)*

-----

## Prefácio: A Missão do DioClient

O **`DioClient`** não é apenas uma instância do `Dio`; é uma **classe configuradora** que encapsula toda a lógica transversal de comunicação de rede da aplicação. A missão é garantir que **toda requisição** e **toda resposta** passem por um conjunto de **regras padronizadas e inteligentes**.

-----

## Responsabilidades Principais

* **Configuração Base:** Definir `baseUrl`, *timeouts* e *headers* padrão.
* **Autenticação Automática:** Anexar o `accessToken` a todas as requisições que precisem.
* **Gestão de Sessão Automática:** Renovar `tokens` expirados (`refreshToken`) de forma transparente.
* **Tratamento de Erros Centralizado:** Intercetar e enriquecer erros específicos (ex.: 422) antes de chegarem à camada de repositório.

-----

## 1\. Estrutura e Injeção de Dependência

**Estrutura:**
O `DioClient` recebe no construtor:

* Uma instância **crua** de `Dio`
* Uma instância de `FlutterSecureStorage`

No construtor, ele configura o `Dio` com todas as **regras de negócio** através de **Intercetores**.

**Injeção de Dependência (`locator.dart`):**
No *locator*, criamos o `DioClient` e registamos **apenas a instância configurada** do `Dio`. Esta instância é a que será usada pelo restante da aplicação (ex.: `PlayifsApiService`).

-----

## 2\. O Coração do DioClient: Os Intercetores

**Intercetores** são *guardas* que inspecionam e podem modificar cada **requisição**, **resposta** ou **erro**. O nosso `InterceptorsWrapper` implementa três lógicas principais:

### 2.1. Intercetor `onRequest` *(Anexar o Token de Acesso)*

**Fluxo:**

1. Antes de cada requisição, lê o objeto `AuthTokens` do `SecureStorage`.
2. Faz o *parse* do JSON e extrai o `accessToken`.
3. Anexa ao cabeçalho `Authorization` no formato `Bearer <token>`.

**Resultado:**
Todas as chamadas já saem autenticadas, sem que repositórios ou casos de uso se preocupem com tokens.

### 2.2. Intercetor `onResponse` *(Depuração)*

**Fluxo:**
Imprime no console o **status** e o **corpo** de cada resposta bem-sucedida.

**Resultado:**
Facilita a depuração, mostrando em tempo real os dados recebidos.

### 2.3. Intercetor `onError` *(Tratamento Inteligente de Erros)*

A parte mais poderosa, lidando com erros de forma **global**.

#### **Lógica 1: Erros de Validação (422) - Alinhado com o Código Final**

**Fluxo:**

1. Se o status for `422`, lê o corpo do erro.
2. Faz *parse* do JSON para o nosso DTO `ApiValidationError`.
3. Cria a nossa exceção customizada `ValidationException`.
4. Cria uma **nova** `DioException`, "enriquecendo-a" ao colocar a `ValidationException` no seu campo `error`.
5. Rejeita a `Future` com esta nova exceção enriquecida, que será capturada pelo repositório.

**Código-chave (`dio_client.dart`):**

```dart
// ... dentro do onError
if (error.response?.statusCode == 422) {
  debugPrint('[DioClient] -> Erro 422 detetado. A processar erros de validação.');
  final validationErrorData = error.response?.data;
  if (validationErrorData is Map<String, dynamic>) {
    try {
      final validationError = ApiValidationError.fromJson(validationErrorData);
      // "Enriquecemos" a DioException com a nossa ValidationException customizada.
      final customError = DioException(
        requestOptions: error.requestOptions,
        error: ValidationException(validationError),
      );
      // Rejeitamos com o nosso erro customizado, que será apanhado pelo repositório.
      return handler.reject(customError);
    } catch (e) {
      debugPrint('[DioClient] -> Falha ao fazer parse do erro de validação 422.');
    }
  }
}
```

#### **Lógica 2: Renovação Automática de Token (401)**

**Fluxo:**

1. Se o status for `401`, verifica se existe `refreshToken` armazenado.
2. Se **não houver**, rejeita o erro (sessão inválida).
3. Se houver, cria **nova instância** de `Dio` (para evitar loops) e chama `/auth/refresh-token`.
4. Se bem-sucedido:
      * Guarda os novos `accessToken` e `refreshToken`.
      * Atualiza a requisição original com o novo token.
      * Refaz a chamada e retorna o resultado.
5. Se falhar:
      * Limpa os tokens.
      * Rejeita o erro original, forçando um novo login.

**Benefício:**
Proporciona **experiência contínua** e segura, corrigindo sessões expiradas sem interromper o utilizador.

-----

## 3\. Melhorias Potenciais e Próximos Passos

Esta seção documenta melhorias arquiteturais que podem ser implementadas para tornar o `DioClient` ainda mais robusto.

### 3.1. Evitar Múltiplas Renovações de Token Simultâneas (Locking)

* **O Problema (Stampeding Herd):** Se várias requisições falharem com 401 ao mesmo tempo (ex: ao abrir uma tela que faz múltiplas chamadas), cada uma delas tentará iniciar o processo de renovação de token independentemente. Isto é ineficiente e pode levar a *race conditions*.
* **A Solução (Lock):** Podemos introduzir um mecanismo de "lock" (ou fila). A primeira requisição que receber 401 inicia a renovação e "tranca" o processo. As outras requisições que falharem enquanto a renovação está em andamento irão esperar pela conclusão da primeira, em vez de iniciarem as suas próprias. Após a renovação ser bem-sucedida, todas as requisições em espera são refeitas com o novo token.
* **Benefício:** Garante que apenas uma chamada de `refresh-token` seja feita de cada vez, economizando recursos e aumentando a estabilidade do sistema.

-----

## Conclusão

O ficheiro **`dio_client.dart`** atual é a **implementação canónica** deste manual. Ele serve como **base robusta** para toda a comunicação com a API.
