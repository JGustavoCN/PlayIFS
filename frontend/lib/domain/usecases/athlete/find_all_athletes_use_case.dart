// lib/domain/usecases/athlete/find_all_athletes_use_case.dart
import '../../../core/network/result.dart';
import '../../entities/athlete/athlete_summary.dart';
import '../../entities/shared/page.dart';
import '../../repositories/athlete_repository.dart';

class FindAllAthletesUseCase {
  FindAllAthletesUseCase(this._repository);
  final AthleteRepository _repository;

  Future<Result<Page<AthleteSummary>>> execute({int page = 0, int size = 10, String? name}) =>
      _repository.findAll(page: page, size: size, name: name);
}