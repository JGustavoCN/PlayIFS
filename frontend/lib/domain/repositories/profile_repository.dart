import '../../core/network/result.dart';
import '../entities/user/profile.dart';

abstract class ProfileRepository {
  /// Busca os dados do perfil do utilizador autenticado (GET /me).
  Future<Result<Profile>> getProfile();
}