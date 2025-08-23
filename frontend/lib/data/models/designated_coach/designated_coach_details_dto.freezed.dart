// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'designated_coach_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DesignatedCoachDetailsDTO {

 int get id; CompetitionSummaryDTO get competition; SportSummaryDTO get sport; CourseSummaryDTO get course; AthleteSummaryDTO get coach;
/// Create a copy of DesignatedCoachDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DesignatedCoachDetailsDTOCopyWith<DesignatedCoachDetailsDTO> get copyWith => _$DesignatedCoachDetailsDTOCopyWithImpl<DesignatedCoachDetailsDTO>(this as DesignatedCoachDetailsDTO, _$identity);

  /// Serializes this DesignatedCoachDetailsDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DesignatedCoachDetailsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.competition, competition) || other.competition == competition)&&(identical(other.sport, sport) || other.sport == sport)&&(identical(other.course, course) || other.course == course)&&(identical(other.coach, coach) || other.coach == coach));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,competition,sport,course,coach);

@override
String toString() {
  return 'DesignatedCoachDetailsDTO(id: $id, competition: $competition, sport: $sport, course: $course, coach: $coach)';
}


}

/// @nodoc
abstract mixin class $DesignatedCoachDetailsDTOCopyWith<$Res>  {
  factory $DesignatedCoachDetailsDTOCopyWith(DesignatedCoachDetailsDTO value, $Res Function(DesignatedCoachDetailsDTO) _then) = _$DesignatedCoachDetailsDTOCopyWithImpl;
@useResult
$Res call({
 int id, CompetitionSummaryDTO competition, SportSummaryDTO sport, CourseSummaryDTO course, AthleteSummaryDTO coach
});


$CompetitionSummaryDTOCopyWith<$Res> get competition;$SportSummaryDTOCopyWith<$Res> get sport;$CourseSummaryDTOCopyWith<$Res> get course;$AthleteSummaryDTOCopyWith<$Res> get coach;

}
/// @nodoc
class _$DesignatedCoachDetailsDTOCopyWithImpl<$Res>
    implements $DesignatedCoachDetailsDTOCopyWith<$Res> {
  _$DesignatedCoachDetailsDTOCopyWithImpl(this._self, this._then);

  final DesignatedCoachDetailsDTO _self;
  final $Res Function(DesignatedCoachDetailsDTO) _then;

/// Create a copy of DesignatedCoachDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? competition = null,Object? sport = null,Object? course = null,Object? coach = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,competition: null == competition ? _self.competition : competition // ignore: cast_nullable_to_non_nullable
as CompetitionSummaryDTO,sport: null == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as SportSummaryDTO,course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as CourseSummaryDTO,coach: null == coach ? _self.coach : coach // ignore: cast_nullable_to_non_nullable
as AthleteSummaryDTO,
  ));
}
/// Create a copy of DesignatedCoachDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompetitionSummaryDTOCopyWith<$Res> get competition {
  
  return $CompetitionSummaryDTOCopyWith<$Res>(_self.competition, (value) {
    return _then(_self.copyWith(competition: value));
  });
}/// Create a copy of DesignatedCoachDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SportSummaryDTOCopyWith<$Res> get sport {
  
  return $SportSummaryDTOCopyWith<$Res>(_self.sport, (value) {
    return _then(_self.copyWith(sport: value));
  });
}/// Create a copy of DesignatedCoachDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseSummaryDTOCopyWith<$Res> get course {
  
  return $CourseSummaryDTOCopyWith<$Res>(_self.course, (value) {
    return _then(_self.copyWith(course: value));
  });
}/// Create a copy of DesignatedCoachDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteSummaryDTOCopyWith<$Res> get coach {
  
  return $AthleteSummaryDTOCopyWith<$Res>(_self.coach, (value) {
    return _then(_self.copyWith(coach: value));
  });
}
}


/// Adds pattern-matching-related methods to [DesignatedCoachDetailsDTO].
extension DesignatedCoachDetailsDTOPatterns on DesignatedCoachDetailsDTO {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DesignatedCoachDetailsDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DesignatedCoachDetailsDTO() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DesignatedCoachDetailsDTO value)  $default,){
final _that = this;
switch (_that) {
case _DesignatedCoachDetailsDTO():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DesignatedCoachDetailsDTO value)?  $default,){
final _that = this;
switch (_that) {
case _DesignatedCoachDetailsDTO() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  CompetitionSummaryDTO competition,  SportSummaryDTO sport,  CourseSummaryDTO course,  AthleteSummaryDTO coach)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DesignatedCoachDetailsDTO() when $default != null:
return $default(_that.id,_that.competition,_that.sport,_that.course,_that.coach);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  CompetitionSummaryDTO competition,  SportSummaryDTO sport,  CourseSummaryDTO course,  AthleteSummaryDTO coach)  $default,) {final _that = this;
switch (_that) {
case _DesignatedCoachDetailsDTO():
return $default(_that.id,_that.competition,_that.sport,_that.course,_that.coach);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  CompetitionSummaryDTO competition,  SportSummaryDTO sport,  CourseSummaryDTO course,  AthleteSummaryDTO coach)?  $default,) {final _that = this;
switch (_that) {
case _DesignatedCoachDetailsDTO() when $default != null:
return $default(_that.id,_that.competition,_that.sport,_that.course,_that.coach);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DesignatedCoachDetailsDTO implements DesignatedCoachDetailsDTO {
  const _DesignatedCoachDetailsDTO({required this.id, required this.competition, required this.sport, required this.course, required this.coach});
  factory _DesignatedCoachDetailsDTO.fromJson(Map<String, dynamic> json) => _$DesignatedCoachDetailsDTOFromJson(json);

@override final  int id;
@override final  CompetitionSummaryDTO competition;
@override final  SportSummaryDTO sport;
@override final  CourseSummaryDTO course;
@override final  AthleteSummaryDTO coach;

/// Create a copy of DesignatedCoachDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DesignatedCoachDetailsDTOCopyWith<_DesignatedCoachDetailsDTO> get copyWith => __$DesignatedCoachDetailsDTOCopyWithImpl<_DesignatedCoachDetailsDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DesignatedCoachDetailsDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DesignatedCoachDetailsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.competition, competition) || other.competition == competition)&&(identical(other.sport, sport) || other.sport == sport)&&(identical(other.course, course) || other.course == course)&&(identical(other.coach, coach) || other.coach == coach));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,competition,sport,course,coach);

@override
String toString() {
  return 'DesignatedCoachDetailsDTO(id: $id, competition: $competition, sport: $sport, course: $course, coach: $coach)';
}


}

/// @nodoc
abstract mixin class _$DesignatedCoachDetailsDTOCopyWith<$Res> implements $DesignatedCoachDetailsDTOCopyWith<$Res> {
  factory _$DesignatedCoachDetailsDTOCopyWith(_DesignatedCoachDetailsDTO value, $Res Function(_DesignatedCoachDetailsDTO) _then) = __$DesignatedCoachDetailsDTOCopyWithImpl;
@override @useResult
$Res call({
 int id, CompetitionSummaryDTO competition, SportSummaryDTO sport, CourseSummaryDTO course, AthleteSummaryDTO coach
});


@override $CompetitionSummaryDTOCopyWith<$Res> get competition;@override $SportSummaryDTOCopyWith<$Res> get sport;@override $CourseSummaryDTOCopyWith<$Res> get course;@override $AthleteSummaryDTOCopyWith<$Res> get coach;

}
/// @nodoc
class __$DesignatedCoachDetailsDTOCopyWithImpl<$Res>
    implements _$DesignatedCoachDetailsDTOCopyWith<$Res> {
  __$DesignatedCoachDetailsDTOCopyWithImpl(this._self, this._then);

  final _DesignatedCoachDetailsDTO _self;
  final $Res Function(_DesignatedCoachDetailsDTO) _then;

/// Create a copy of DesignatedCoachDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? competition = null,Object? sport = null,Object? course = null,Object? coach = null,}) {
  return _then(_DesignatedCoachDetailsDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,competition: null == competition ? _self.competition : competition // ignore: cast_nullable_to_non_nullable
as CompetitionSummaryDTO,sport: null == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as SportSummaryDTO,course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as CourseSummaryDTO,coach: null == coach ? _self.coach : coach // ignore: cast_nullable_to_non_nullable
as AthleteSummaryDTO,
  ));
}

/// Create a copy of DesignatedCoachDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompetitionSummaryDTOCopyWith<$Res> get competition {
  
  return $CompetitionSummaryDTOCopyWith<$Res>(_self.competition, (value) {
    return _then(_self.copyWith(competition: value));
  });
}/// Create a copy of DesignatedCoachDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SportSummaryDTOCopyWith<$Res> get sport {
  
  return $SportSummaryDTOCopyWith<$Res>(_self.sport, (value) {
    return _then(_self.copyWith(sport: value));
  });
}/// Create a copy of DesignatedCoachDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseSummaryDTOCopyWith<$Res> get course {
  
  return $CourseSummaryDTOCopyWith<$Res>(_self.course, (value) {
    return _then(_self.copyWith(course: value));
  });
}/// Create a copy of DesignatedCoachDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteSummaryDTOCopyWith<$Res> get coach {
  
  return $AthleteSummaryDTOCopyWith<$Res>(_self.coach, (value) {
    return _then(_self.copyWith(coach: value));
  });
}
}

// dart format on
