// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'designated_coach_input_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DesignatedCoachInputDTO {

 int get competitionId; int get sportId; int get courseId;@JsonKey(name: 'athleteId') int get coachId;
/// Create a copy of DesignatedCoachInputDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DesignatedCoachInputDTOCopyWith<DesignatedCoachInputDTO> get copyWith => _$DesignatedCoachInputDTOCopyWithImpl<DesignatedCoachInputDTO>(this as DesignatedCoachInputDTO, _$identity);

  /// Serializes this DesignatedCoachInputDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DesignatedCoachInputDTO&&(identical(other.competitionId, competitionId) || other.competitionId == competitionId)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.coachId, coachId) || other.coachId == coachId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,competitionId,sportId,courseId,coachId);

@override
String toString() {
  return 'DesignatedCoachInputDTO(competitionId: $competitionId, sportId: $sportId, courseId: $courseId, coachId: $coachId)';
}


}

/// @nodoc
abstract mixin class $DesignatedCoachInputDTOCopyWith<$Res>  {
  factory $DesignatedCoachInputDTOCopyWith(DesignatedCoachInputDTO value, $Res Function(DesignatedCoachInputDTO) _then) = _$DesignatedCoachInputDTOCopyWithImpl;
@useResult
$Res call({
 int competitionId, int sportId, int courseId,@JsonKey(name: 'athleteId') int coachId
});




}
/// @nodoc
class _$DesignatedCoachInputDTOCopyWithImpl<$Res>
    implements $DesignatedCoachInputDTOCopyWith<$Res> {
  _$DesignatedCoachInputDTOCopyWithImpl(this._self, this._then);

  final DesignatedCoachInputDTO _self;
  final $Res Function(DesignatedCoachInputDTO) _then;

/// Create a copy of DesignatedCoachInputDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? competitionId = null,Object? sportId = null,Object? courseId = null,Object? coachId = null,}) {
  return _then(_self.copyWith(
competitionId: null == competitionId ? _self.competitionId : competitionId // ignore: cast_nullable_to_non_nullable
as int,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DesignatedCoachInputDTO].
extension DesignatedCoachInputDTOPatterns on DesignatedCoachInputDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DesignatedCoachInputDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DesignatedCoachInputDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DesignatedCoachInputDTO value)  $default,){
final _that = this;
switch (_that) {
case _DesignatedCoachInputDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DesignatedCoachInputDTO value)?  $default,){
final _that = this;
switch (_that) {
case _DesignatedCoachInputDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int competitionId,  int sportId,  int courseId, @JsonKey(name: 'athleteId')  int coachId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DesignatedCoachInputDTO() when $default != null:
return $default(_that.competitionId,_that.sportId,_that.courseId,_that.coachId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int competitionId,  int sportId,  int courseId, @JsonKey(name: 'athleteId')  int coachId)  $default,) {final _that = this;
switch (_that) {
case _DesignatedCoachInputDTO():
return $default(_that.competitionId,_that.sportId,_that.courseId,_that.coachId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int competitionId,  int sportId,  int courseId, @JsonKey(name: 'athleteId')  int coachId)?  $default,) {final _that = this;
switch (_that) {
case _DesignatedCoachInputDTO() when $default != null:
return $default(_that.competitionId,_that.sportId,_that.courseId,_that.coachId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DesignatedCoachInputDTO implements DesignatedCoachInputDTO {
  const _DesignatedCoachInputDTO({required this.competitionId, required this.sportId, required this.courseId, @JsonKey(name: 'athleteId') required this.coachId});
  factory _DesignatedCoachInputDTO.fromJson(Map<String, dynamic> json) => _$DesignatedCoachInputDTOFromJson(json);

@override final  int competitionId;
@override final  int sportId;
@override final  int courseId;
@override@JsonKey(name: 'athleteId') final  int coachId;

/// Create a copy of DesignatedCoachInputDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DesignatedCoachInputDTOCopyWith<_DesignatedCoachInputDTO> get copyWith => __$DesignatedCoachInputDTOCopyWithImpl<_DesignatedCoachInputDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DesignatedCoachInputDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DesignatedCoachInputDTO&&(identical(other.competitionId, competitionId) || other.competitionId == competitionId)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.coachId, coachId) || other.coachId == coachId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,competitionId,sportId,courseId,coachId);

@override
String toString() {
  return 'DesignatedCoachInputDTO(competitionId: $competitionId, sportId: $sportId, courseId: $courseId, coachId: $coachId)';
}


}

/// @nodoc
abstract mixin class _$DesignatedCoachInputDTOCopyWith<$Res> implements $DesignatedCoachInputDTOCopyWith<$Res> {
  factory _$DesignatedCoachInputDTOCopyWith(_DesignatedCoachInputDTO value, $Res Function(_DesignatedCoachInputDTO) _then) = __$DesignatedCoachInputDTOCopyWithImpl;
@override @useResult
$Res call({
 int competitionId, int sportId, int courseId,@JsonKey(name: 'athleteId') int coachId
});




}
/// @nodoc
class __$DesignatedCoachInputDTOCopyWithImpl<$Res>
    implements _$DesignatedCoachInputDTOCopyWith<$Res> {
  __$DesignatedCoachInputDTOCopyWithImpl(this._self, this._then);

  final _DesignatedCoachInputDTO _self;
  final $Res Function(_DesignatedCoachInputDTO) _then;

/// Create a copy of DesignatedCoachInputDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? competitionId = null,Object? sportId = null,Object? courseId = null,Object? coachId = null,}) {
  return _then(_DesignatedCoachInputDTO(
competitionId: null == competitionId ? _self.competitionId : competitionId // ignore: cast_nullable_to_non_nullable
as int,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
