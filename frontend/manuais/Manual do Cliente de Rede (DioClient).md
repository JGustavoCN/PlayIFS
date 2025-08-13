+++markdown

# Manual de Arquitetura: Padrão do Cliente de Rede *(DioClient)*

*(v1.0)*

---

## Prefácio: A Missão do DioClient

O **`DioClient`** não é apenas uma instância do `Dio`;
é uma **classe configuradora** que encapsula toda a lógica transversal de comunicação de rede da aplicação.
A missão é garantir que **toda requisição** e **toda resposta** passem por um conjunto de **regras padronizadas e inteligentes**.

---

## Responsabilidades Principais

* **Configuração Base:** Definir `baseUrl`, *timeouts* e *headers* padrão.
* **Autenticação Automática:** Anexar o `accessToken` a todas as requisições que precisem.
* **Gestão de Sessão Automática:** Renovar `tokens` expirados (`refreshToken`) de forma transparente.
* **Tratamento de Erros Centralizado:** Intercetar e enriquecer erros específicos (ex.: 422) antes de chegarem à camada de repositório.

---

## 1. Estrutura e Injeção de Dependência

**Estrutura:**
O `DioClient` recebe no construtor:

* Uma instância **crua** de `Dio`
* Uma instância de `FlutterSecureStorage`

No construtor, ele configura o `Dio` com todas as **regras de negócio** através de **Intercetores**.

**Injeção de Dependência (`locator.dart`):**
No *locator*, criamos o `DioClient` e registamos **apenas a instância configurada** do `Dio`.
Esta instância é a que será usada pelo restante da aplicação (ex.: `PlayifsApiService`).

---

## 2. O Coração do DioClient: Os Intercetores

**Intercetores** são *guardas* que inspecionam e podem modificar cada **requisição**, **resposta** ou **erro**.
O nosso `InterceptorsWrapper` implementa três lógicas principais:

---

### 2.1. Intercetor `onRequest` *(Anexar o Token de Acesso)*

**Fluxo:**

1. Antes de cada requisição, lê o objeto `AuthTokens` do `SecureStorage`.
2. Faz o *parse* do JSON e extrai o `accessToken`.
3. Anexa ao cabeçalho `Authorization` no formato `Bearer <token>`.

**Resultado:**
Todas as chamadas já saem autenticadas, sem que repositórios ou casos de uso se preocupem com tokens.

---

### 2.2. Intercetor `onResponse` *(Depuração)*

**Fluxo:**
Imprime no console o **status** e o **corpo** de cada resposta bem-sucedida.

**Resultado:**
Facilita a depuração, mostrando em tempo real os dados recebidos.

---

### 2.3. Intercetor `onError` *(Tratamento Inteligente de Erros)*

A parte mais poderosa, lidando com erros de forma **global**.

---

#### **Lógica 1: Erros de Validação (422)**

**Fluxo:**

1. Se status for `422`, lê o corpo do erro (`fieldErrors`).
2. Faz *parse* para `ApiValidationError`.
3. Embrulha em `ValidationException`.
4. Rejeita a `DioException` original, mas com a exceção customizada em `.error`.

**Benefício:**
Transforma um erro genérico de rede num erro de negócio específico, permitindo tratamento de validação a nível de campo.

---

#### **Lógica 2: Renovação Automática de Token (401)**

**Fluxo:**

1. Se status for `401`, verifica se existe `refreshToken` armazenado.
2. Se **não houver**, rejeita o erro (sessão inválida).
3. Se houver, cria **nova instância** de `Dio` (para evitar loops).
4. Chama `/auth/refresh-token`.
5. Se bem-sucedido:

   * Guarda novos `accessToken` e `refreshToken`.
   * Atualiza a requisição original com o novo token.
   * Refaz a chamada e retorna o resultado.
6. Se falhar:

   * Limpa os tokens.
   * Rejeita o erro original, forçando novo login.

**Benefício:**
Proporciona **experiência contínua** e segura, corrigindo sessões expiradas sem interromper o utilizador.

---

## Conclusão

O ficheiro **`dio_client.dart`** atual é a **implementação canónica** deste manual.
Ele serve como **base robusta** para toda comunicação com a API.
+++
