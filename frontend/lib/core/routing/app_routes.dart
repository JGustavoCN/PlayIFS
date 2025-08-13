// Ficheiro: lib/core/routing/app_routes.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/pages/auth/login_page.dart';
import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/splash/splash_page.dart';
import '../../presentation/providers/auth/auth_provider.dart';
import '../../presentation/providers/auth/auth_state.dart';

part 'app_routes.g.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
// ... outras rotas
}

class GoRouterRefreshNotifier extends ChangeNotifier {
  GoRouterRefreshNotifier(this._ref) {
    _subscription = _ref.listen(
      authProvider,
          (previous, next) => notifyListeners(),
    );
  }

  final Ref _ref;
  late final ProviderSubscription _subscription;

  @override
  void dispose() {
    _subscription.close();
    super.dispose();
  }
}

final goRouterRefreshNotifierProvider = Provider(
      (ref) => GoRouterRefreshNotifier(ref),
);

@riverpod
GoRouter goRouter(Ref ref) {
  final refreshNotifier = ref.watch(goRouterRefreshNotifierProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: refreshNotifier,

    // VERIFIQUE A LISTA DE ROTAS AQUI
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      // A ROTA PARA O LOGIN DEVE ESTAR AQUI, DEFINIDA E NÃO COMENTADA
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      // Adicione aqui os builders para todas as suas outras rotas
    ],

    redirect: (BuildContext context, GoRouterState state) {
      final authState = ref.read(authProvider);

      // A lógica de redirect está correta, mas ela precisa que a rota /login exista.
      if (authState.isLoading) return null;

      if (authState.hasValue) {
        return authState.value!.when(
          initial: () => null,
          loading: () => null,
          failure: (_) => null,
          authenticated: (profile) {
            final location = state.matchedLocation;
            if (location == AppRoutes.login || location == AppRoutes.splash) {
              return AppRoutes.home;
            }
            return null;
          },
          unauthenticated: () {
            final location = state.matchedLocation;
            if (location != AppRoutes.login) {
              return AppRoutes.login;
            }
            return null;
          },
        );
      }

      // Se houver um erro na inicialização do authProvider, vai para o login.
      return AppRoutes.login;
    },

    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Página não encontrada: ${state.error}'),
      ),
    ),
  );
}