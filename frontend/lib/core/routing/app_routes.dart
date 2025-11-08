import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/presentation/providers/auth/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/team/team_details.dart';
import '../../presentation/pages/admin/campuses/campuses_page.dart';
import '../../presentation/pages/admin/courses/courses_page.dart';
import '../../presentation/pages/admin/sports/sports_page.dart';
import '../../presentation/pages/athlete/athlete_page.dart';
import '../../presentation/pages/athlete/athlete_selection_page.dart';
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
import '../../presentation/pages/designated_coach/my_designations_page.dart';
// ✅ 1. IMPORTS PARA AS NOVAS PÁGINAS
import '../../presentation/pages/game/game_batch_reschedule_page.dart';
import '../../presentation/pages/game/game_batch_results_page.dart';
import '../../presentation/pages/game/game_details_page.dart';
import '../../presentation/pages/game/games_list_page.dart';
import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/splash/splash_page.dart';
import '../../presentation/pages/team/team_details_page.dart';
import '../../presentation/pages/team/team_form_page.dart';
import '../../presentation/pages/team/teams_list_page.dart';
import '../../presentation/providers/auth/auth_provider.dart';

part 'app_routes.g.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String athletes = '/athletes';
  static const String register = '/register';
  static const String createAthlete = '/athletes/new';
  static const String editAthlete = '/athletes/:id/edit';
  static const String batchCreateAthlete = '/athletes/batch-create';
  static const String sports = '/admin/sports';
  static const String campuses = '/admin/campuses';
  static const String courses = '/admin/courses';
  static const String competitions = '/admin/competitions';
  static const String competitionDetails = '/competitions/:id';
  static const String createCompetition = '/competitions/new';
  static const String editCompetition = '/competitions/:id/edit';
  static const String designatedCoaches = '/competitions/:id/coaches';
  static const String designatedCoachDetails = '/designated-coaches/:id';
  static const String editDesignatedCoach = '/designated-coaches/:id/edit';
  static const String myDesignations = '/my-designations';
  static const String teams = '/teams';
  static const String teamCreate = '/teams/new';
  static const String teamDetails = '/teams/:teamId';
  static const String teamEdit = '/teams/:teamId/edit';
  static const String athleteSelection = '/athlete-selection';
  static const String games = '/games';
  static const String gameDetails = '/games/:id';
  static const String gameBatchResults = '/games/batch-results';
  static const String gameBatchReschedule = '/games/batch-reschedule';
}

// O seu GoRouterRefreshNotifier (está correto)
class GoRouterRefreshNotifier extends ChangeNotifier {
  GoRouterRefreshNotifier(this._ref) {
    _ref.listen(
      authProvider,
          (previous, next) => notifyListeners(),
    );
  }

  final Ref _ref;
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
        path: AppRoutes.games, // "/games"
        name: AppRoutes.games,
        builder: (context, state) {
          final competitionIdString =
          state.uri.queryParameters['competitionId'];
          final teamIdString = state.uri.queryParameters['teamId'];
          final sportIdString = state.uri.queryParameters['sportId'];

          final competitionId = competitionIdString != null
              ? int.tryParse(competitionIdString)
              : null;
          final teamId =
          teamIdString != null ? int.tryParse(teamIdString) : null;
          final sportId =
          sportIdString != null ? int.tryParse(sportIdString) : null;

          return GamesListPage(
            competitionId: competitionId,
            teamId: teamId,
            sportId: sportId,
          );
        },
        routes: [
          // Rotas específicas (batch) PRIMEIRO
          GoRoute(
            path: 'batch-results', // Relativo: /games/batch-results
            name: AppRoutes.gameBatchResults,
            builder: (context, state) => const GameBatchResultsPage(),
          ),
          GoRoute(
            path: 'batch-reschedule', // Relativo: /games/batch-reschedule
            name: AppRoutes.gameBatchReschedule,
            builder: (context, state) => const GameBatchReschedulePage(),
          ),
          // Rota dinâmica (:id) DEPOIS
          GoRoute(
            path: ':id', // Relativo: /games/:id
            name: AppRoutes.gameDetails,
            builder: (context, state) {
              final gameId = int.parse(state.pathParameters['id']!);
              return GameDetailsPage(gameId: gameId);
            },
          ),
        ],
      ),

      // --- Restante das suas rotas (corretas) ---
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
      GoRoute(
        path: AppRoutes.register,
        name: AppRoutes.register,
        builder: (context, state) => const RegistrationPage(),
      ),
      GoRoute(
        path: AppRoutes.editAthlete,
        name: AppRoutes.editAthlete,
        builder: (context, state) {
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
          return EditDesignatedCoachPage(designationId: id);
        },
      ),
      GoRoute(
        path: AppRoutes.myDesignations,
        name: AppRoutes.myDesignations,
        builder: (context, state) => const MyDesignationsPage(),
      ),
      GoRoute(
        path: AppRoutes.athleteSelection,
        name: AppRoutes.athleteSelection,
        pageBuilder: (context, state) => const MaterialPage(
          child: AthleteSelectionPage(),
          fullscreenDialog: true,
        ),
      ),
      GoRoute(
        path: AppRoutes.teams,
        name: AppRoutes.teams,
        builder: (context, state) {
          final competitionIdString =
          state.uri.queryParameters['competitionId'];
          final competitionId = competitionIdString != null
              ? int.tryParse(competitionIdString)
              : null;
          return TeamsListPage(competitionId: competitionId);
        },
        routes: [
          GoRoute(
            path: 'new', // Path relativo
            name: AppRoutes.teamCreate,
            builder: (context, state) {
              final contextData = state.extra as Map<String, int>? ?? {};
              return TeamFormPage(
                competitionId: contextData['competitionId'],
                sportId: contextData['sportId'],
                courseId: contextData['courseId'],
              );
            },
          ),
          GoRoute(
            path: ':teamId', // Path relativo
            name: AppRoutes.teamDetails,
            builder: (context, state) {
              final teamId = int.parse(state.pathParameters['teamId']!);
              return TeamDetailsPage(teamId: teamId);
            },
            routes: [
              GoRoute(
                path: 'edit', // Path relativo
                name: AppRoutes.teamEdit,
                builder: (context, state) {
                  final team = state.extra as TeamDetails?;
                  return TeamFormPage(team: team);
                },
              ),
            ],
          ),
        ],
      ),
    ],

    // A sua lógica de Redirect (está correta)
    redirect: (BuildContext context, GoRouterState state) {
      final authState = ref.read(authProvider);
      final location = state.matchedLocation;

      if (authState.isLoading || !authState.hasValue) {
        return null;
      }

      if (location == AppRoutes.splash) {
        FlutterNativeSplash.remove();
      }

      return authState.value!.when(
        initial: () => null,
        loading: () => null,
        failure: (_) {
          if (location == AppRoutes.login || location == AppRoutes.register) {
            return null;
          }
          return AppRoutes.login;
        },
        authenticated: (profile) {
          if (location == AppRoutes.login ||
              location == AppRoutes.splash ||
              location == AppRoutes.register) {
            return AppRoutes.home;
          }
          return null;
        },
        unauthenticated: () {
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