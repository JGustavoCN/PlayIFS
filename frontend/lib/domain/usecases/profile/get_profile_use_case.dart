import '../../../core/network/result.dart';
import '../../entities/user/profile.dart';
import '../../repositories/profile_repository.dart';

class GetProfileUseCase {
  GetProfileUseCase(this._repository);
  final ProfileRepository _repository;

  Future<Result<Profile>> execute() => _repository.getProfile();
}