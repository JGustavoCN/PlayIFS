+++markdown

# Manual de Arquitetura: Padrão para Implementação de Repositórios

*(v2.0 - Revisado)*

---

## Prefácio: A Missão do Repositório

Enquanto o **Contrato do Repositório** (a `abstract class` no domínio) define **o que** a nossa aplicação precisa fazer, a **Implementação do Repositório** (`class ...Impl`) define **como** isso é feito.

Essa classe atua como um **"escudo protetor"** da aplicação. É responsabilidade dela:

* Lidar com a complexidade da comunicação de rede
* Traduzir **dados brutos** (DTOs) em **objetos de domínio**
* Converter exceções de rede (`DioException`) em **estados previsíveis** `Result.failure` que o resto do sistema possa entender

---

## 1. As 3 Responsabilidades Principais

1. **Concretizar o Contrato**
   Implementar fielmente todos os métodos definidos na `abstract class` do repositório no domínio.

2. **Orquestrar Fontes de Dados**
   Chamar os métodos necessários da nossa fonte de dados (`PlayifsApiService`).

3. **Traduzir e Proteger**
   Converter DTOs da API em Entidades de Domínio e capturar exceções, evitando que erros brutos cheguem à lógica de negócio.

---

## 2. O Padrão Arquitetural para Criação de `RepositoryImpl`

### 2.1. Localização e Nomenclatura

* **Localização:** `lib/data/repositories/`
* **Nome do ficheiro:** `snake_case`, seguindo o padrão `[feature]_repository_impl.dart`

**Exemplos:**

* `auth_repository_impl.dart`
* `profile_repository_impl.dart`

---

### 2.2. Estrutura da Classe

* A classe deve usar `implements` para aderir ao contrato do domínio.
* **Injeção de Dependência:** a fonte de dados (`ApiService`) é recebida via construtor.
* O **construtor** deve ser o primeiro membro declarado.

```dart
class AuthRepositoryImpl implements AuthRepository {
  // Construtor primeiro, para legibilidade.
  AuthRepositoryImpl(this._apiService);

  final PlayifsApiService _apiService;

  // ... métodos ...
}
```

---

## 3. A Anatomia de um Método de Repositório

Todos os métodos que fazem chamadas de rede devem usar `try-catch` para lidar com sucesso e falha.
Existem **dois cenários principais** para o tratamento de sucesso.

---

### Cenário A — Resposta Padrão *(com `ApiResponseBody`)*

Usado em endpoints como `GET /me`.

```dart
// Exemplo do ProfileRepositoryImpl
@override
Future<Result<Profile>> getProfile() async {
  try {
    // 1. Chama o serviço da API.
    final response = await _apiService.getMyProfile();
    // 2. Converte o DTO em entidade de domínio.
    final profileEntity = response.data.toEntity();
    // 3. Retorna sucesso.
    return Result.success(profileEntity);
  } on DioException catch (e) {
    return Result.failure('Falha ao buscar perfil.', error: e);
  }
}
```

---

### Cenário B — Resposta Direta *(sem `ApiResponseBody`)*

Usado em endpoints como `/login` e `/refreshToken`.

```dart
// Exemplo do AuthRepositoryImpl
@override
Future<Result<AuthTokens>> login(LoginCredentials credentials) async {
  try {
    final loginRequestDTO = credentials.toDTO();
    // 1. A resposta da API já é o DTO final.
    final responseDTO = await _apiService.login(loginRequestDTO);
    // 2. Converte diretamente para entidade.
    final authTokens = responseDTO.toEntity();
    // 3. Retorna sucesso.
    return Result.success(authTokens);
  } on DioException catch (e) {
    // ... tratamento de erro ...
  }
}
```

---

### Tratamento de Erros Robusto *(Bloco `catch`)*

O bloco `catch` deve priorizar **tipos específicos de erro**.

```dart
// Bloco 'catch' ideal, como implementado no AuthRepositoryImpl
on DioException catch (e) {
  // 1. Erros de validação (422)
  if (e.error is ValidationException) {
    return Result.failure('Dados inválidos. Verifique os campos.', error: e);
  }
  
  // 2. Erros de autenticação (401 ou 403)
  if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
    return Result.failure('Matrícula ou senha inválida.', error: e);
  }
  
  // 3. Erros genéricos de rede
  return Result.failure('Ocorreu um erro de rede. Tente novamente.', error: e);
}
```

---

## 4. Os Exemplos Canónicos

Os ficheiros:

* `auth_repository_impl.dart`
* `profile_repository_impl.dart`

são as implementações perfeitas deste padrão no nosso projeto.

---

**Seguir este manual garante que a camada de dados seja:**

* **Resiliente**
* **Testável**
* **Desacoplada** da lógica de negócio e da UI
  +++
