+++markdown

# Manual de Arquitetura: A Jornada de um Erro *(Fluxo de Ponta a Ponta)*

*(v1.0)*

---

## Prefácio: A Nossa Filosofia de Tratamento de Erros

Na arquitetura do **PlayIFS**, erros não são simples *crashs*.
São **estados válidos** da aplicação.

Objetivo:

> Intercetar qualquer falha (rede, validação, negócio) **o mais cedo possível** e transformá-la em **objetos de estado claros e previsíveis**.

Este manual documenta o **ciclo de vida completo** de um erro, usando o exemplo mais rico:
**422 – Unprocessable Entity (Erro de Validação de Formulário)**

---

## A Jornada de um Erro 422

---

### **Passo 1 — A Interceção** *(Camada de Rede — DioClient)*

**Missão:** Detetar → Parsear → Enriquecer

**Fluxo:**

1. O `Dio` faz uma requisição (ex.: login com campos vazios).
2. O backend retorna **422** → `DioException`.
3. O `onError` do **DioClient** captura a exceção.
4. Verifica o `statusCode == 422`.
5. Parseia o JSON de validação para `ApiValidationError`.
6. Envolve numa `ValidationException` e insere em `error.error`.
7. Rejeita a *Future* com a `DioException` enriquecida.

**Diagrama:**

```
Erro 422 API → DioException → [DioClient] → DioException(error: ValidationException)
```

**Código-chave (`dio_client.dart`):**

```dart
// onError: (error, handler)
if (error.response?.statusCode == 422) {
  final validationErrorData = error.response!.data;
  if (validationErrorData is Map<String, dynamic>) {
    final validationError = ApiValidationError.fromJson(validationErrorData);
    final customError = DioException(
      requestOptions: error.requestOptions,
      error: ValidationException(validationError), // O "enriquecimento"
    );
    return handler.reject(customError);
  }
}
```

---

### **Passo 2 — A Tradução** *(Camada de Dados — RepositoryImpl)*

**Missão:** Converter exceção de baixo nível em `Result` de negócio

**Fluxo:**

1. O `catch` (`on DioException`) no `AuthRepositoryImpl` apanha a exceção enriquecida.
2. Verifica:

   ```dart
   if (e.error is ValidationException)
   ```

3. Traduz para `Result.failure(...)`, passando a `DioException` original.

**Diagrama:**

```
DioException(error: ValidationException) → [RepositoryImpl] → Result.failure(...)
```

**Código-chave (`auth_repository_impl.dart`):**

```dart
// on DioException catch (e)
if (e.error is ValidationException) {
  return Result.failure('Dados inválidos. Verifique os campos.', error: e);
}
```

---

### **Passo 3 — A Distribuição** *(Camada de Apresentação — Provider)*

**Missão:** Distribuir o erro para os estados corretos da UI

**Fluxo:**

1. O `AuthProvider.login` recebe `Result.failure`.
2. O `.when()` executa a *callback* de falha.
3. Ação dupla:

   * **Erro Específico:** Extrai `fieldErrors` de `ValidationException` e atualiza `loginFormErrorsProvider`.
   * **Erro Genérico:** Atualiza `authProvider.state` para `AuthState.failure`.

**Diagrama:**

```
Result.failure → [AuthProvider] →
   loginFormErrorsProvider.state = {'password': 'O campo é obrigatório'}
   authProvider.state = AuthState.failure(...)
```

**Código-chave (`auth_provider.dart`):**

```dart
// failure: (message, error)
if (error is DioException && error.error is ValidationException) {
  final validationErrors = (error.error as ValidationException).errorDetails.errors;
  ref.read(loginFormErrorsProvider.notifier).setErrors(validationErrors);
}
state = AsyncValue.data(AuthState.failure(message));
```

---

### **Passo 4 — A Exibição** *(Camada de UI — Widget)*

**Missão:** Observar estados e apresentar feedback visual

**Fluxo:**

1. **`ref.watch(loginFormErrorsProvider)`**
   → Reconstrói campos com mensagens de erro (ex.: `errorText` do `TextFormField`).
2. **`ref.listen(authProvider, ...)`**
   → Ao mudar para `AuthState.failure`, mostra `SnackBar` genérico.

**Diagrama:**

```
AuthState.failure → [ref.listen] → SnackBar
loginFormErrorsProvider.state → [ref.watch] → TextFormField.errorText
```

**Código-chave (`login_page.dart`):**

```dart
final formErrors = ref.watch(loginFormErrorsProvider);

ref.listen<AsyncValue<AuthState>>(authProvider, (previous, next) {
  next.whenData((state) => state.whenOrNull(
    failure: (message) => ScaffoldMessenger.of(context).showSnackBar(...),
  ));
});

TextFormField(
  decoration: InputDecoration(
    errorText: formErrors['password'],
  ),
)
```

---

## Conclusão

Este fluxo **de ponta a ponta** garante:

* Tratamento **robusto** e **em camadas**.
* Mensagens **claras** para o utilizador.
* Base de código **limpa e desacoplada**.

Erro 422 → Rede → Dados → Apresentação → UI
Nada se perde, tudo é transformado.
+++
