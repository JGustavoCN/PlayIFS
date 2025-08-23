// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remove_coach_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RemoveCoachInput {

 int get competitionId; int get sportId; int get courseId;
/// Create a copy of RemoveCoachInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveCoachInputCopyWith<RemoveCoachInput> get copyWith => _$RemoveCoachInputCopyWithImpl<RemoveCoachInput>(this as RemoveCoachInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveCoachInput&&(identical(other.competitionId, competitionId) || other.competitionId == competitionId)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.courseId, courseId) || other.courseId == courseId));
}


@override
int get hashCode => Object.hash(runtimeType,competitionId,sportId,courseId);

@override
String toString() {
  return 'RemoveCoachInput(competitionId: $competitionId, sportId: $sportId, courseId: $courseId)';
}


}

/// @nodoc
abstract mixin class $RemoveCoachInputCopyWith<$Res>  {
  factory $RemoveCoachInputCopyWith(RemoveCoachInput value, $Res Function(RemoveCoachInput) _then) = _$RemoveCoachInputCopyWithImpl;
@useResult
$Res call({
 int competitionId, int sportId, int courseId
});




}
/// @nodoc
class _$RemoveCoachInputCopyWithImpl<$Res>
    implements $RemoveCoachInputCopyWith<$Res> {
  _$RemoveCoachInputCopyWithImpl(this._self, this._then);

  final RemoveCoachInput _self;
  final $Res Function(RemoveCoachInput) _then;

/// Create a copy of RemoveCoachInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? competitionId = null,Object? sportId = null,Object? courseId = null,}) {
  return _then(_self.copyWith(
competitionId: null == competitionId ? _self.competitionId : competitionId // ignore: cast_nullable_to_non_nullable
as int,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RemoveCoachInput].
extension RemoveCoachInputPatterns on RemoveCoachInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoveCoachInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoveCoachInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoveCoachInput value)  $default,){
final _that = this;
switch (_that) {
case _RemoveCoachInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoveCoachInput value)?  $default,){
final _that = this;
switch (_that) {
case _RemoveCoachInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int competitionId,  int sportId,  int courseId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemoveCoachInput() when $default != null:
return $default(_that.competitionId,_that.sportId,_that.courseId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int competitionId,  int sportId,  int courseId)  $default,) {final _that = this;
switch (_that) {
case _RemoveCoachInput():
return $default(_that.competitionId,_that.sportId,_that.courseId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int competitionId,  int sportId,  int courseId)?  $default,) {final _that = this;
switch (_that) {
case _RemoveCoachInput() when $default != null:
return $default(_that.competitionId,_that.sportId,_that.courseId);case _:
  return null;

}
}

}

/// @nodoc


class _RemoveCoachInput implements RemoveCoachInput {
  const _RemoveCoachInput({required this.competitionId, required this.sportId, required this.courseId});
  

@override final  int competitionId;
@override final  int sportId;
@override final  int courseId;

/// Create a copy of RemoveCoachInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveCoachInputCopyWith<_RemoveCoachInput> get copyWith => __$RemoveCoachInputCopyWithImpl<_RemoveCoachInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveCoachInput&&(identical(other.competitionId, competitionId) || other.competitionId == competitionId)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.courseId, courseId) || other.courseId == courseId));
}


@override
int get hashCode => Object.hash(runtimeType,competitionId,sportId,courseId);

@override
String toString() {
  return 'RemoveCoachInput(competitionId: $competitionId, sportId: $sportId, courseId: $courseId)';
}


}

/// @nodoc
abstract mixin class _$RemoveCoachInputCopyWith<$Res> implements $RemoveCoachInputCopyWith<$Res> {
  factory _$RemoveCoachInputCopyWith(_RemoveCoachInput value, $Res Function(_RemoveCoachInput) _then) = __$RemoveCoachInputCopyWithImpl;
@override @useResult
$Res call({
 int competitionId, int sportId, int courseId
});




}
/// @nodoc
class __$RemoveCoachInputCopyWithImpl<$Res>
    implements _$RemoveCoachInputCopyWith<$Res> {
  __$RemoveCoachInputCopyWithImpl(this._self, this._then);

  final _RemoveCoachInput _self;
  final $Res Function(_RemoveCoachInput) _then;

/// Create a copy of RemoveCoachInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? competitionId = null,Object? sportId = null,Object? courseId = null,}) {
  return _then(_RemoveCoachInput(
competitionId: null == competitionId ? _self.competitionId : competitionId // ignore: cast_nullable_to_non_nullable
as int,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
