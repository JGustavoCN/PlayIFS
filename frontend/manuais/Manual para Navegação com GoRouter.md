+++markdown

# Manual de Arquitetura: Padrão para Navegação com GoRouter

*(v1.0)*

---

## Prefácio: A Missão da Camada de Navegação

A camada de navegação, centralizada no **GoRouter**, tem como objetivo fornecer um sistema de rotas **centralizado**, **seguro** e **reativo**.
Todas as regras de navegação e redirecionamento devem viver aqui, mantendo os widgets de UI **"burros"** — apenas exibindo estado e disparando ações — enquanto a lógica de fluxo fica isolada.

---

## 1. Estrutura Fundamental (`app_routes.dart`)

O arquivo de rotas segue três pilares:

1. **`AppRoutes` — Classe de Constantes**
   Centraliza todos os *paths* como `static const String` para evitar *magic strings*, garantir segurança de tipos e facilitar manutenção.
2. **`GoRouterRefreshNotifier` — A Ponte Reativa**
   Um `ChangeNotifier` que escuta mudanças no `authProvider` e notifica o `GoRouter` para reavaliar *redirects*.
3. **`goRouterProvider` — A Fábrica do Router**
   Um `Provider` do Riverpod que constrói a instância do `GoRouter`, injeta a ponte reativa no `refreshListenable` e define rotas e lógica de redirecionamento.

---

## 2. Adicionando uma Rota Simples

### Passo A — Adicionar a constante da rota

```dart
// lib/core/routing/app_routes.dart
class AppRoutes {
  // ...
  static const String home = '/home';
  static const String myProfile = '/me'; // <-- Nova rota
}
```

### Passo B — Adicionar o `GoRoute`

```dart
// lib/core/routing/app_routes.dart
GoRouter goRouter(Ref ref) {
  return GoRouter(
    // ...
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      // --- ROTA ADICIONADA ---
      GoRoute(
        path: AppRoutes.myProfile,
        name: AppRoutes.myProfile,
        builder: (context, state) => const ProfilePage(),
      ),
    ],
  );
}
```

---

## 3. Passando Parâmetros para uma Rota *(Ex: Detalhes)*

### Passo A — Definir a rota com parâmetro

```dart
class AppRoutes {
  // ...
  static const String competitions = '/competitions';
  static const String competitionDetails = '/competitions/:id'; // <-- Parâmetro
}
```

### Passo B — Ler o parâmetro na tela de destino

```dart
class CompetitionDetailsPage extends StatelessWidget {
  final String competitionId;
  
  const CompetitionDetailsPage({super.key, required this.competitionId});

  @override
  Widget build(BuildContext context) {
    return Text('Detalhes da Competição: $competitionId');
  }
}

// ... definição do GoRoute
GoRoute(
  path: AppRoutes.competitionDetails,
  name: AppRoutes.competitionDetails,
  builder: (context, state) {
    final id = state.pathParameters['id']!;
    return CompetitionDetailsPage(competitionId: id);
  },
),
```

### Passo C — Navegar para a rota

```dart
// Caminho direto
context.go('/competitions/123');

// Forma segura usando nome da rota
context.goNamed(AppRoutes.competitionDetails, pathParameters: {'id': '123'});
```

---

## 4. Navegação Aninhada com `StatefulShellRoute` *(Layouts com NavigationBar)*

Usado para layouts principais com abas, como `BottomNavigationBar` ou `NavigationRail`, mantendo o histórico de cada aba.

### Passo A — Criar o widget "Shell"

```dart
// lib/presentation/widgets/main_scaffold.dart
class MainScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScaffold({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: 'Competições'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
```

### Passo B — Configurar o `StatefulShellRoute`

```dart
routes: [
  // Rotas públicas
  GoRoute(path: AppRoutes.splash, ...),
  GoRoute(path: AppRoutes.login, ...),

  // Shell principal
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) =>
      MainScaffold(navigationShell: navigationShell),
    branches: [
      // Aba Home
      StatefulShellBranch(
        routes: [
          GoRoute(path: AppRoutes.home, builder: (context, state) => const HomePage()),
        ],
      ),
      // Aba Competições
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRoutes.competitions,
            builder: (context, state) => const CompetitionsListPage(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return CompetitionDetailsPage(competitionId: id);
                },
              ),
            ],
          ),
        ],
      ),
      // Aba Perfil
      StatefulShellBranch(
        routes: [
          GoRoute(path: AppRoutes.myProfile, builder: (context, state) => const ProfilePage()),
        ],
      ),
    ],
  ),
],
```

---

✅ Com essa estrutura, sua aplicação terá **navegação por abas robusta**, com **memorização de histórico** em cada aba, mantendo a experiência fluida e previsível.
+++
