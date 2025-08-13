import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/constants/api_constants.dart';
import '../models/auth/auth_tokens_dto.dart';
import '../models/auth/login_request_dto.dart';
import '../models/auth/refresh_token_request_dto.dart';
import '../models/shared/api_response_body.dart';
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

// ... outros métodos da API ...
}
