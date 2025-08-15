import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/presentation/providers/auth/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/pages/athlete/athlete_page.dart';
import '../../presentation/pages/athlete/batch_create_athlete_page.dart';
import '../../presentation/pages/athlete/edit_athlete_page.dart';
import '../../presentation/pages/auth/login_page.dart';
import '../../presentation/pages/auth/registration_page.dart';
import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/splash/splash_page.dart';
import '../../presentation/providers/auth/auth_provider.dart';

part 'app_routes.g.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String athletes = '/athletes';

  // ✅ 1. ADICIONAR AS NOVAS CONSTANTES
  static const String register = '/register';
  static const String createAthlete = '/athletes/new';
  static const String editAthlete = '/athletes/:id/edit';
  static const String batchCreateAthlete = '/athletes/batch-create';
}

class GoRouterRefreshNotifier extends ChangeNotifier {
  GoRouterRefreshNotifier(this._ref) {
    _ref.listen(
      authProvider,
          (previous, next) => notifyListeners(),
    );
  }

  final Ref _ref;

  @override
  void dispose() {
    // A subscrição é fechada automaticamente pelo provider,
    // mas ter o dispose é uma boa prática.
    super.dispose();
  }
}

final goRouterRefreshNotifierProvider = Provider.autoDispose(
      (ref) => GoRouterRefreshNotifier(ref),
);

@riverpod
GoRouter goRouter(Ref ref) {
  final refreshNotifier = ref.watch(goRouterRefreshNotifierProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: refreshNotifier,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
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
      GoRoute(
        path: AppRoutes.athletes,
        name: AppRoutes.athletes,
        builder: (context, state) => const AthletePage(),
      ),

      // ✅ 2. ADICIONAR AS NOVAS ROTAS
      GoRoute(
        path: AppRoutes.register,
        name: AppRoutes.register,
        builder: (context, state) => const RegistrationPage(),
      ),
      GoRoute(
        path: AppRoutes.editAthlete,
        name: AppRoutes.editAthlete,
        builder: (context, state) {
          // Extrai o parâmetro 'id' da rota.
          final athleteId = int.parse(state.pathParameters['id']!);
          return EditAthletePage(athleteId: athleteId);
        },
      ),
      GoRoute(
        path: AppRoutes.createAthlete,
        name: AppRoutes.createAthlete,
        builder: (context, state) => const RegistrationPage(),
      ),
      GoRoute(
        path: AppRoutes.batchCreateAthlete,
        name: AppRoutes.batchCreateAthlete,
        builder: (context, state) => const BatchCreateAthletePage(),
      ),

    ],
    redirect: (BuildContext context, GoRouterState state) {
      final authState = ref.read(authProvider);

      if (authState.isLoading || !authState.hasValue) return null;

      return authState.value!.when(
        initial: () => null,
        loading: () => null,
          failure: (_) {
            final location = state.matchedLocation;
            // Se o utilizador já está numa rota pública, permite que ele permaneça.
            if (location == AppRoutes.login || location == AppRoutes.register) {
              return null;
            }
            // Se tentar aceder a qualquer outra rota, redireciona para o login.
            return AppRoutes.login;
          },
        authenticated: (profile) {
          final location = state.matchedLocation;
          // Se o utilizador autenticado estiver em 'login', 'splash' ou 'register', redireciona para 'home'.
          if (location == AppRoutes.login ||
              location == AppRoutes.splash ||
              location == AppRoutes.register) {
            return AppRoutes.home;
          }
          return null;
        },
        unauthenticated: () {
          final location = state.matchedLocation;
          // Permite que o utilizador não autenticado aceda apenas a 'login' e 'register'.
          if (location != AppRoutes.login && location != AppRoutes.register) {
            return AppRoutes.login;
          }
          return null;
        },
      );
    },
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Página não encontrada: ${state.error}'),
      ),
    ),
  );
}