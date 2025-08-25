Com certeza. A sua solicitação é a marca de um desenvolvedor experiente: aprender com os erros e, mais importante, **sistematizar o conhecimento para que não se repitam**. É exatamente para isso que os nossos manuais servem.

Você está certo, o manual de providers pode e deve ser melhorado para incluir uma seção sobre os "anti-padrões" que encontramos e corrigimos juntos. Isso tornará o documento uma ferramenta de aprendizado ainda mais poderosa.

Como seu Arquiteto, revisei e expandi o **Manual para Providers**. Incorporei os nossos aprendizados recentes numa nova seção dedicada a "O que NÃO fazer", com explicações claras sobre o porquê de cada correção.

Aqui está o manual completo e atualizado.

-----

## Manual de Arquitetura: Padrão para Providers (Riverpod Notifiers)

*(v2.1 - Revisado com Antipadrões)*

-----

### Prefácio: A Missão de um Provider

Na nossa arquitetura, um **Notifier** (e seus derivados, como `AsyncNotifier`) é o **cérebro do estado de uma funcionalidade**. Ele é o intermediário que:

* Expõe o **estado** (`loading`, `data`, `error`) de forma reativa.
* Recebe **eventos da UI** (ex: clique num botão).
* Invoca **UseCases** da camada de Domínio.
* Atualiza o seu próprio estado com o resultado, **reconstruindo a UI automaticamente**.

-----

### Orquestração de Estado: A Regra de Ouro (UI como Orquestrador)

A nossa lição mais importante foi a distinção entre `providers` que gerem dados e `providers` que executam ações, e quem é responsável por orquestrar as consequências.

#### Providers de Dados vs. Providers de Ação

1. **Provider de Dados (ex: `TeamsNotifier`, `ProfileNotifier`)**

      * **Missão:** Buscar e manter um estado de dados. Geralmente é um `AsyncNotifier<Entidade>`.
      * O seu método `build` é a sua principal responsabilidade.
      * Pode ter métodos para interações como `fetchNextPage` ou `refresh`.
      * **Pode conter métodos de mutação**, mas estes **não devem** colocar o provider inteiro em estado de `loading`, para não fazer a UI piscar (veja a seção de antipadrões).

2. **Provider de Ação (ex: `TeamFormProvider`)**

      * **Missão:** Executar uma única ação de mutação (criar, atualizar, etc.), geralmente a partir de um formulário.
      * Seu estado (`AsyncValue<void>` ou um `State` customizado) representa apenas o ciclo de vida *dessa ação*.
      * **Regra Crítica:** Em caso de sucesso, este `provider` deve invalidar os `providers` de dados que ele afeta diretamente (ex: `ref.invalidate(teamsNotifierProvider)`). Ele **não deve** tomar decisões sobre navegação.

#### A UI como Orquestrador

A responsabilidade de orquestrar ações complexas pós-sucesso pertence **exclusivamente ao widget que iniciou a ação** (ex: o método `_submitForm`), pois só ele tem o contexto completo para decidir se deve navegar, mostrar um SnackBar, etc.

-----

### Regras de Arquitetura e Estilo (Resumo)

* **Localização:** `lib/presentation/providers/[feature]/`
* **Nome do ficheiro:** `snake_case_provider.dart`
* **Estrutura:** Use sempre a anotação `@riverpod`.
* **Nomenclatura da Classe:** Use o sufixo `Notifier` (ex: `TeamsNotifier`). O `riverpod_generator` criará o provider global com o nome `teamsNotifierProvider`.
* **Imutabilidade:** Nunca modifique o estado diretamente (`state.value.name = ...`). Sempre atribua uma nova instância (`state = ...`).
* **Dependências:** Use o `locator` (GetIt) para obter instâncias de `UseCases`.
* **Composição:** Use `ref.watch` no método `build` para reagir a outros `providers`.

-----

### 🆕 Antipadrões e Correções Comuns (O que NÃO fazer)

Esta seção documenta os erros mais comuns na implementação de providers e como corrigi-los, baseando-se nos nossos aprendizados.

#### 1\. Tratar `Result` com `.fold()`

* ❌ **Incorreto:**

    ```dart
    // final result = await _useCase();
    return result.fold(
      (success) => success,
      (failure) => throw failure,
    );
    ```

* 🧐 **Por que está errado?** A nossa classe `Result` (`lib/core/network/result.dart`) é uma união `freezed`. O método padrão para tratar os seus casos (`Success` e `Failure`) é `.when()`. O método `.fold()` não existe na nossa implementação.
* ✅ **Correto:**

    ```dart
    // final result = await _useCase();
    return result.when(
      success: (data) => data,
      failure: (error) => throw error,
    );
    ```

#### 2\. Colisão de Nomes entre Provider e Entidade

* ❌ **Incorreto:**

    ```dart
    @riverpod
    class TeamDetails extends _$TeamDetails {
      @override
      Future<TeamDetails> build(int id) { ... } // ERRO: Qual TeamDetails? A classe ou a entidade?
    }
    ```

* 🧐 **Por que está errado?** Usar o mesmo nome para a classe do `Notifier` e para a `Entidade` que ele gere cria ambiguidade, levando a erros de compilação como `"The getter 'id' isn't defined for the type 'TeamDetails'"`, pois o compilador pensa que você se refere à classe do provider (que não tem `id`).
* ✅ **Correto:** Use o sufixo `Notifier` no nome da classe. O `riverpod_generator` criará um provider com um nome limpo e previsível (`teamDetailsNotifierProvider`).

    ```dart
    import 'package/playifs_frontend/domain/entities/team/team_details.dart';

    @riverpod
    class TeamDetailsNotifier extends _$TeamDetailsNotifier {
      @override
      Future<TeamDetails> build(int id) { ... } // OK: O tipo de retorno é a entidade importada.
    }
    ```

#### 3\. Manipulação Incorreta do Estado `AsyncValue`

* ❌ **Incorreto (Múltiplos Antipadrões):**

    ```dart
    // Tentativa de modificar um estado imutável
    state = const AsyncLoading()..value = state.value;

    // Uso de API interna do Riverpod
    state = const AsyncLoading().copyWithPrevious(state);

    // Uso de getter que não existe na API pública
    final teamId = state.valueOrNull?.id;
    ```

* 🧐 **Por que está errado?** `AsyncValue` é **imutável**. Não podemos modificar suas propriedades. Além disso, métodos como `copyWithPrevious` são para uso interno do Riverpod e podem quebrar em futuras atualizações.
* ✅ **Correto:**
  * **Para aceder ao dado:** Use `state.value`. O operador `?.` (`state.value?.id`) garante a segurança contra nulos se o valor ainda não estiver presente.
  * **Para mutações em Providers de Dados:** **Não altere** o estado do provider para `loading`. O método deve ser `async`, e a UI que o chama é responsável por exibir um indicador de loading (ex: num botão). O provider só atualiza seu estado ao final da operação.
        ```dart
        // Em um Data Provider (ex: TeamDetailsNotifier)
        Future<void> removeSingleAthlete(int athleteId) async {
          // NENHUMA alteração no 'state' aqui.
          final teamId = state.value?.id;
          if (teamId == null) return;

          final result = await _useCase(teamId: teamId, athleteId: athleteId);

          result.when(
            success: (_) => ref.invalidateSelf(), // Define o estado final
            failure: (error) => state = AsyncError(error, StackTrace.current), // Define o estado final
          );
        }
        ```

-----

### Exemplos Canónicos Atualizados

#### Exemplo A — Provider de Dados com Método de Mutação

**Ficheiro:** `lib/presentation/providers/team/team_details_provider.dart`

```dart
@riverpod
class TeamDetailsNotifier extends _$TeamDetailsNotifier {
  // ... injeção de dependências ...

  @override
  Future<TeamDetails> build(int teamId) async {
    final result = await _findTeamByIdUseCase(teamId);
    return result.when(
      success: (team) => team,
      failure: (error) => throw error,
    );
  }

  // Método de mutação que não altera o estado para loading.
  Future<void> removeSingleAthlete(int athleteId) async {
    final teamId = state.value?.id;
    if (teamId == null) return;

    final result = await _removeAthleteUseCase(teamId: teamId, athleteId: athleteId);

    result.when(
      success: (_) {
        ref.invalidateSelf(); // Recarrega os dados com sucesso.
        ref.invalidate(teamsNotifierProvider); // Invalida a lista.
      },
      failure: (error) => state = AsyncError(error, StackTrace.current),
    );
  }
}
```

#### Exemplo B — Provider de Ação Puro

**Ficheiro:** `lib/presentation/providers/team/team_form_provider.dart`

```dart
@riverpod
class TeamForm extends _$TeamForm {
  // ... injeção de dependências ...

  @override
  TeamFormState build({TeamDetails? initialTeam}) { // O estado aqui NÃO é um AsyncValue.
    return TeamFormState(name: initialTeam?.name ?? '');
  }

  // O método de submissão retorna um Future, mas não altera o estado do provider
  // para loading/error, pois a UI irá tratar isso.
  Future<bool> submit({required ...}) async {
    final result = await _useCase(...);

    return result.when(
      success: (_) {
        ref.invalidate(teamsNotifierProvider); // Invalida a lista afetada.
        return true;
      },
      failure: (error) {
        // A UI pode usar um try/catch na chamada a `submit` ou
        // o provider pode expor o erro numa propriedade separada do estado.
        return false;
      },
    );
  }
}
```
