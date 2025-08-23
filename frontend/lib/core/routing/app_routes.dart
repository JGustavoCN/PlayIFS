import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/presentation/providers/auth/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/pages/admin/campuses/campuses_page.dart';
import '../../presentation/pages/admin/courses/courses_page.dart';
import '../../presentation/pages/admin/sports/sports_page.dart';
import '../../presentation/pages/athlete/athlete_page.dart';
import '../../presentation/pages/athlete/batch_create_athlete_page.dart';
import '../../presentation/pages/athlete/edit_athlete_page.dart';
import '../../presentation/pages/auth/login_page.dart';
import '../../presentation/pages/auth/registration_page.dart';
import '../../presentation/pages/competition/competition_details_page.dart';
import '../../presentation/pages/competition/competition_form_page.dart';
import '../../presentation/pages/competition/competition_list_page.dart';
import '../../presentation/pages/designated_coach/designated_coach_details_page.dart';
import '../../presentation/pages/designated_coach/designated_coach_list_page.dart';
import '../../presentation/pages/designated_coach/edit_designated_coach_page.dart';
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

  // ✅ 1. ADICIONAR AS NOVAS CONSTANTES DE ROTA ADMINISTRATIVAS
  static const String sports = '/admin/sports';
  static const String campuses = '/admin/campuses';
  static const String courses = '/admin/courses';

  // ✅ 1. ADICIONAR AS NOVAS CONSTANTES DE ROTA PARA COMPETIÇÕES
  static const String competitions = '/admin/competitions';
  static const String competitionDetails = '/competitions/:id';
  static const String createCompetition = '/competitions/new';
  static const String editCompetition = '/competitions/:id/edit';

  static const String designatedCoaches = '/competitions/:id/coaches';
  static const String designatedCoachDetails = '/designated-coaches/:id';
  static const String editDesignatedCoach = '/designated-coaches/:id/edit';

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
      GoRoute(
        path: AppRoutes.sports,
        name: AppRoutes.sports,
        builder: (context, state) => const SportsPage(),
      ),
      GoRoute(
        path: AppRoutes.campuses,
        name: AppRoutes.campuses,
        builder: (context, state) => const CampusesPage(),
      ),
      GoRoute(
        path: AppRoutes.courses,
        name: AppRoutes.courses,
        builder: (context, state) => const CoursesPage(),
      ),
      // ✅ 2. ADICIONAR AS NOVAS ROTAS DE COMPETIÇÃO
      GoRoute(
        path: AppRoutes.createCompetition,
        name: AppRoutes.createCompetition,
        builder: (context, state) => const CompetitionFormPage(),
      ),
      GoRoute(
        path: AppRoutes.editCompetition,
        name: AppRoutes.editCompetition,
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return CompetitionFormPage(competitionId: id);
        },
      ),
      GoRoute(
        path: AppRoutes.competitions,
        name: AppRoutes.competitions,
        builder: (context, state) => const CompetitionListPage(),
      ),
      GoRoute(
        path: AppRoutes.competitionDetails,
        name: AppRoutes.competitionDetails,
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return CompetitionDetailsPage(competitionId: id);
        },
      ),

      GoRoute(
        path: AppRoutes.designatedCoaches,
        name: AppRoutes.designatedCoaches,
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return DesignatedCoachListPage(competitionId: id);
        },
      ),
      GoRoute(
        path: AppRoutes.designatedCoachDetails,
        name: AppRoutes.designatedCoachDetails,
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return DesignatedCoachDetailsPage(designationId: id);
        },
      ),
      GoRoute(
        path: AppRoutes.editDesignatedCoach,
        name: AppRoutes.editDesignatedCoach,
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          // Nota: A página de edição precisará de buscar os detalhes para passar ao formulário.
          return EditDesignatedCoachPage(designationId: id);
        },
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