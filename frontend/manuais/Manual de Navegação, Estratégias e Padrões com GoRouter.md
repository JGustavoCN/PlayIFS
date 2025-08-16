-----

# Manual de Navegação: Estratégias e Padrões com `GoRouter`

*(v1.0)*

-----

## Prefácio: A Nossa Filosofia de Navegação

No PlayIFS, a navegação não é apenas sobre mudar de ecrã. Ela é **orientada pelo estado da aplicação**. O estado de autenticação do utilizador (`authProvider`) é a fonte da verdade que dita para onde o utilizador pode ou não ir.

O `GoRouter` é a ferramenta que nos permite implementar esta filosofia de forma robusta e centralizada, através da sua poderosa função de `redirect`.

-----

### **1. A Nossa Lógica de `redirect`: O Guarda da Aplicação**

A função `redirect` no nosso `goRouterProvider` é o guarda de trânsito da nossa aplicação. Antes de qualquer navegação ser concluída, esta função é executada para verificar se o utilizador tem permissão para aceder à rota solicitada.

**Objetivo:** Proteger rotas privadas e guiar o utilizador para o local correto com base no seu estado de autenticação.

**Fluxo Lógico (`app_routes.dart`):**

1. **Observar o Estado:** O `redirect` lê o estado atual do `authProvider` (`ref.read(authProvider)`).
2. **Verificar o Estado de Autenticação:**
      * **Se o utilizador está `authenticated`:**
          * Verificamos se ele está a tentar aceder a uma rota pública que não faz mais sentido (como `/login` ou `/register`).
          * Se sim, redirecionamo-lo para a `HomePage` (`return AppRoutes.home;`).
          * Caso contrário, permitimos a navegação (`return null;`).
      * **Se o utilizador está `unauthenticated` (ou `failure`):**
          * Verificamos se a rota que ele está a tentar aceder é uma das nossas rotas públicas permitidas (`/login`, `/register`).
          * Se **não for**, redirecionamo-lo à força para a `LoginPage` (`return AppRoutes.login;`).
          * Se for uma rota pública permitida, deixamo-lo prosseguir (`return null;`).

**Código-chave (`app_routes.dart`):**

```dart
redirect: (BuildContext context, GoRouterState state) {
  final authState = ref.read(authProvider);

  if (authState.isLoading || !authState.hasValue) return null;

  return authState.value!.when(
    // ...
    authenticated: (profile) {
      final location = state.matchedLocation;
      if (location == AppRoutes.login || location == AppRoutes.register) {
        return AppRoutes.home;
      }
      return null;
    },
    unauthenticated: () {
      final location = state.matchedLocation;
      if (location != AppRoutes.login && location != AppRoutes.register) {
        return AppRoutes.login;
      }
      return null;
    },
    // ...
  );
},
```

-----

### **2. A Regra de Ouro: `pushNamed` vs. `goNamed`**

A escolha entre `push` e `go` determina como a pilha de navegação é gerida e afeta diretamente a experiência do utilizador, especialmente a visibilidade do botão "voltar".

#### **Use `pushNamed` (ou `push`)**

* **Quando:** Quando você quer navegar para um ecrã "filho" ou de detalhe, e espera que o utilizador possa **voltar** para o ecrã anterior.
* **O Que Faz:** Empilha (`push`) o novo ecrã por cima do ecrã atual. A `AppBar` do Flutter irá automaticamente detetar que há uma página anterior na pilha e exibirá um botão de "voltar".
* **Exemplo Canónico:** Ir da `HomePage` para a `AthletePage`.

    ```dart
    // Na HomePage, para abrir a lista de atletas
    onTap: () => context.pushNamed(AppRoutes.athletes),
    ```

#### **Use `goNamed` (ou `go`)**

* **Quando:** Quando você está a fazer uma transição entre seções principais da aplicação ou a resetar um fluxo. Não haverá um botão de "voltar".
* **O Que Faz:** Substitui a pilha de navegação atual pela nova rota. É como saltar de um "ramo" da aplicação para outro.
* **Exemplo Canónico:** Ir da `RegistrationPage` para a `HomePage` após um registo bem-sucedido. O utilizador não deve poder "voltar" para o formulário de registo.

    ```dart
    // Na RegistrationPage, após o sucesso
    context.goNamed(AppRoutes.home);
    ```

-----

### **3. Padrão para Rotas com Parâmetros**

Muitas das nossas telas (como a de edição) precisam de um identificador (ID) para saber qual recurso carregar.

**Objetivo:** Definir rotas que aceitem parâmetros e extraí-los de forma segura no widget de destino.

**Modo de Preparo:**

1. **Definir a Rota com Parâmetro:** Na sua classe `AppRoutes`, defina a constante do caminho usando a sintaxe `:id`.

    ```dart
    // Em lib/core/routing/app_routes.dart
    class AppRoutes {
      // ...
      static const String editAthlete = '/athletes/:id/edit';
    }
    ```

2. **Configurar a `GoRoute`:** No `builder` da sua `GoRoute`, aceda aos parâmetros através de `state.pathParameters`. Lembre-se de fazer o `parse` do valor, pois ele virá sempre como uma `String`.

    ```dart
    // Em lib/core/routing/app_routes.dart
    GoRoute(
      path: AppRoutes.editAthlete,
      name: AppRoutes.editAthlete,
      builder: (context, state) {
        // Extrai o parâmetro 'id' e converte-o para int.
        final athleteId = int.parse(state.pathParameters['id']!);
        return EditAthletePage(athleteId: athleteId);
      },
    ),
    ```

3. **Navegar com Parâmetros:** Ao chamar `pushNamed` ou `goNamed`, passe um `Map` para o argumento `pathParameters`.

    ```dart
    // Na AthletesList, para editar um atleta
    onTap: () {
      context.pushNamed(
        AppRoutes.editAthlete,
        pathParameters: {'id': athlete.id.toString()},
      );
    },
    ```

Seguir estes padrões garante que a navegação na nossa aplicação seja segura, previsível, e perfeitamente integrada com o nosso sistema de gestão de estado.
