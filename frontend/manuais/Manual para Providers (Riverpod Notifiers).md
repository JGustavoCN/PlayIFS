-----

# Manual de Arquitetura: Padrão para Providers (Riverpod Notifiers)

*(v2.0 - Revisado)*

-----

## Prefácio: A Missão de um Provider

Na nossa arquitetura, um **Notifier** (e seus derivados, como `AsyncNotifier`) é o **cérebro do estado de uma funcionalidade**. Ele é o intermediário que:

* Expõe o **estado** (`loading`, `data`, `error`) de forma reativa.
* Recebe **eventos da UI** (ex: clique num botão).
* Invoca **UseCases** da camada de Domínio.
* Atualiza o seu próprio estado com o resultado, **reconstruindo a UI automaticamente**.

-----

## Orquestração de Estado: A Regra de Ouro (UI como Orquestrador)

A nossa lição mais importante foi a distinção entre `providers` que gerem dados e `providers` que executam ações, e quem é responsável por orquestrar as consequências.

### Providers de Dados vs. Providers de Ação

1. **Provider de Dados (ex: `AthleteList`, `ProfileNotifier`)**

      * **Missão:** Buscar e manter um estado de dados. Geralmente é um `AsyncNotifier`.
      * O seu método `build` é a sua principal responsabilidade.
      * Pode ter métodos para interações simples como `fetchNextPage` ou `refresh`.

2. **Provider de Ação (ex: `AthleteForm`)**

      * **Missão:** Executar uma única ação (mutação), como criar, atualizar ou apagar algo.
      * O seu estado (ex: `AsyncValue<void>`) representa apenas o ciclo de vida dessa ação (`loading`, `error`, `success`).
      * **Regra Crítica:** Em caso de sucesso, este `provider` deve invalidar **apenas** os `providers` de dados que ele afeta diretamente (ex: `ref.invalidate(athleteListProvider)`). Ele **não deve** tomar decisões sobre navegação ou sobre o estado de outras telas.

### A UI como Orquestrador

A responsabilidade de orquestrar ações complexas pós-sucesso pertence **exclusivamente ao widget que iniciou a ação** (ex: o método `_submitForm` na `EditAthletePage`), pois só ele tem o contexto completo.

**Exemplo Canónico (`edit_athlete_page.dart`):**
Este é o padrão que evita *race conditions* e garante um fluxo de estado previsível.

```dart
// Future<void> _submitForm() async
if (success && mounted) {
  final authState = ref.read(authProvider).value;
  final isEditingSelf = authState?.maybeWhen(
    authenticated: (profile) => profile.athleteDetails?.id == widget.athlete.id,
    orElse: () => false,
  ) ?? false;

  // Se a matrícula mudou E o utilizador está a editar o seu próprio perfil...
  if (isEditingSelf && oldRegistration != newRegistration) {
    // Ação da UI: Mostrar SnackBar e chamar o logout
    scaffoldMessenger.showSnackBar(...);
    await ref.read(authProvider.notifier).logout();
  } else {
    // Se não, a UI decide se precisa de atualizar a HomePage...
    if (isEditingSelf) {
      await ref.refresh(profileNotifierProvider.future);
    }
    // E então, a UI decide o que fazer a seguir (voltar).
    scaffoldMessenger.showSnackBar(...);
    navigator.pop();
  }
}
```

-----

## Regras de Arquitetura e Estilo (Resumo)

* **Localização:** `lib/presentation/providers/[feature]/`
* **Nome do ficheiro:** `snake_case.dart`
* **Estrutura:** Use sempre `@riverpod`.
* **Imutabilidade:** Nunca modifique o estado diretamente (`state.value.name = ...`). Sempre atribua uma nova instância (`state = ...`).
* **Dependências:** Use o `locator` para obter `UseCases`.
* **Composição:** Use `ref.watch` no método `build` para reagir a outros `providers`.

-----

## Exemplos Canónicos Atualizados

### Exemplo A — Provider de Dados Reativo *(ProfileNotifier)*

**Ficheiro:** `lib/presentation/providers/profile/profile_provider.dart`

```dart
@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<Profile> build() async {
    // Observa o 'authProvider' para reagir a login/logout.
    final authState = ref.watch(authProvider);

    return authState.maybeWhen(
      data: (state) => state.maybeWhen(
        authenticated: (profile) => profile,
        // Se não estiver autenticado, o provider entra em estado de erro.
        orElse: () => throw Exception('Utilizador não autenticado.'),
      ),
      // Se o authProvider estiver a carregar ou em erro, propaga o erro.
      orElse: () => throw Exception('Sessão de utilizador inválida.'),
    );
  }

  /// Permite uma atualização otimista do estado sem uma nova chamada à API.
  void replace(Profile newProfile) {
    state = AsyncValue.data(newProfile);
  }
}
```

### Exemplo B — Provider de Ação Simples *(AthleteForm)*

**Ficheiro:** `lib/presentation/providers/athlete/athlete_form_provider.dart`

```dart
@riverpod
class AthleteForm extends _$AthleteForm {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<bool> updateAthlete(int id, AthleteUpdate data) async {
    state = const AsyncValue.loading();
    final updateUseCase = locator<UpdateAthleteUseCase>();
    final result = await updateUseCase.execute(id, data);

    return result.when(
      success: (updatedAthlete) {
        // A única responsabilidade: invalidar a lista diretamente afetada.
        ref.invalidate(athleteListProvider);
        state = const AsyncValue.data(null);
        return true;
      },
      failure: (err) {
        state = AsyncValue.error(err, StackTrace.current);
        return false;
      },
    );
  }
}
```

-----

Este manual **reflete com precisão** a arquitetura robusta e as **melhores práticas** que estabelecemos, garantindo que os próximos ciclos de desenvolvimento sejam mais rápidos e consistentes.
