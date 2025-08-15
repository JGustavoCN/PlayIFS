import 'package:playifs_frontend/domain/entities/athlete/athlete_details.dart';

import '../../domain/entities/user/coordinator_profile.dart';
import '../../domain/entities/user/profile.dart';
import '../models/athlete/athlete_details_dto.dart';
import '../models/user/coordinator_details_dto.dart';
import '../models/user/profile_dto.dart';

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

extension CoordinatorDetailsDTOToEntity on CoordinatorDetailsDTO {
  CoordinatorProfile toEntity() => CoordinatorProfile(
    id: id,
    registration: registration,
    name: name,
    email: email,
  );
}

extension ProfileDTOToEntity on ProfileDTO {
  Profile toEntity() => Profile(
    userId: userId,
    registration: registration,
    roles: roles,
    athleteDetails: athleteProfile?.toEntity(),
    coordinatorProfile: coordinatorProfile?.toEntity(),
  );
}