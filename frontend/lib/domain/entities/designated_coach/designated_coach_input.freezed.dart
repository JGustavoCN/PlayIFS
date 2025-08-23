// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'designated_coach_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DesignatedCoachInput {

 int get competitionId; int get sportId; int get courseId; int get coachId;
/// Create a copy of DesignatedCoachInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DesignatedCoachInputCopyWith<DesignatedCoachInput> get copyWith => _$DesignatedCoachInputCopyWithImpl<DesignatedCoachInput>(this as DesignatedCoachInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DesignatedCoachInput&&(identical(other.competitionId, competitionId) || other.competitionId == competitionId)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.coachId, coachId) || other.coachId == coachId));
}


@override
int get hashCode => Object.hash(runtimeType,competitionId,sportId,courseId,coachId);

@override
String toString() {
  return 'DesignatedCoachInput(competitionId: $competitionId, sportId: $sportId, courseId: $courseId, coachId: $coachId)';
}


}

/// @nodoc
abstract mixin class $DesignatedCoachInputCopyWith<$Res>  {
  factory $DesignatedCoachInputCopyWith(DesignatedCoachInput value, $Res Function(DesignatedCoachInput) _then) = _$DesignatedCoachInputCopyWithImpl;
@useResult
$Res call({
 int competitionId, int sportId, int courseId, int coachId
});




}
/// @nodoc
class _$DesignatedCoachInputCopyWithImpl<$Res>
    implements $DesignatedCoachInputCopyWith<$Res> {
  _$DesignatedCoachInputCopyWithImpl(this._self, this._then);

  final DesignatedCoachInput _self;
  final $Res Function(DesignatedCoachInput) _then;

/// Create a copy of DesignatedCoachInput
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


/// Adds pattern-matching-related methods to [DesignatedCoachInput].
extension DesignatedCoachInputPatterns on DesignatedCoachInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DesignatedCoachInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DesignatedCoachInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DesignatedCoachInput value)  $default,){
final _that = this;
switch (_that) {
case _DesignatedCoachInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DesignatedCoachInput value)?  $default,){
final _that = this;
switch (_that) {
case _DesignatedCoachInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int competitionId,  int sportId,  int courseId,  int coachId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DesignatedCoachInput() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int competitionId,  int sportId,  int courseId,  int coachId)  $default,) {final _that = this;
switch (_that) {
case _DesignatedCoachInput():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int competitionId,  int sportId,  int courseId,  int coachId)?  $default,) {final _that = this;
switch (_that) {
case _DesignatedCoachInput() when $default != null:
return $default(_that.competitionId,_that.sportId,_that.courseId,_that.coachId);case _:
  return null;

}
}

}

/// @nodoc


class _DesignatedCoachInput implements DesignatedCoachInput {
  const _DesignatedCoachInput({required this.competitionId, required this.sportId, required this.courseId, required this.coachId});
  

@override final  int competitionId;
@override final  int sportId;
@override final  int courseId;
@override final  int coachId;

/// Create a copy of DesignatedCoachInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DesignatedCoachInputCopyWith<_DesignatedCoachInput> get copyWith => __$DesignatedCoachInputCopyWithImpl<_DesignatedCoachInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DesignatedCoachInput&&(identical(other.competitionId, competitionId) || other.competitionId == competitionId)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.coachId, coachId) || other.coachId == coachId));
}


@override
int get hashCode => Object.hash(runtimeType,competitionId,sportId,courseId,coachId);

@override
String toString() {
  return 'DesignatedCoachInput(competitionId: $competitionId, sportId: $sportId, courseId: $courseId, coachId: $coachId)';
}


}

/// @nodoc
abstract mixin class _$DesignatedCoachInputCopyWith<$Res> implements $DesignatedCoachInputCopyWith<$Res> {
  factory _$DesignatedCoachInputCopyWith(_DesignatedCoachInput value, $Res Function(_DesignatedCoachInput) _then) = __$DesignatedCoachInputCopyWithImpl;
@override @useResult
$Res call({
 int competitionId, int sportId, int courseId, int coachId
});




}
/// @nodoc
class __$DesignatedCoachInputCopyWithImpl<$Res>
    implements _$DesignatedCoachInputCopyWith<$Res> {
  __$DesignatedCoachInputCopyWithImpl(this._self, this._then);

  final _DesignatedCoachInput _self;
  final $Res Function(_DesignatedCoachInput) _then;

/// Create a copy of DesignatedCoachInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? competitionId = null,Object? sportId = null,Object? courseId = null,Object? coachId = null,}) {
  return _then(_DesignatedCoachInput(
competitionId: null == competitionId ? _self.competitionId : competitionId // ignore: cast_nullable_to_non_nullable
as int,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
