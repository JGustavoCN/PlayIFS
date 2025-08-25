-----

# Manual de Arquitetura — Padrão para Implementação de Repositórios

**v3.0 - Revisado e Unificado**

-----

## 📜 Prefácio — A Missão do Repositório

Enquanto o **Contrato do Repositório** (a *abstract class* no domínio) define **o que** a aplicação precisa fazer, a **Implementação do Repositório** (`class ...Impl`) define **como** isso é feito.

Essa classe atua como um **"escudo protetor"** da aplicação. É responsabilidade dela:

- Orquestrar a chamada à fonte de dados (**PlayifsApiService**).
- Traduzir **dados brutos (DTOs)** em **Entidades de Domínio**.
- Capturar exceções de rede e traduzi-las em exceções de domínio previsíveis, usando a `BaseRepository`.

-----

## 1️⃣ Estrutura e Nomenclatura

- **Localização:** `lib/data/repositories/`
- **Nome do ficheiro:** *snake\_case*, seguindo o padrão

    ```
    [feature]_repository_impl.dart
    ```

- **Estrutura da Classe:**
  - Deve usar `extends BaseRepository` e `implements [Feature]Repository`.
  - A fonte de dados (`PlayifsApiService`) é recebida via **injeção de dependência** no construtor.
  - O construtor deve ser o **primeiro membro** declarado.

-----

## 2️⃣ O Padrão Arquitetural — A `BaseRepository`

Para garantir **tratamento de erros consistente, centralizado e robusto**, todas as implementações de repositório **DEVEM** estender a classe `BaseRepository`.

**🎯 Justificativa Arquitetural:**

- **Centralização (DRY):** Evita a repetição de blocos `try-catch`. A lógica de tratamento de erros existe em **um único lugar**.
- **Consistência:** Todas as falhas seguem a *Jornada de um Erro* de forma idêntica.
- **Manutenibilidade:** Se a lógica de tratamento de erros precisar de ser atualizada, a alteração é feita apenas na `BaseRepository`.

-----

### 2.1. A Implementação Canónica da `BaseRepository`

Esta classe é a "fonte da verdade" para a tradução de erros na camada de dados. Ela já existe no projeto e não deve ser alterada.

```dart
// Ficheiro: lib/data/repositories/base_repository.dart

import 'package:dio/dio.dart';
import 'package:playifs_frontend/core/network/exceptions.dart';
import 'package:playifs_frontend/core/network/result.dart';

abstract class BaseRepository {
  Future<Result<T>> handleApiCall<T>(Future<T> Function() apiCall) async {
    try {
      return Result.success(await apiCall());
    } on DioException catch (e) {
      // 1. INSPECIONA O ERRO ENRIQUECIDO
      if (e.error is ValidationException) {
        // 2. PRESERVA A EXCEÇÃO ESPECÍFICA
        return Result.failure(e.error as ValidationException);
      }

      // 3. TRADUZ OUTROS ERROS DE REDE
      final message = e.response?.data?['error'] ?? e.message ?? 'Erro desconhecido';
      return Result.failure(ApiException(
        message,
        statusCode: e.response?.statusCode,
      ));
    } catch (e) {
      // 4. CAPTURA ERROS INESPERADOS
      return Result.failure(ApiException(e.toString()));
    }
  }
}
```

-----

## 3️⃣ A Anatomia de um Método de Repositório

Com a herança da `BaseRepository`, os métodos públicos tornam-se **simples e declarativos**, usando **corpos de expressão** (`=>`) e envolvendo a lógica no método `handleApiCall` herdado.

-----

### **Cenário A — Resposta com Dados a Mapear**

Usado na maioria dos endpoints `GET`, `POST` e `PUT`.

```dart
// Exemplo do SportRepositoryImpl
@override
Future<Result<Page<SportSummary>>> findAll({
  int page = 0,
  int size = 10,
  String? sort,
  Map<String, dynamic>? filters,
}) {
  // O método público apenas prepara os dados e delega para o handleApiCall.
  final queries = {'page': page, 'size': size, 'sort': sort, ...?filters}
    ..removeWhere((key, value) => value == null);

  return handleApiCall(() async {
    // 1. Chama a API.
    final response = await _apiService.findAllSports(queries);
    // 2. Mapeia o DTO para a Entidade de Domínio.
    return response.data.toEntity<SportSummary>((dto) => dto.toEntity());
  });
}
```

-----

### **Cenário B — Resposta sem Dados (`void`)**

Usado em endpoints `DELETE` que retornam **204 No Content**.

```dart
// Exemplo do CompetitionRepositoryImpl
@override
Future<Result<void>> delete(int id) =>
    handleApiCall(() => _apiService.deleteCompetition(id));
```

-----

## 4️⃣ O Exemplo Canónico

Todos os ficheiros `..._repository_impl.dart` recentes seguem este padrão. Um excelente exemplo que cobre todos os cenários (CRUD completo e operações em massa) é:

```
competition_repository_impl.dart
```

Ele demonstra como a herança da `BaseRepository` resulta num código limpo, consistente e focado na sua responsabilidade principal: orquestrar a chamada à API e o mapeamento dos dados.

-----

## ✅ Benefícios de Seguir Este Manual

- **Resiliência:** Erros tratados de forma centralizada e previsível.
- **Legibilidade:** Intenção de cada método é clara e livre de boilerplate.
- **Manutenibilidade:** A lógica de erros evolui num único ficheiro (`base_repository.dart`).
