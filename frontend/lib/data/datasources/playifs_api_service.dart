import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/constants/api_constants.dart';
import '../models/athlete/athlete_details_dto.dart';
import '../models/athlete/athlete_input_batch_dto.dart';
import '../models/athlete/athlete_input_dto.dart';
import '../models/athlete/athlete_summary_dto.dart';
import '../models/athlete/athlete_update_dto.dart';
import '../models/auth/auth_tokens_dto.dart';
import '../models/auth/login_request_dto.dart';
import '../models/auth/refresh_token_request_dto.dart';
import '../models/campus/campus_summary_dto.dart';
import '../models/competition/competition_details_dto.dart';
import '../models/competition/competition_input_dto.dart';
import '../models/competition/competition_summary_dto.dart';
import '../models/config/app_config_dto.dart';
import '../models/course/course_summary_dto.dart';
import '../models/designated_coach/designated_coach_details_dto.dart';
import '../models/designated_coach/designated_coach_input_batch_dto.dart';
import '../models/designated_coach/designated_coach_input_dto.dart';
import '../models/designated_coach/designated_coach_summary_dto.dart';
import '../models/shared/api_response_body.dart';
import '../models/shared/id_batch_dto.dart';
import '../models/shared/page_dto.dart';
import '../models/sport/sport_summary_dto.dart';
import '../models/user/profile_dto.dart';

part 'playifs_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class PlayifsApiService {
  factory PlayifsApiService(Dio dio, {String baseUrl}) = _PlayifsApiService;

  // --- MÉTODOS DE AUTENTICAÇÃO ---

  /// Realiza a autenticação do utilizador.
  @POST(ApiConstants.authLogin)
  // CORREÇÃO: A resposta agora é o AuthTokensDTO diretamente, sem o invólucro.
  Future<AuthTokensDTO> login(
      @Body() LoginRequestDTO loginRequest,
      );

  // O método refreshToken provavelmente tem o mesmo problema e deve ser corrigido.
  @POST(ApiConstants.authRefreshToken)
  Future<AuthTokensDTO> refreshToken(
      @Body() RefreshTokenRequestDTO refreshTokenRequest,
      );

  // O método getMyProfile está correto, pois ele USA o invólucro.
  @GET(ApiConstants.me)
  Future<ApiResponseBody<ProfileDTO>> getMyProfile();

// --- Athlete Endpoints ---

  @GET('/athletes')
  Future<ApiResponseBody<PageDTO<AthleteSummaryDTO>>> findAllAthletes(
      @Queries() Map<String, dynamic> queries,
      );

  @GET('/athletes/{id}')
  Future<ApiResponseBody<AthleteDetailsDTO>> findAthleteById(@Path('id') int id);

  @POST('/athletes')
  Future<ApiResponseBody<AthleteDetailsDTO>> insertAthlete(
      @Body() AthleteInputDTO athleteInput,
      );

  @POST('/athletes/batch-create')
  Future<ApiResponseBody<List<AthleteDetailsDTO>>> batchInsertAthletes(
      @Body() AthleteInputBatchDTO batchInput,
      );

  @PUT('/athletes/{id}')
  Future<ApiResponseBody<AthleteDetailsDTO>> updateAthlete(
      @Path('id') int id,
      @Body() AthleteUpdateDTO athleteUpdate,
      );

  @DELETE('/athletes/{id}')
  Future<void> deleteAthlete(@Path('id') int id);

  @POST('/athletes/batch-delete')
  Future<void> batchDeleteAthletes(@Body() IdBatchDTO batchDelete);

  @GET(ApiConstants.config)
  Future<ApiResponseBody<AppConfigDTO>> getAppConfig();

  @GET(ApiConstants.sports)
  Future<ApiResponseBody<PageDTO<SportSummaryDTO>>> findAllSports(
      @Queries() Map<String, dynamic> queries,
      );

  /// Busca uma lista paginada de campi.
  @GET(ApiConstants.campuses)
  Future<ApiResponseBody<PageDTO<CampusSummaryDTO>>> findAllCampuses(
      @Queries() Map<String, dynamic> queries,
      );

  /// Busca uma lista paginada de cursos.
  @GET(ApiConstants.courses)
  Future<ApiResponseBody<PageDTO<CourseSummaryDTO>>> findAllCourses(
      @Queries() Map<String, dynamic> queries,
      );

  @GET(ApiConstants.competitions)
  Future<ApiResponseBody<PageDTO<CompetitionSummaryDTO>>> findAllCompetitions(
      @Queries() Map<String, dynamic> queries,
      );

  @GET('${ApiConstants.competitions}/{id}')
  Future<ApiResponseBody<CompetitionDetailsDTO>> findCompetitionById(
      @Path('id') int id,
      );

  @POST(ApiConstants.competitions)
  Future<ApiResponseBody<CompetitionDetailsDTO>> insertCompetition(
      @Body() CompetitionInputDTO competition,
      );

  @PUT('${ApiConstants.competitions}/{id}')
  Future<ApiResponseBody<CompetitionDetailsDTO>> updateCompetition(
      @Path('id') int id,
      @Body() CompetitionInputDTO competition,
      );

  @DELETE('${ApiConstants.competitions}/{id}')
  Future<void> deleteCompetition(@Path('id') int id);

  @POST('${ApiConstants.competitions}/batch-delete')
  Future<void> batchDeleteCompetitions(@Body() IdBatchDTO batchDto);


  // =================== DESIGNATED COACHES ===================

  @GET(ApiConstants.designatedCoaches)
  Future<ApiResponseBody<PageDTO<DesignatedCoachSummaryDTO>>> findAllDesignatedCoaches(
      @Queries() Map<String, dynamic> queries,
      );

  @GET('${ApiConstants.designatedCoaches}/{id}')
  Future<ApiResponseBody<DesignatedCoachDetailsDTO>> findDesignatedCoachById(
      @Path('id') int id,
      );

  @POST(ApiConstants.designatedCoaches)
  Future<ApiResponseBody<DesignatedCoachDetailsDTO>> defineCoach(
      @Body() DesignatedCoachInputDTO input,
      );

  @PUT(ApiConstants.designatedCoaches)
  Future<ApiResponseBody<DesignatedCoachDetailsDTO>> updateCoach(
      @Body() DesignatedCoachInputDTO input,
      );

  @POST('${ApiConstants.designatedCoaches}/batch-upsert')
  Future<ApiResponseBody<List<DesignatedCoachDetailsDTO>>> batchUpsertCoaches(
      @Body() DesignatedCoachInputBatchDTO batch,
      );

  @DELETE(ApiConstants.designatedCoaches)
  Future<void> removeCoach(@Queries() Map<String, dynamic> queries);

  @POST('${ApiConstants.designatedCoaches}/batch-remove')
  Future<void> batchRemoveCoaches(@Body() IdBatchDTO batch);

}
