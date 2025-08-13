+++markdown

# Manual de Arquitetura: Padrão para Classes de Estado e Resultado

*(v2.0 - Revisado)*

---

## Prefácio: O Propósito do Padrão de Resultado

Em uma aplicação conectada a uma API, qualquer operação pode ter diferentes desfechos:

* Pode ser bem-sucedida
* Pode falhar por um erro de rede
* Pode falhar por dados inválidos

Lidar com isso usando `try/catch` na camada de UI ou retornando `null` é uma receita para **bugs** e **código instável**.

O **padrão `Result`** (e outras classes de estado) resolve isso ao **transformar o desfecho de uma operação num tipo de dado explícito**.
Em vez de a operação “lançar um erro”, ela **retorna uma falha**. Isso nos força a lidar com **todos os cenários possíveis** de forma segura no nosso código.

---

## 1. A Regra de Ouro: Quando Usar Este Padrão?

Use o padrão `sealed class` sempre que **um valor, estado ou evento puder ser uma de várias coisas diferentes que se excluem mutuamente**.

**Exemplos:**

* **Resultado de uma Operação:** um `Result` pode ser `Success` ou `Failure`.
* **Estado de um Provider/Tela:** um `AuthState` pode ser `Initial`, `Loading`, `Authenticated`, `Unauthenticated` ou `Failure`.
* **Eventos de um Formulário:** um `FormEvent` pode ser `Save` ou `Delete`.

---

## 2. O Padrão Arquitetural para Criação de Sealed Classes

### 2.1. Localização e Nome do Ficheiro

* **Classes de estado genéricas e reutilizáveis** (ex: `Result`) → camada core:
  `lib/core/network/`
* **Classes de estado específicas de uma feature** (ex: `AuthState`) → junto aos seus providers:
  `lib/presentation/providers/auth/`

**Convenção de Nomenclatura:**

* **Ficheiro:** `snake_case.dart` (ex: `result.dart`, `auth_state.dart`)
* **Classe:** `PascalCase` (ex: `Result`, `AuthState`)

---

### 2.2. Estrutura Interna e Sintaxe

A estrutura deve seguir o padrão `freezed`:

1. **Imports:**
   `package:freezed_annotation/freezed_annotation.dart`
2. **Diretiva `part`:** deve corresponder ao nome do ficheiro (`snake_case`).
3. **Anotação `@freezed`:** acima da declaração da classe.
4. **Declaração `sealed class`:** usando `with _$NomeDaClasse`.
5. **Definição dos “Casos”**: cada estado é um `const factory` nomeado.

---

## 3. Os Exemplos Canónicos (O Nosso Código)

### Exemplo A — `result.dart` (Tipo genérico de Sucesso/Falha)

```dart
// Ficheiro: lib/core/network/result.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;
  const factory Result.failure(String message, {Object? error}) = Failure<T>;
}
```

---

### Exemplo B — `auth_state.dart` (Máquina de estados específica)

```dart
// Ficheiro: lib/presentation/providers/auth/auth_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/user/profile.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthInitial;
  const factory AuthState.loading() = _AuthLoading;
  const factory AuthState.authenticated(Profile profile) = _AuthAuthenticated;
  const factory AuthState.unauthenticated() = _AuthUnauthenticated;
  const factory AuthState.failure(String message) = _AuthFailure;
}
```

---

## 4. Como Utilizar na Prática (A Vantagem do Método `.when`)

O **freezed** gera um método `.when()` que **nos força a lidar com todos os casos** de forma segura e elegante.

---

### Exemplo A — Consumindo um Estado Assíncrono (`AsyncValue`) com `Result`

```dart
// Dentro de um método de Notifier
final result = await getProfileUseCase.execute(); // Future<Result<Profile>>

// Tratamento seguro usando switch expression
state = switch (result) {
  Success(data: final profile) => AsyncValue.data(AuthState.authenticated(profile)),
  Failure(message: final msg) => AsyncValue.data(AuthState.failure(msg)),
};
```

---

### Exemplo B — Consumindo `AuthState` (uma Sealed Class)

```dart
// No redirect do GoRouter ou num widget a observar o authProvider
final authState = ref.read(authProvider); // AsyncValue<AuthState>

return authState.when(
  loading: () => Text('A carregar...'),
  error: (e, s) => Text('Erro: $e'),
  data: (actualAuthState) {
    return actualAuthState.when(
      initial: () => Text('Inicializando...'),
      loading: () => Text('A fazer login...'),
      authenticated: (profile) => Text('Bem-vindo, ${profile.athleteProfile?.nickname}!'),
      unauthenticated: () => Text('Por favor, faça o login.'),
      failure: (message) => Text('Falha no login: $message'),
    );
  },
);
```

---

## Benefício Principal

Com o `.when()`, **é impossível esquecer de tratar um dos casos**.
Se você adicionar um novo estado à sua sealed class, **o código não compila** até que todos os pontos que usam `.when()` tratem o novo caso.

Isso elimina **uma classe inteira de bugs** em tempo de execução.
+++
