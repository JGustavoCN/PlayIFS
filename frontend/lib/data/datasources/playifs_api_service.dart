import 'package:dio/dio.dart';
import 'package:playifs_frontend/core/constants/api_constants.dart';
import 'package:playifs_frontend/data/models/athlete/athlete_details_dto.dart';
import 'package:playifs_frontend/data/models/athlete/athlete_input_batch_dto.dart';
import 'package:playifs_frontend/data/models/athlete/athlete_input_dto.dart';
import 'package:playifs_frontend/data/models/athlete/athlete_summary_dto.dart';
import 'package:playifs_frontend/data/models/athlete/athlete_update_dto.dart';
import 'package:playifs_frontend/data/models/auth/auth_tokens_dto.dart';
import 'package:playifs_frontend/data/models/auth/login_request_dto.dart';
import 'package:playifs_frontend/data/models/auth/refresh_token_request_dto.dart';
import 'package:playifs_frontend/data/models/campus/campus_summary_dto.dart';
import 'package:playifs_frontend/data/models/competition/competition_details_dto.dart';
import 'package:playifs_frontend/data/models/competition/competition_input_dto.dart';
import 'package:playifs_frontend/data/models/competition/competition_summary_dto.dart';
import 'package:playifs_frontend/data/models/competition/elimination_bracket_dto.dart';
import 'package:playifs_frontend/data/models/competition/group_stage_view_dto.dart';
import 'package:playifs_frontend/data/models/config/app_config_dto.dart';
import 'package:playifs_frontend/data/models/course/course_summary_dto.dart';
import 'package:playifs_frontend/data/models/designated_coach/designated_coach_details_dto.dart';
import 'package:playifs_frontend/data/models/designated_coach/designated_coach_input_batch_dto.dart';
import 'package:playifs_frontend/data/models/designated_coach/designated_coach_input_dto.dart';
import 'package:playifs_frontend/data/models/designated_coach/designated_coach_summary_dto.dart';
import 'package:playifs_frontend/data/models/game/game_details_dto.dart';
import 'package:playifs_frontend/data/models/game/game_summary_dto.dart';
import 'package:playifs_frontend/data/models/game/game_update_dto.dart';
import 'package:playifs_frontend/data/models/game/game_wo_dto.dart';
import 'package:playifs_frontend/data/models/shared/api_response_body.dart';
import 'package:playifs_frontend/data/models/shared/id_batch_dto.dart';
import 'package:playifs_frontend/data/models/shared/page_dto.dart';
import 'package:playifs_frontend/data/models/sport/sport_summary_dto.dart';
import 'package:playifs_frontend/data/models/team/team_details_dto.dart';
import 'package:playifs_frontend/data/models/team/team_input_dto.dart';
import 'package:playifs_frontend/data/models/team/team_summary_dto.dart';
import 'package:playifs_frontend/data/models/team/team_update_dto.dart';
import 'package:playifs_frontend/data/models/user/profile_dto.dart';
import 'package:playifs_frontend/domain/entities/game/game_summary.dart';
import 'package:retrofit/retrofit.dart';

import '../models/game/game_reschedule_batch_dto.dart';
import '../models/game/game_result_batch_dto.dart';
import '../models/game/game_result_dto.dart';

part 'playifs_api_service.g.dart';

@RestApi()
abstract class PlayifsApiService {
  factory PlayifsApiService(Dio dio, {String baseUrl}) = _PlayifsApiService;

  // --- 0. Autenticação ---
  @POST(ApiConstants.authLogin)
  Future<AuthTokensDTO> login(@Body() LoginRequestDTO loginRequest);

  @POST(ApiConstants.authRefreshToken)
  Future<AuthTokensDTO> refreshToken(@Body() RefreshTokenRequestDTO refreshTokenRequest);

  // --- 1. Perfil e Configurações ---
  @GET(ApiConstants.me)
  Future<ApiResponseBody<ProfileDTO>> getMyProfile();

  @GET(ApiConstants.config)
  Future<ApiResponseBody<AppConfigDTO>> getAppConfig();

  // --- 2. Atletas ---
  @GET(ApiConstants.athletes)
  Future<ApiResponseBody<PageDTO<AthleteSummaryDTO>>> findAllAthletes(@Queries() Map<String, dynamic> queries);

  @GET(ApiConstants.athleteById)
  Future<ApiResponseBody<AthleteDetailsDTO>> findAthleteById(@Path('id') int id);

  @POST(ApiConstants.athletes)
  Future<ApiResponseBody<AthleteDetailsDTO>> insertAthlete(@Body() AthleteInputDTO athleteInput);

  @POST(ApiConstants.athletesBatchCreate)
  Future<ApiResponseBody<List<AthleteDetailsDTO>>> batchInsertAthletes(@Body() AthleteInputBatchDTO batchInput);

  @PUT(ApiConstants.athleteById)
  Future<ApiResponseBody<AthleteDetailsDTO>> updateAthlete(@Path('id') int id, @Body() AthleteUpdateDTO athleteUpdate);

  @DELETE(ApiConstants.athleteById)
  Future<void> deleteAthlete(@Path('id') int id);

  @POST(ApiConstants.athletesBatchDelete)
  Future<void> batchDeleteAthletes(@Body() IdBatchDTO batchDelete);

  // --- 3. Competições ---
  @GET(ApiConstants.competitions)
  Future<ApiResponseBody<PageDTO<CompetitionSummaryDTO>>> findAllCompetitions(@Queries() Map<String, dynamic> queries);

  @GET(ApiConstants.competitionById)
  Future<ApiResponseBody<CompetitionDetailsDTO>> findCompetitionById(@Path('id') int id);

  @POST(ApiConstants.competitions)
  Future<ApiResponseBody<CompetitionDetailsDTO>> insertCompetition(@Body() CompetitionInputDTO competition);

  @PUT(ApiConstants.competitionById)
  Future<ApiResponseBody<CompetitionDetailsDTO>> updateCompetition(@Path('id') int id, @Body() CompetitionInputDTO competition);

  @DELETE(ApiConstants.competitionById)
  Future<void> deleteCompetition(@Path('id') int id);

  @POST(ApiConstants.competitionsBatchDelete)
  Future<void> batchDeleteCompetitions(@Body() IdBatchDTO batchDto);

  // --- 3.1 Fases da Competição (NOVOS) ---
  @POST(ApiConstants.generateGroups)
  Future<ApiResponseBody<List<GameDetailsDTO>>> generateGroupStage(
      @Path('competitionId') int competitionId,
      @Path('sportId') int sportId,
      );

  @POST(ApiConstants.generateElimination)
  Future<ApiResponseBody<List<GameDetailsDTO>>> generateEliminationStage(
      @Path('competitionId') int competitionId,
      @Path('sportId') int sportId,
      );

  @GET(ApiConstants.groupStage)
  Future<ApiResponseBody<GroupStageViewDTO>> getGroupStage(
      @Path('competitionId') int competitionId,
      @Path('sportId') int sportId,
      );

  @GET(ApiConstants.eliminationBracket)
  Future<ApiResponseBody<EliminationBracketDTO>> getEliminationBracket(
      @Path('competitionId') int competitionId,
      @Path('sportId') int sportId,
      );

  // --- 4. Equipas (Teams) ---
  @GET(ApiConstants.teams)
  Future<ApiResponseBody<PageDTO<TeamSummaryDTO>>> findAllTeams(@Queries() Map<String, dynamic> queries);

  @GET(ApiConstants.teamById)
  Future<ApiResponseBody<TeamDetailsDTO>> findTeamById(@Path('id') int id);

  @POST(ApiConstants.teams)
  Future<ApiResponseBody<TeamDetailsDTO>> insertTeam(@Body() TeamInputDTO teamInput);

  @PUT(ApiConstants.teamById)
  Future<ApiResponseBody<TeamDetailsDTO>> updateTeam(@Path('id') int id, @Body() TeamUpdateDTO teamUpdate);

  @DELETE(ApiConstants.teamById)
  Future<void> deleteTeam(@Path('id') int id);

  @POST(ApiConstants.teamsBatchDelete)
  Future<void> batchDeleteTeams(@Body() IdBatchDTO batchDto);

  @POST(ApiConstants.teamAthletesBatchAdd)
  Future<ApiResponseBody<TeamDetailsDTO>> batchAddAthletes(
      @Path('id') int teamId,
      @Body() IdBatchDTO batchDto,
      );

  @POST(ApiConstants.teamAthletesBatchRemove)
  Future<void> batchRemoveAthletes(
      @Path('id') int teamId,
      @Body() IdBatchDTO batchDto,
      );

  @DELETE(ApiConstants.teamAthleteById)
  Future<void> removeAthlete(
      @Path('id') int teamId,
      @Path('athleteId') int athleteId,
      );

  // --- 5. Técnicos Designados ---
  @GET(ApiConstants.designatedCoaches)
  Future<ApiResponseBody<PageDTO<DesignatedCoachSummaryDTO>>> findAllDesignatedCoaches(@Queries() Map<String, dynamic> queries);

  @GET(ApiConstants.designatedCoachById)
  Future<ApiResponseBody<DesignatedCoachDetailsDTO>> findDesignatedCoachById(@Path('id') int id);

  @POST(ApiConstants.designatedCoaches)
  Future<ApiResponseBody<DesignatedCoachDetailsDTO>> defineCoach(@Body() DesignatedCoachInputDTO input);

  @PUT(ApiConstants.designatedCoaches)
  Future<ApiResponseBody<DesignatedCoachDetailsDTO>> updateCoach(@Body() DesignatedCoachInputDTO input);

  @POST(ApiConstants.designatedCoachesBatchUpsert)
  Future<ApiResponseBody<List<DesignatedCoachDetailsDTO>>> batchUpsertCoaches(@Body() DesignatedCoachInputBatchDTO batch);

  @DELETE(ApiConstants.designatedCoaches)
  Future<void> removeCoach(@Queries() Map<String, dynamic> queries);

  @POST(ApiConstants.designatedCoachesBatchRemove)
  Future<void> batchRemoveCoaches(@Body() IdBatchDTO batch);

  // --- 6. Dados de Administração ---
  @GET(ApiConstants.campuses)
  Future<ApiResponseBody<PageDTO<CampusSummaryDTO>>> findAllCampuses(@Queries() Map<String, dynamic> queries);

  @GET(ApiConstants.courses)
  Future<ApiResponseBody<PageDTO<CourseSummaryDTO>>> findAllCourses(@Queries() Map<String, dynamic> queries);

  @GET(ApiConstants.sports)
  Future<ApiResponseBody<PageDTO<SportSummaryDTO>>> findAllSports(@Queries() Map<String, dynamic> queries);

  @GET(ApiConstants.games)
  Future<ApiResponseBody<PageDTO<GameSummaryDTO>>> findAllGames(
      @Query('page') int page,
      @Query('teamId') int? teamId,
      @Query('competitionId') int? competitionId,
      @Query('sportId') int? sportId,
      @Query('status') String? status,
      @Query('phase') String? phase,
      );

  @GET(ApiConstants.gameById)
  Future<ApiResponseBody<GameDetailsDTO>> findGameById(
      @Path('id') int gameId,
      );

  @PUT(ApiConstants.gameById)
  Future<ApiResponseBody<GameDetailsDTO>> rescheduleGame(
      @Path('id') int gameId,
      @Body() GameUpdateDTO input,
      );

  @DELETE(ApiConstants.gameById)
  Future<void> deleteGame(@Path('id') int gameId);

  @POST(ApiConstants.gameBatchDelete)
  Future<void> batchDeleteGames(@Body() IdBatchDTO input);

  @PATCH(ApiConstants.gameResult)
  Future<ApiResponseBody<GameDetailsDTO>> updateResult(
      @Path('id') int gameId,
      @Body() GameResultDTO input,
      );

  @PATCH(ApiConstants.gameBatchResults)
  Future<ApiResponseBody<List<GameDetailsDTO>>> batchUpdateResults(
      @Body() GameResultBatchDTO input,
      );

  @PATCH(ApiConstants.gameWo)
  Future<ApiResponseBody<GameDetailsDTO>> registerWo(
      @Path('id') int gameId,
      @Body() GameWoDTO input,
      );

  @PATCH(ApiConstants.gameUndoWo)
  Future<ApiResponseBody<GameDetailsDTO>> undoWo(
      @Path('id') int gameId,
      );

  @PATCH(ApiConstants.gameBatchReschedule)
  Future<ApiResponseBody<List<GameDetailsDTO>>> batchReschedule(
      @Body() GameRescheduleBatchDTO input,
      );

}