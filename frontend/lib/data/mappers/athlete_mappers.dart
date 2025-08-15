// lib/data/mappers/athlete_mappers.dart
import '../../domain/entities/athlete/athlete_details.dart';
import '../../domain/entities/athlete/athlete_input.dart';
import '../../domain/entities/athlete/athlete_summary.dart';
import '../../domain/entities/athlete/athlete_update.dart';
import '../models/athlete/athlete_details_dto.dart';
import '../models/athlete/athlete_input_dto.dart';
import '../models/athlete/athlete_summary_dto.dart';
import '../models/athlete/athlete_update_dto.dart';

// DTO -> Entidade
extension AthleteSummaryDTOToEntity on AthleteSummaryDTO {
  AthleteSummary toEntity() => AthleteSummary(
    id: id,
    registration: registration,
    fullName: fullName,
  );
}

extension AthleteDetailsDTOToEntity on AthleteDetailsDTO {
  AthleteDetails toEntity() => AthleteDetails(
    id: id,
    registration: registration,
    fullName: fullName,
    nickname: nickname,
    phone: phone,
    email: email,
    isCoach: isCoach,
  );
}

// Entidade -> DTO
extension AthleteInputToDTO on AthleteInput {
  AthleteInputDTO toDTO() => AthleteInputDTO(
    registration: registration,
    fullName: fullName,
    nickname: nickname,
    phone: phone,
    email: email,
    password: password,
  );
}

extension AthleteUpdateToDTO on AthleteUpdate {
  AthleteUpdateDTO toDTO() => AthleteUpdateDTO(
    registration: registration,
    fullName: fullName,
    nickname: nickname,
    phone: phone,
    email: email,
  );
}