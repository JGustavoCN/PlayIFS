+++markdown

# Manual de Arquitetura: Padrão para Providers (Riverpod Notifiers)

*(v1.2 - Revisado)*

---

## Prefácio: A Missão de um Provider

Na nossa arquitetura, um **Notifier** (e seus derivados, como `AsyncNotifier`) é o **cérebro da UI**. Ele é o intermediário que:

* Expõe o **estado da UI** (`loading`, `data`, `error`) de forma reativa
* Recebe **eventos da UI** (ex: clique num botão)
* Invoca **UseCases** da camada de Domínio
* Atualiza o próprio estado com o resultado da operação, **reconstruindo automaticamente a UI**

---

## Regras de Arquitetura e Estilo para Notifiers

### Estrutura da Classe (`@riverpod`)

* **Localização:** `lib/presentation/providers/[feature]/`
* **Nome do ficheiro:** `snake_case.dart` (ex: `auth_provider.dart`)
* **Nome da classe:** `PascalCase`, terminando com `Notifier` ou com o nome da entidade (ex: `Auth`, `ProfileNotifier`)
* **Implementação:** sempre com `riverpod_generator`

  ```dart
  @riverpod
  class MinhaClasse extends _$MinhaClasse { ... }
  ```

---

### Método `build()` — O Estado Inicial

* **Obrigatório**
* Define o estado inicial do provider
* Para **providers assíncronos**:

  * `build` é `async` e retorna `Future<Estado>`
  * O Riverpod define automaticamente `AsyncLoading` como estado inicial
* Para **providers síncronos**:

  * Retorna diretamente o estado inicial

---

### Métodos de Ação — Interface da UI

* Criar **métodos públicos** (`async` ou não) para cada ação que a UI pode executar
  (ex: `login()`, `logout()`, `refreshProfile()`)
* Estes métodos são a **única forma** da UI alterar o estado do provider

---

### Imutabilidade do Estado *(Regra Crítica)*

* ❌ **Nunca** modificar o estado diretamente:

  ```dart
  state.value.name = 'novo nome';
  ```

* ✅ Sempre atribuir uma **nova instância**:

  ```dart
  state = const AsyncValue.loading();
  state = novoEstado;
  ```

---

### Injeção de Dependência

* O Notifier **não cria** suas dependências
* Deve obtê-las de uma fonte externa, preferencialmente via **service locator** (`locator`)
* Usar para acessar **UseCases** e **Services**

---

### Composição de Providers (`ref.watch`)

* Um provider pode depender de outro
* No `build`, usar `ref.watch(outroProvider)` para criar dependência **reativa**
* Quando o outro provider mudar, este será reconstruído

---

## Exemplos Canónicos

### Exemplo A — Provider de Estado Complexo *(AuthProvider)*

**Ficheiro:** `lib/presentation/providers/auth/auth_provider.dart`

```dart
@riverpod
class Auth extends _$Auth {
  // build assíncrono para definir estado inicial
  @override
  Future<AuthState> build() async {
    final tokenService = locator<TokenStorageService>();
    final getProfileUseCase = locator<GetProfileUseCase>();

    final tokens = await tokenService.getTokens();
    if (tokens == null) {
      return const AuthState.unauthenticated();
    }

    final profileResult = await getProfileUseCase.execute();
    return switch (profileResult) {
      Success(data: final profile) => AuthState.authenticated(profile),
      Failure() => const AuthState.unauthenticated(),
    };
  }

  // Método público para ação da UI
  Future<void> login(String registration, String password) async {
    final loginUseCase = locator<LoginUseCase>();
    final tokenService = locator<TokenStorageService>();
    final getProfileUseCase = locator<GetProfileUseCase>();

    ref.read(loginFormErrorsProvider.notifier).clearErrors();
    state = const AsyncValue.loading();

    final result = await loginUseCase.execute(/*...*/);

    // ... lógica para tratar o resultado e atualizar o estado
  }

  // ... outros métodos
}
```

---

### Exemplo B — Provider Reativo a Outro Provider *(ProfileNotifier)*

**Ficheiro:** `lib/presentation/providers/profile/profile_provider.dart`

```dart
@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<Profile> build() async {
    // Observa o 'authProvider' e reage a mudanças
    final authStateAsync = ref.watch(authProvider);

    final isLoggedIn = authStateAsync.when(
      data: (actualAuthState) => actualAuthState.maybeWhen(
        authenticated: (_) => true,
        orElse: () => false,
      ),
      loading: () => false,
      error: (_, __) => false,
    );

    if (!isLoggedIn) {
      throw Exception('Utilizador não autenticado.');
    }
    
    final getProfileUseCase = locator<GetProfileUseCase>();
    final result = await getProfileUseCase.execute();

    return switch (result) {
      Success(data: final profile) => profile,
      Failure(message: final msg) => throw Exception(msg),
    };
  }
}
```

---

Este manual **reflete com precisão** a arquitetura robusta e as **melhores práticas** aplicadas no código atual.
+++
