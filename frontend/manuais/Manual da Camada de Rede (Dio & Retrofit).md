+++markdown

# Manual de Arquitetura: Padrão da Camada de Rede *(Dio & Retrofit)*

*(v1.1 – Revisado)*

---

## Prefácio: A Missão do ApiService

O ficheiro **`PlayifsApiService`** é um contrato *type-safe* para a **API REST** do backend.
Com **Retrofit**, definimos métodos Dart que correspondem a **endpoints** da API.
O `build_runner` gera automaticamente o código necessário para executar chamadas de rede reais usando **Dio**.

---

## Benefícios Principais

* **Segurança de Tipos:** O compilador garante que enviamos e recebemos os **DTOs** corretos.
* **Código Limpo:** A definição da API fica isolada da implementação e da lógica de negócio.
* **Auto-documentação:** O ficheiro funciona como documentação clara dos endpoints disponíveis.

---

## 1. Estrutura e Convenções

### 1.1. Estrutura Fundamental *(playifs\_api\_service.dart)*

Todo serviço de API segue esta base:

1. **Anotação `@RestApi`** — Declara a classe como serviço Retrofit e define `baseUrl`.
2. **Classe `abstract`** — A definição é abstrata; a implementação será gerada.
3. **Construtor `factory`** — Liga a classe à implementação gerada.
4. **Diretiva `part`** — Conecta ao ficheiro `.g.dart` gerado.

---

### 1.2. Convenções de Nomenclatura

* **Ficheiro:** `snake_case.dart`
  Ex.: `playifs_api_service.dart`.
* **Constantes de Rota:** Todos os *paths* dos endpoints devem estar em `ApiConstants`
  (`lib/core/constants/api_constants.dart`).

---

## 2. Definindo Endpoints: Guia Prático

---

### 2.1. Enviando Dados no Corpo da Requisição `(@Body)`

Usado em `POST`, `PUT` ou `PATCH` para enviar um **DTO** como JSON no corpo.

**Exemplo (Login):**

```dart
@POST(ApiConstants.authLogin)
Future<AuthTokensDTO> login(@Body() LoginRequestDTO loginRequest);
```

---

### 2.2. Passando Parâmetros no Path da URL `(@Path)`

Para endpoints que usam valores dinâmicos no URL, ex.: `/api/v1/competitions/123`.

**Exemplo (Detalhes da Competição):**

```dart
// Em api_constants.dart:
// static const String competitionDetails = '/competitions/{id}';

@GET(ApiConstants.competitionDetails)
Future<ApiResponseBody<CompetitionDetailsDTO>> findCompetitionById(@Path('id') int id);
```

`@Path('id')` substitui `{id}` na rota pelo valor passado.

---

### 2.3. Passando Parâmetros de Query `(@Queries)`

Para listagens com múltiplos filtros e paginação, ex.:
`...?page=0&size=10&status=ACTIVE`.

**Exemplo (Listar Competições):**

```dart
@GET(ApiConstants.competitions)
Future<ApiResponseBody<PageDTO<CompetitionSummaryDTO>>> findAllCompetitions(
  @Queries() Map<String, dynamic> queries,
);
```

`@Queries()` converte um `Map` em parâmetros de URL.

---

### 2.4. Outros Métodos Comuns `(@DELETE, @PUT)`

Mesma lógica, mudando apenas a anotação HTTP.

**Exemplo (DELETE):**

```dart
@DELETE(ApiConstants.competitionDetails)
Future<void> deleteCompetition(@Path('id') int id);
```

Retorna `Future<void>` para respostas sem corpo.

---

## 3. Tratando Tipos de Resposta da API

A API possui **dois formatos de resposta** e o `ApiService` deve refletir isso.

---

### Cenário A *(Padrão)* — Resposta com Envelope `ApiResponseBody<T>`

A maioria retorna JSON dentro de:

```json
{"data": ...}
```

**Exemplo (`/me`):**

```dart
@GET(ApiConstants.me)
Future<ApiResponseBody<ProfileDTO>> getMyProfile();
```

O Retrofit desserializa o invólucro e depois o objeto interno.

---

### Cenário B *(Exceção)* — Resposta Direta

Alguns endpoints (`/login`, `/refreshToken`) retornam o DTO diretamente.

**Exemplo (`/login`):**

```dart
@POST(ApiConstants.authLogin)
Future<AuthTokensDTO> login(@Body() LoginRequestDTO loginRequest);
```

---

💡 **Nota do Arquiteto:**
Sempre verificar a resposta real da API (ex.: Postman) antes de definir o tipo de retorno.

---

## 4. O Exemplo Canónico *(Código Atual)*

```dart
// Ficheiro: lib/data/datasources/playifs_api_service.dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
// ...
part 'playifs_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class PlayifsApiService {
  factory PlayifsApiService(Dio dio, {String baseUrl}) = _PlayifsApiService;

  // --- MÉTODOS DE AUTENTICAÇÃO ---
  // Cenário B: Resposta Direta
  @POST(ApiConstants.authLogin)
  Future<AuthTokensDTO> login(@Body() LoginRequestDTO loginRequest);

  @POST(ApiConstants.authRefreshToken)
  Future<AuthTokensDTO> refreshToken(@Body() RefreshTokenRequestDTO refreshTokenRequest);

  // --- MÉTODO DE PERFIL ---
  // Cenário A: Resposta com Envelope
  @GET(ApiConstants.me)
  Future<ApiResponseBody<ProfileDTO>> getMyProfile();
}
```

---

Este manual garante que a camada de rede seja **consistente**, **segura** e **fácil de manter**.
+++
