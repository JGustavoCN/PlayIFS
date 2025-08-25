// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_input_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TeamInputDTO {

 String get name; int get competitionId; int get sportId; int get courseId; int get coachId;// ✅ ADICIONADO: Campo para o elenco inicial.
 List<int> get athleteIds;
/// Create a copy of TeamInputDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamInputDTOCopyWith<TeamInputDTO> get copyWith => _$TeamInputDTOCopyWithImpl<TeamInputDTO>(this as TeamInputDTO, _$identity);

  /// Serializes this TeamInputDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamInputDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.competitionId, competitionId) || other.competitionId == competitionId)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&const DeepCollectionEquality().equals(other.athleteIds, athleteIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,competitionId,sportId,courseId,coachId,const DeepCollectionEquality().hash(athleteIds));

@override
String toString() {
  return 'TeamInputDTO(name: $name, competitionId: $competitionId, sportId: $sportId, courseId: $courseId, coachId: $coachId, athleteIds: $athleteIds)';
}


}

/// @nodoc
abstract mixin class $TeamInputDTOCopyWith<$Res>  {
  factory $TeamInputDTOCopyWith(TeamInputDTO value, $Res Function(TeamInputDTO) _then) = _$TeamInputDTOCopyWithImpl;
@useResult
$Res call({
 String name, int competitionId, int sportId, int courseId, int coachId, List<int> athleteIds
});




}
/// @nodoc
class _$TeamInputDTOCopyWithImpl<$Res>
    implements $TeamInputDTOCopyWith<$Res> {
  _$TeamInputDTOCopyWithImpl(this._self, this._then);

  final TeamInputDTO _self;
  final $Res Function(TeamInputDTO) _then;

/// Create a copy of TeamInputDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? competitionId = null,Object? sportId = null,Object? courseId = null,Object? coachId = null,Object? athleteIds = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,competitionId: null == competitionId ? _self.competitionId : competitionId // ignore: cast_nullable_to_non_nullable
as int,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as int,athleteIds: null == athleteIds ? _self.athleteIds : athleteIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamInputDTO].
extension TeamInputDTOPatterns on TeamInputDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamInputDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamInputDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamInputDTO value)  $default,){
final _that = this;
switch (_that) {
case _TeamInputDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamInputDTO value)?  $default,){
final _that = this;
switch (_that) {
case _TeamInputDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int competitionId,  int sportId,  int courseId,  int coachId,  List<int> athleteIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamInputDTO() when $default != null:
return $default(_that.name,_that.competitionId,_that.sportId,_that.courseId,_that.coachId,_that.athleteIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int competitionId,  int sportId,  int courseId,  int coachId,  List<int> athleteIds)  $default,) {final _that = this;
switch (_that) {
case _TeamInputDTO():
return $default(_that.name,_that.competitionId,_that.sportId,_that.courseId,_that.coachId,_that.athleteIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int competitionId,  int sportId,  int courseId,  int coachId,  List<int> athleteIds)?  $default,) {final _that = this;
switch (_that) {
case _TeamInputDTO() when $default != null:
return $default(_that.name,_that.competitionId,_that.sportId,_that.courseId,_that.coachId,_that.athleteIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamInputDTO implements TeamInputDTO {
  const _TeamInputDTO({required this.name, required this.competitionId, required this.sportId, required this.courseId, required this.coachId, required final  List<int> athleteIds}): _athleteIds = athleteIds;
  factory _TeamInputDTO.fromJson(Map<String, dynamic> json) => _$TeamInputDTOFromJson(json);

@override final  String name;
@override final  int competitionId;
@override final  int sportId;
@override final  int courseId;
@override final  int coachId;
// ✅ ADICIONADO: Campo para o elenco inicial.
 final  List<int> _athleteIds;
// ✅ ADICIONADO: Campo para o elenco inicial.
@override List<int> get athleteIds {
  if (_athleteIds is EqualUnmodifiableListView) return _athleteIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_athleteIds);
}


/// Create a copy of TeamInputDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamInputDTOCopyWith<_TeamInputDTO> get copyWith => __$TeamInputDTOCopyWithImpl<_TeamInputDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamInputDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamInputDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.competitionId, competitionId) || other.competitionId == competitionId)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&const DeepCollectionEquality().equals(other._athleteIds, _athleteIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,competitionId,sportId,courseId,coachId,const DeepCollectionEquality().hash(_athleteIds));

@override
String toString() {
  return 'TeamInputDTO(name: $name, competitionId: $competitionId, sportId: $sportId, courseId: $courseId, coachId: $coachId, athleteIds: $athleteIds)';
}


}

/// @nodoc
abstract mixin class _$TeamInputDTOCopyWith<$Res> implements $TeamInputDTOCopyWith<$Res> {
  factory _$TeamInputDTOCopyWith(_TeamInputDTO value, $Res Function(_TeamInputDTO) _then) = __$TeamInputDTOCopyWithImpl;
@override @useResult
$Res call({
 String name, int competitionId, int sportId, int courseId, int coachId, List<int> athleteIds
});




}
/// @nodoc
class __$TeamInputDTOCopyWithImpl<$Res>
    implements _$TeamInputDTOCopyWith<$Res> {
  __$TeamInputDTOCopyWithImpl(this._self, this._then);

  final _TeamInputDTO _self;
  final $Res Function(_TeamInputDTO) _then;

/// Create a copy of TeamInputDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? competitionId = null,Object? sportId = null,Object? courseId = null,Object? coachId = null,Object? athleteIds = null,}) {
  return _then(_TeamInputDTO(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,competitionId: null == competitionId ? _self.competitionId : competitionId // ignore: cast_nullable_to_non_nullable
as int,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as int,athleteIds: null == athleteIds ? _self._athleteIds : athleteIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
