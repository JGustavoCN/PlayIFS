// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stage_providers_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StageProvidersParams {

 int get competitionId; int get sportId;
/// Create a copy of StageProvidersParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StageProvidersParamsCopyWith<StageProvidersParams> get copyWith => _$StageProvidersParamsCopyWithImpl<StageProvidersParams>(this as StageProvidersParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StageProvidersParams&&(identical(other.competitionId, competitionId) || other.competitionId == competitionId)&&(identical(other.sportId, sportId) || other.sportId == sportId));
}


@override
int get hashCode => Object.hash(runtimeType,competitionId,sportId);

@override
String toString() {
  return 'StageProvidersParams(competitionId: $competitionId, sportId: $sportId)';
}


}

/// @nodoc
abstract mixin class $StageProvidersParamsCopyWith<$Res>  {
  factory $StageProvidersParamsCopyWith(StageProvidersParams value, $Res Function(StageProvidersParams) _then) = _$StageProvidersParamsCopyWithImpl;
@useResult
$Res call({
 int competitionId, int sportId
});




}
/// @nodoc
class _$StageProvidersParamsCopyWithImpl<$Res>
    implements $StageProvidersParamsCopyWith<$Res> {
  _$StageProvidersParamsCopyWithImpl(this._self, this._then);

  final StageProvidersParams _self;
  final $Res Function(StageProvidersParams) _then;

/// Create a copy of StageProvidersParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? competitionId = null,Object? sportId = null,}) {
  return _then(_self.copyWith(
competitionId: null == competitionId ? _self.competitionId : competitionId // ignore: cast_nullable_to_non_nullable
as int,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StageProvidersParams].
extension StageProvidersParamsPatterns on StageProvidersParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StageProvidersParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StageProvidersParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StageProvidersParams value)  $default,){
final _that = this;
switch (_that) {
case _StageProvidersParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StageProvidersParams value)?  $default,){
final _that = this;
switch (_that) {
case _StageProvidersParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int competitionId,  int sportId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StageProvidersParams() when $default != null:
return $default(_that.competitionId,_that.sportId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int competitionId,  int sportId)  $default,) {final _that = this;
switch (_that) {
case _StageProvidersParams():
return $default(_that.competitionId,_that.sportId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int competitionId,  int sportId)?  $default,) {final _that = this;
switch (_that) {
case _StageProvidersParams() when $default != null:
return $default(_that.competitionId,_that.sportId);case _:
  return null;

}
}

}

/// @nodoc


class _StageProvidersParams implements StageProvidersParams {
  const _StageProvidersParams({required this.competitionId, required this.sportId});
  

@override final  int competitionId;
@override final  int sportId;

/// Create a copy of StageProvidersParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StageProvidersParamsCopyWith<_StageProvidersParams> get copyWith => __$StageProvidersParamsCopyWithImpl<_StageProvidersParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StageProvidersParams&&(identical(other.competitionId, competitionId) || other.competitionId == competitionId)&&(identical(other.sportId, sportId) || other.sportId == sportId));
}


@override
int get hashCode => Object.hash(runtimeType,competitionId,sportId);

@override
String toString() {
  return 'StageProvidersParams(competitionId: $competitionId, sportId: $sportId)';
}


}

/// @nodoc
abstract mixin class _$StageProvidersParamsCopyWith<$Res> implements $StageProvidersParamsCopyWith<$Res> {
  factory _$StageProvidersParamsCopyWith(_StageProvidersParams value, $Res Function(_StageProvidersParams) _then) = __$StageProvidersParamsCopyWithImpl;
@override @useResult
$Res call({
 int competitionId, int sportId
});




}
/// @nodoc
class __$StageProvidersParamsCopyWithImpl<$Res>
    implements _$StageProvidersParamsCopyWith<$Res> {
  __$StageProvidersParamsCopyWithImpl(this._self, this._then);

  final _StageProvidersParams _self;
  final $Res Function(_StageProvidersParams) _then;

/// Create a copy of StageProvidersParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? competitionId = null,Object? sportId = null,}) {
  return _then(_StageProvidersParams(
competitionId: null == competitionId ? _self.competitionId : competitionId // ignore: cast_nullable_to_non_nullable
as int,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
