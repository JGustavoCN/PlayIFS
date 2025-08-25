// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TeamDetailsDTO {

 int get id; String get name;// ✅ CORREÇÃO: Campos agora são objetos DTO aninhados para espelhar a API.
 CompetitionSummaryDTO get competition; SportSummaryDTO get sport; CourseSummaryDTO get course; AthleteSummaryDTO get coach; List<AthleteSummaryDTO> get athletes;
/// Create a copy of TeamDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamDetailsDTOCopyWith<TeamDetailsDTO> get copyWith => _$TeamDetailsDTOCopyWithImpl<TeamDetailsDTO>(this as TeamDetailsDTO, _$identity);

  /// Serializes this TeamDetailsDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamDetailsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.competition, competition) || other.competition == competition)&&(identical(other.sport, sport) || other.sport == sport)&&(identical(other.course, course) || other.course == course)&&(identical(other.coach, coach) || other.coach == coach)&&const DeepCollectionEquality().equals(other.athletes, athletes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,competition,sport,course,coach,const DeepCollectionEquality().hash(athletes));

@override
String toString() {
  return 'TeamDetailsDTO(id: $id, name: $name, competition: $competition, sport: $sport, course: $course, coach: $coach, athletes: $athletes)';
}


}

/// @nodoc
abstract mixin class $TeamDetailsDTOCopyWith<$Res>  {
  factory $TeamDetailsDTOCopyWith(TeamDetailsDTO value, $Res Function(TeamDetailsDTO) _then) = _$TeamDetailsDTOCopyWithImpl;
@useResult
$Res call({
 int id, String name, CompetitionSummaryDTO competition, SportSummaryDTO sport, CourseSummaryDTO course, AthleteSummaryDTO coach, List<AthleteSummaryDTO> athletes
});


$CompetitionSummaryDTOCopyWith<$Res> get competition;$SportSummaryDTOCopyWith<$Res> get sport;$CourseSummaryDTOCopyWith<$Res> get course;$AthleteSummaryDTOCopyWith<$Res> get coach;

}
/// @nodoc
class _$TeamDetailsDTOCopyWithImpl<$Res>
    implements $TeamDetailsDTOCopyWith<$Res> {
  _$TeamDetailsDTOCopyWithImpl(this._self, this._then);

  final TeamDetailsDTO _self;
  final $Res Function(TeamDetailsDTO) _then;

/// Create a copy of TeamDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? competition = null,Object? sport = null,Object? course = null,Object? coach = null,Object? athletes = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,competition: null == competition ? _self.competition : competition // ignore: cast_nullable_to_non_nullable
as CompetitionSummaryDTO,sport: null == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as SportSummaryDTO,course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as CourseSummaryDTO,coach: null == coach ? _self.coach : coach // ignore: cast_nullable_to_non_nullable
as AthleteSummaryDTO,athletes: null == athletes ? _self.athletes : athletes // ignore: cast_nullable_to_non_nullable
as List<AthleteSummaryDTO>,
  ));
}
/// Create a copy of TeamDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompetitionSummaryDTOCopyWith<$Res> get competition {
  
  return $CompetitionSummaryDTOCopyWith<$Res>(_self.competition, (value) {
    return _then(_self.copyWith(competition: value));
  });
}/// Create a copy of TeamDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SportSummaryDTOCopyWith<$Res> get sport {
  
  return $SportSummaryDTOCopyWith<$Res>(_self.sport, (value) {
    return _then(_self.copyWith(sport: value));
  });
}/// Create a copy of TeamDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseSummaryDTOCopyWith<$Res> get course {
  
  return $CourseSummaryDTOCopyWith<$Res>(_self.course, (value) {
    return _then(_self.copyWith(course: value));
  });
}/// Create a copy of TeamDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteSummaryDTOCopyWith<$Res> get coach {
  
  return $AthleteSummaryDTOCopyWith<$Res>(_self.coach, (value) {
    return _then(_self.copyWith(coach: value));
  });
}
}


/// Adds pattern-matching-related methods to [TeamDetailsDTO].
extension TeamDetailsDTOPatterns on TeamDetailsDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamDetailsDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamDetailsDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamDetailsDTO value)  $default,){
final _that = this;
switch (_that) {
case _TeamDetailsDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamDetailsDTO value)?  $default,){
final _that = this;
switch (_that) {
case _TeamDetailsDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  CompetitionSummaryDTO competition,  SportSummaryDTO sport,  CourseSummaryDTO course,  AthleteSummaryDTO coach,  List<AthleteSummaryDTO> athletes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamDetailsDTO() when $default != null:
return $default(_that.id,_that.name,_that.competition,_that.sport,_that.course,_that.coach,_that.athletes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  CompetitionSummaryDTO competition,  SportSummaryDTO sport,  CourseSummaryDTO course,  AthleteSummaryDTO coach,  List<AthleteSummaryDTO> athletes)  $default,) {final _that = this;
switch (_that) {
case _TeamDetailsDTO():
return $default(_that.id,_that.name,_that.competition,_that.sport,_that.course,_that.coach,_that.athletes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  CompetitionSummaryDTO competition,  SportSummaryDTO sport,  CourseSummaryDTO course,  AthleteSummaryDTO coach,  List<AthleteSummaryDTO> athletes)?  $default,) {final _that = this;
switch (_that) {
case _TeamDetailsDTO() when $default != null:
return $default(_that.id,_that.name,_that.competition,_that.sport,_that.course,_that.coach,_that.athletes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamDetailsDTO implements TeamDetailsDTO {
  const _TeamDetailsDTO({required this.id, required this.name, required this.competition, required this.sport, required this.course, required this.coach, required final  List<AthleteSummaryDTO> athletes}): _athletes = athletes;
  factory _TeamDetailsDTO.fromJson(Map<String, dynamic> json) => _$TeamDetailsDTOFromJson(json);

@override final  int id;
@override final  String name;
// ✅ CORREÇÃO: Campos agora são objetos DTO aninhados para espelhar a API.
@override final  CompetitionSummaryDTO competition;
@override final  SportSummaryDTO sport;
@override final  CourseSummaryDTO course;
@override final  AthleteSummaryDTO coach;
 final  List<AthleteSummaryDTO> _athletes;
@override List<AthleteSummaryDTO> get athletes {
  if (_athletes is EqualUnmodifiableListView) return _athletes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_athletes);
}


/// Create a copy of TeamDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamDetailsDTOCopyWith<_TeamDetailsDTO> get copyWith => __$TeamDetailsDTOCopyWithImpl<_TeamDetailsDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamDetailsDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamDetailsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.competition, competition) || other.competition == competition)&&(identical(other.sport, sport) || other.sport == sport)&&(identical(other.course, course) || other.course == course)&&(identical(other.coach, coach) || other.coach == coach)&&const DeepCollectionEquality().equals(other._athletes, _athletes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,competition,sport,course,coach,const DeepCollectionEquality().hash(_athletes));

@override
String toString() {
  return 'TeamDetailsDTO(id: $id, name: $name, competition: $competition, sport: $sport, course: $course, coach: $coach, athletes: $athletes)';
}


}

/// @nodoc
abstract mixin class _$TeamDetailsDTOCopyWith<$Res> implements $TeamDetailsDTOCopyWith<$Res> {
  factory _$TeamDetailsDTOCopyWith(_TeamDetailsDTO value, $Res Function(_TeamDetailsDTO) _then) = __$TeamDetailsDTOCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, CompetitionSummaryDTO competition, SportSummaryDTO sport, CourseSummaryDTO course, AthleteSummaryDTO coach, List<AthleteSummaryDTO> athletes
});


@override $CompetitionSummaryDTOCopyWith<$Res> get competition;@override $SportSummaryDTOCopyWith<$Res> get sport;@override $CourseSummaryDTOCopyWith<$Res> get course;@override $AthleteSummaryDTOCopyWith<$Res> get coach;

}
/// @nodoc
class __$TeamDetailsDTOCopyWithImpl<$Res>
    implements _$TeamDetailsDTOCopyWith<$Res> {
  __$TeamDetailsDTOCopyWithImpl(this._self, this._then);

  final _TeamDetailsDTO _self;
  final $Res Function(_TeamDetailsDTO) _then;

/// Create a copy of TeamDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? competition = null,Object? sport = null,Object? course = null,Object? coach = null,Object? athletes = null,}) {
  return _then(_TeamDetailsDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,competition: null == competition ? _self.competition : competition // ignore: cast_nullable_to_non_nullable
as CompetitionSummaryDTO,sport: null == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as SportSummaryDTO,course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as CourseSummaryDTO,coach: null == coach ? _self.coach : coach // ignore: cast_nullable_to_non_nullable
as AthleteSummaryDTO,athletes: null == athletes ? _self._athletes : athletes // ignore: cast_nullable_to_non_nullable
as List<AthleteSummaryDTO>,
  ));
}

/// Create a copy of TeamDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompetitionSummaryDTOCopyWith<$Res> get competition {
  
  return $CompetitionSummaryDTOCopyWith<$Res>(_self.competition, (value) {
    return _then(_self.copyWith(competition: value));
  });
}/// Create a copy of TeamDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SportSummaryDTOCopyWith<$Res> get sport {
  
  return $SportSummaryDTOCopyWith<$Res>(_self.sport, (value) {
    return _then(_self.copyWith(sport: value));
  });
}/// Create a copy of TeamDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseSummaryDTOCopyWith<$Res> get course {
  
  return $CourseSummaryDTOCopyWith<$Res>(_self.course, (value) {
    return _then(_self.copyWith(course: value));
  });
}/// Create a copy of TeamDetailsDTO
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
