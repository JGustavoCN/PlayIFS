+++markdown

# Manual de Arquitetura — A Jornada de um Erro *(Fluxo de Ponta a Ponta)*

**v2.0 - Revisado**

---

## 📜 Prefácio — A Nossa Filosofia de Tratamento de Erros

Na arquitetura do **PlayIFS**, erros não são simples *crashs*.
Eles representam **estados válidos e ricos em informação** dentro da aplicação.

**Objetivo:**

> Intercetar qualquer falha (rede, validação, negócio) o mais cedo possível e transformá-la em **objetos de exceção específicos**, permitindo que a UI reaja de forma inteligente e contextual.

Este manual documenta o ciclo de vida completo de um erro usando o exemplo mais rico: **422 – Unprocessable Entity** (*Erro de Validação de Formulário*).

---

## 🚦 A Jornada de um Erro 422

### **Passo 1 — A Interceção e Enriquecimento**

**Camada:** Rede — `DioClient`
**Missão:** *Detetar → Parsear → Enriquecer*

**Fluxo:**

1. O Dio faz uma requisição *(ex.: login com campos vazios)*.
2. O backend retorna **422 → DioException**.
3. O `onError` do `DioClient` captura a exceção.
4. Verifica `statusCode == 422`.
5. Parseia o JSON de validação para o DTO `ApiValidationError`.
6. Cria uma exceção customizada `ValidationException` com os detalhes.
7. Envolve essa exceção em uma nova `DioException` no campo `error`.
8. Rejeita a `Future` com a `DioException` enriquecida.

**Diagrama:**

```
Erro 422 API → DioException → [DioClient] → DioException(error: ValidationException)
```

**Código-chave — `dio_client.dart`:**

```dart
// onError: (error, handler)
if (error.response?.statusCode == 422) {
  final validationErrorData = error.response?.data;
  if (validationErrorData is Map<String, dynamic>) {
    try {
      final validationError = ApiValidationError.fromJson(validationErrorData);
      final customError = DioException(
        requestOptions: error.requestOptions,
        error: ValidationException(validationError),
      );
      return handler.reject(customError);
    } catch (e) { /*...*/ }
  }
}
```

---

### **Passo 2 — A Tradução**

**Camada:** Dados — `RepositoryImpl`
**Missão:** *Converter a exceção de rede em um `Result` de domínio, preservando o contexto.*

**Fluxo:**

1. O método `_handleApiCall` captura a `DioException` enriquecida.
2. Inspeciona `e.error`.
3. Se for `ValidationException`, passa direto para `Result.failure`.
4. Caso contrário, cria uma `ApiException` genérica.
5. Retorna um `Result` com exceção clara e tipada.

**Diagrama:**

```
DioException(error: ValidationException)
→ [_handleApiCall]
→ Result.failure(ValidationException)
```

**Código-chave — `*_repository_impl.dart`:**

```dart
Future<Result<T>> _handleApiCall<T>(Future<T> Function() apiCall) async {
  try {
    return Result.success(await apiCall());
  } on DioException catch (e) {
    if (e.error is ValidationException) {
      return Result.failure(e.error as ValidationException);
    }
    final message = e.response?.data?['error'] ?? e.message;
    return Result.failure(ApiException(message, statusCode: e.response?.statusCode));
  } catch (e) {
    return Result.failure(ApiException(e.toString()));
  }
}
```

---

### **Passo 3 — A Execução da Ação**

**Camada:** Apresentação — `Provider`
**Missão:** *Executar o UseCase e passar o `Result` adiante, sem decidir a UI.*

**Fluxo:**

1. Provider de ação *(ex.: `AthleteForm`)* chama o UseCase.
2. Recebe o `Result` do repositório.
3. Usa `.when()` para definir estado:

   * **Sucesso:** invalida providers de dados relevantes.
   * **Falha:** coloca provider em estado de erro, passando exceção adiante.

**Diagrama:**

```
Result.failure(ValidationException)
→ [AthleteForm Provider]
→ state = AsyncValue.error(ValidationException)
```

**Código-chave — `athlete_form_provider.dart`:**

```dart
return result.when(
  success: (_) {
    ref.invalidate(athleteListProvider);
    state = const AsyncValue.data(null);
    return true;
  },
  failure: (err) {
    state = AsyncValue.error(err, StackTrace.current);
    return false;
  },
);
```

---

### **Passo 4 — A Exibição Contextual**

**Camada:** UI — `Widget`
**Missão:** *Observar estado do provider e apresentar feedback visual correto.*

**Fluxo:**

1. Widget *(ex.: `EditAthletePage`)* usa `ref.listen` para observar `athleteFormProvider`.
2. No callback de erro:

   * Se `err is ValidationException`: extrai erros de campo e atualiza `_fieldErrors` para exibir em cada `TextFormField`.
   * Se `err is ApiException`: mostra `SnackBar` com mensagem genérica.

**Diagrama:**

```
ValidationException → _fieldErrors → TextFormField.errorText
ApiException       → SnackBar
```

**Código-chave — `edit_athlete_page.dart`:**

```dart
ref.listen<AsyncValue<void>>(athleteFormProvider, (_, state) {
  state.whenOrNull(
    error: (err, stack) {
      if (!mounted) return;
      setState(() {
        if (err is ValidationException) {
          _fieldErrors = {
            for (var e in err.errorDetails.errors) e.fieldName: e.message
          };
        } else if (err is ApiException) {
          _fieldErrors = {'form': err.message};
        }
      });
    },
  );
});
```

 Secção 4: O Padrão BaseRepository

4.1. Propósito
Para garantir consistência e evitar a duplicação de código, toda a lógica de tratamento de erros da camada de dados deve ser centralizada numa classe abstrata BaseRepository. Todos os repositórios de implementação (...RepositoryImpl) DEVEM estender esta classe.

4.2. Implementação Oficial do handleApiCall
A BaseRepository deve conter o método handleApiCall, cuja implementação oficial e definitiva é a seguinte:

Dart

// Ficheiro: lib/data/repositories/base_repository.dart
import 'package:dio/dio.dart';
import 'package:playifs_frontend/core/network/exceptions.dart';
import 'package:playifs_frontend/core/network/result.dart';

abstract class BaseRepository {
Future<Result> handleApiCall(Future Function() apiCall) async {
try {
return Result.success(await apiCall());
} on DioException catch (e) {
// 1. INSPECIONA O ERRO ENRIQUECIDO
// Verifica se o DioClient já identificou e anexou uma ValidationException.
if (e.error is ValidationException) {
// 2. PRESERVA A EXCEÇÃO ESPECÍFICA
// Se for um erro de validação, ele o passa adiante intacto.
return Result.failure(e.error as ValidationException);
}

  // 3. TRADUZ OUTROS ERROS DE REDE
  // Para outros erros (404, 500, etc.), cria uma ApiException.
  final message = e.response?.data?['error'] ?? e.message ?? 'Erro desconhecido';
  return Result.failure(ApiException(
    message,
    statusCode: e.response?.statusCode,
  ));
} catch (e) {
  // 4. CAPTURA ERROS INESPERADOS
  // Para qualquer outra coisa (erros de parsing, etc.), envolve numa ApiException.
  return Result.failure(ApiException(e.toString()));
}
}
}

**4.3. Classes de Exceção Oficiais**
O nosso projeto utiliza um conjunto definido e limitado de exceções de rede, localizadas em `lib/core/network/exceptions.dart`. As únicas classes oficiais são:
ValidationException: Para erros de validação (HTTP 422), contendo detalhes dos campos.

ApiException: Para todos os outros erros de API (HTTP 4xx, 5xx) ou erros de programação inesperados.

NÃO fazem parte da nossa arquitetura classes como NetworkException, ClientException ou UnexpectedException. Qualquer referência a elas deve ser considerada um erro
---

## ✅ Conclusão

Este fluxo **garante**:

* Tratamento robusto e em camadas.
* Exceções **tipadas** e ricas em contexto.
* UI capaz de **tomar decisões inteligentes**.
* Base de código limpa, desacoplada e previsível.

**Resumo do caminho:**

```
Erro 422 → Rede → Dados → Apresentação → UI
```

> **Nada se perde, tudo é transformado.**
> +++
