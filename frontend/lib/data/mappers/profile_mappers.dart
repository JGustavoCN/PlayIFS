// Ficheiro: lib/data/mappers/profile_mappers.dart

import '../../domain/entities/user/athlete_profile.dart';
import '../../domain/entities/user/coordinator_profile.dart';
import '../../domain/entities/user/profile.dart';
import '../models/user/athlete_details_dto.dart';
import '../models/user/coordinator_details_dto.dart';
import '../models/user/profile_dto.dart';

/// Mapeia o DTO de detalhes do atleta para a Entidade de domínio pura.
extension AthleteDetailsDTOToEntity on AthleteDetailsDTO {
  AthleteProfile toEntity() {
    return AthleteProfile(
      id: id,
      registration: registration,
      fullName: fullName,
      nickname: nickname ?? '', // Trata campos nuláveis
      phone: phone ?? '',
      email: email,
      isCoach: isCoach,
    );
  }
}

/// Mapeia o DTO de detalhes do coordenador para a Entidade de domínio pura.
extension CoordinatorDetailsDTOToEntity on CoordinatorDetailsDTO {
  CoordinatorProfile toEntity() {
    return CoordinatorProfile(
      id: id,
      registration: registration,
      name: name,
      email: email,
    );
  }
}

/// Mapeia o DTO de perfil principal para a Entidade de domínio principal.
extension ProfileDTOToEntity on ProfileDTO {
  Profile toEntity() {
    return Profile(
      userId: userId,
      registration: registration,
      roles: roles,
      // Chama os mapeadores aninhados que acabamos de criar.
      athleteProfile: athleteProfile?.toEntity(),
      coordinatorProfile: coordinatorProfile?.toEntity(),
    );
  }
}