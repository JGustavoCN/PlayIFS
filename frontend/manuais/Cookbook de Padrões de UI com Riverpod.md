-----

# Cookbook de Padrões de UI com Riverpod

*(v1.0)*

-----

## Prefácio: Porquê um Cookbook?

Enquanto outros manuais definem a *arquitetura*, este cookbook fornece **"receitas"** de código prontas a usar para os desafios de UI mais comuns no PlayIFS. O objetivo é simples: **não reinventar a roda**.

Ao seguir estas receitas, garantimos que todas as nossas telas de listas, formulários e ações contextuais tenham a mesma experiência de utilizador robusta e previsível.

-----

### **Receita 1: Ecrã de Lista com Paginação Infinita, Pesquisa e Ações**

**Objetivo:** Construir um ecrã de listagem de dados que carrega mais itens à medida que o utilizador rola (`infinite scroll`), permite a filtragem por texto e suporta ações contextuais (como seleção múltipla).

**Ingredientes Chave:**

* Uma página `ConsumerStatefulWidget` (ex: `AthletePage`).
* Um widget de lista `ConsumerStatefulWidget` (ex: `AthletesList`).
* Um `provider` de pesquisa `Notifier` (ex: `AthleteSearchQuery`).
* Um `provider` de dados `AsyncNotifier` (ex: `AthleteList`).
* Um `ScrollController`.

**Modo de Preparo:**

1. **Levantar o Estado Contextual (`lift state up`):** A página principal (`AthletePage`) é responsável pelo `Scaffold` e por gerir o estado que afeta toda a tela, como o "modo de seleção". Ela renderiza condicionalmente a `BottomAppBar` ou o `FloatingActionButton`.

2. **Passar o Estado e Callbacks:** A página passa o estado de seleção (`selectedIds`) e um callback (`onSelectionChanged`) para o widget da lista (`AthletesList`). A lista torna-se um "widget controlado".

3. **Implementar a Paginação Infinita:** No `initState` do widget da lista, adicione um `listener` ao `ScrollController`. Quando o utilizador se aproximar do fim da lista, chame o método `fetchNextPage` do seu `provider` de dados.

    ```dart
    // Em _AthletesListState
    void _onScroll() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.8) {
        // Envolve a chamada num try-catch para tratar erros de paginação
        try {
          ref.read(athleteListProvider.notifier).fetchNextPage();
        } catch (e) {
          // Mostra um SnackBar sem destruir a UI
          ScaffoldMessenger.of(context).showSnackBar(...);
        }
      }
    }
    ```

4. **Implementar o Pull-to-Refresh:** Envolva a sua `ListView` num widget `RefreshIndicator`. A sua função `onRefresh` deve invalidar o `provider` de dados para forçar uma recarga a partir do zero.

    ```dart
    // Em AthletesList -> build
    RefreshIndicator(
      onRefresh: () async {
        widget.onSelectionChanged({}); // Limpa a seleção
        await ref.refresh(athleteListProvider.future);
      },
      child: ListView.builder(...),
    );
    ```

5. **Conectar a Pesquisa:** O `provider` de dados (`AthleteList`) deve usar `ref.watch` no `provider` de pesquisa (`AthleteSearchQuery`). Isto garante que, sempre que a pesquisa mudar, a lista será reconstruída e filtrada automaticamente.

-----

### **Receita 2: Formulário Robusto (Criação/Edição)**

**Objetivo:** Construir um formulário para criar ou editar dados que forneça feedback claro ao utilizador (carregamento, sucesso) e que trate de forma granular os erros de validação vindos do backend.

**Ingredientes Chave:**

* Um `ConsumerStatefulWidget` (ex: `EditAthletePage`).
* Uma `GlobalKey<FormState>`.
* Um `provider` de ação `Notifier` com estado `AsyncValue<void>` (ex: `AthleteForm`).
* Um estado local para os erros de campo (ex: `Map<String, String> _fieldErrors`).

**Modo de Preparo:**

1. **Estrutura do Widget:** Use um `ConsumerStatefulWidget` para gerir os `TextEditingController`s e a `GlobalKey` do formulário.

2. **Gerir o Estado de Carregamento:** Observe (`ref.watch`) o `provider` do formulário para obter o estado `isLoading`. Use este estado para desabilitar os campos e o botão de submissão, e para exibir um `CircularProgressIndicator`.

3. **Ouvir por Efeitos Colaterais (`ref.listen`):** No método `build`, use `ref.listen` para reagir às mudanças de estado do `provider` do formulário. Este é o local para mostrar `SnackBar`s ou, crucialmente, para tratar os erros.

4. **Tratamento de Erro Granular:** Dentro do `ref.listen`, no *callback* de erro, verifique o tipo da exceção recebida.

      * **Se for `ValidationException`:** Faça um `setState` e popule o mapa `_fieldErrors` com os erros vindos da API.
      * **Se for `ApiException`:** Verifique a mensagem ou o `statusCode` para tratar casos de negócio específicos (ex: "matrícula já existe") ou mostre um erro genérico.

    <!-- end list -->

    ```dart
    // Em _EditAthleteFormState -> build
    ref.listen<AsyncValue<void>>(athleteFormProvider, (_, state) {
      state.whenOrNull(
        error: (err, stack) {
          setState(() {
            if (err is ValidationException) {
              _fieldErrors = { for (var e in err.errorDetails.errors) e.fieldName: e.message };
            } else if (err is ApiException) {
              _fieldErrors = {'form': err.message}; // Erro geral do formulário
            }
          });
        },
      );
    });
    ```

5. **Conectar a UI aos Erros:** No `TextFormField`, use o mapa `_fieldErrors` para preencher a propriedade `errorText` da `InputDecoration`.

    ```dart
    // Em _EditAthleteFormState -> build
    TextFormField(
      controller: _registrationController,
      decoration: InputDecoration(
        labelText: 'Matrícula',
        errorText: _fieldErrors['registration'],
      ),
      ...
    );
    ```

-----

### **Receita 3: Ações de UI em Contexto (Seleção Múltipla)**

**Objetivo:** Implementar um padrão onde a UI se adapta para mostrar ações contextuais, como uma barra de exclusão em massa que aparece quando itens de uma lista são selecionados.

**Ingredientes Chave:**

* Um `ConsumerStatefulWidget` pai (a Página, ex: `AthletePage`).
* Um `ConsumerStatefulWidget` filho (a Lista, ex: `AthletesList`).
* Um estado de seleção (ex: `Set<int>`).
* Um `ValueChanged` callback.

**Modo de Preparo:**

1. **Levantar o Estado (`Lift State Up`):** A página pai (`AthletePage`) deve ser a dona do estado de seleção (`final Set<int> _selectedAthleteIds`). Isto é crucial porque a página controla o `Scaffold` e, portanto, pode decidir qual widget inferior renderizar (`FloatingActionButton` ou `BottomAppBar`).

2. **Passar Estado e Callbacks:** A `AthletePage` passa o `Set` de IDs selecionados e uma função de callback (`onSelectionChanged`) para a `AthletesList`.

3. **Notificar o Pai:** A `AthletesList` não modifica o seu próprio estado. Quando um item é selecionado (via `onTap` ou `onLongPress`), ela cria uma nova cópia do `Set`, adiciona/remove o ID, e chama `widget.onSelectionChanged(newSelection)` para notificar a página pai da mudança.

4. **Renderização Condicional no Pai:** A `AthletePage`, no seu método `build`, usa o estado `_isSelectionMode` para decidir qual widget renderizar no `Scaffold`.

    ```dart
    // Em _AthletePageState -> build
    return Scaffold(
      // ...
      floatingActionButton: isCoordinator && !_isSelectionMode
        ? FloatingActionButton(...) // Mostra o FAB de adicionar
        : null,
      bottomNavigationBar: isCoordinator && _isSelectionMode
        ? BottomAppBar(...) // Mostra a barra de ações em massa
        : null,
    );
    ```

Este padrão cria uma separação de responsabilidades limpa e resolve problemas de sobreposição de UI, permitindo que a página orquestre a sua própria estrutura com base no estado que é gerido e modificado pelos seus filhos.
