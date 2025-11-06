// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_wo_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameWoInput {

 int get winnerTeamId;
/// Create a copy of GameWoInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameWoInputCopyWith<GameWoInput> get copyWith => _$GameWoInputCopyWithImpl<GameWoInput>(this as GameWoInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameWoInput&&(identical(other.winnerTeamId, winnerTeamId) || other.winnerTeamId == winnerTeamId));
}


@override
int get hashCode => Object.hash(runtimeType,winnerTeamId);

@override
String toString() {
  return 'GameWoInput(winnerTeamId: $winnerTeamId)';
}


}

/// @nodoc
abstract mixin class $GameWoInputCopyWith<$Res>  {
  factory $GameWoInputCopyWith(GameWoInput value, $Res Function(GameWoInput) _then) = _$GameWoInputCopyWithImpl;
@useResult
$Res call({
 int winnerTeamId
});




}
/// @nodoc
class _$GameWoInputCopyWithImpl<$Res>
    implements $GameWoInputCopyWith<$Res> {
  _$GameWoInputCopyWithImpl(this._self, this._then);

  final GameWoInput _self;
  final $Res Function(GameWoInput) _then;

/// Create a copy of GameWoInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? winnerTeamId = null,}) {
  return _then(_self.copyWith(
winnerTeamId: null == winnerTeamId ? _self.winnerTeamId : winnerTeamId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GameWoInput].
extension GameWoInputPatterns on GameWoInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameWoInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameWoInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameWoInput value)  $default,){
final _that = this;
switch (_that) {
case _GameWoInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameWoInput value)?  $default,){
final _that = this;
switch (_that) {
case _GameWoInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int winnerTeamId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameWoInput() when $default != null:
return $default(_that.winnerTeamId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int winnerTeamId)  $default,) {final _that = this;
switch (_that) {
case _GameWoInput():
return $default(_that.winnerTeamId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int winnerTeamId)?  $default,) {final _that = this;
switch (_that) {
case _GameWoInput() when $default != null:
return $default(_that.winnerTeamId);case _:
  return null;

}
}

}

/// @nodoc


class _GameWoInput implements GameWoInput {
  const _GameWoInput({required this.winnerTeamId});
  

@override final  int winnerTeamId;

/// Create a copy of GameWoInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameWoInputCopyWith<_GameWoInput> get copyWith => __$GameWoInputCopyWithImpl<_GameWoInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameWoInput&&(identical(other.winnerTeamId, winnerTeamId) || other.winnerTeamId == winnerTeamId));
}


@override
int get hashCode => Object.hash(runtimeType,winnerTeamId);

@override
String toString() {
  return 'GameWoInput(winnerTeamId: $winnerTeamId)';
}


}

/// @nodoc
abstract mixin class _$GameWoInputCopyWith<$Res> implements $GameWoInputCopyWith<$Res> {
  factory _$GameWoInputCopyWith(_GameWoInput value, $Res Function(_GameWoInput) _then) = __$GameWoInputCopyWithImpl;
@override @useResult
$Res call({
 int winnerTeamId
});




}
/// @nodoc
class __$GameWoInputCopyWithImpl<$Res>
    implements _$GameWoInputCopyWith<$Res> {
  __$GameWoInputCopyWithImpl(this._self, this._then);

  final _GameWoInput _self;
  final $Res Function(_GameWoInput) _then;

/// Create a copy of GameWoInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? winnerTeamId = null,}) {
  return _then(_GameWoInput(
winnerTeamId: null == winnerTeamId ? _self.winnerTeamId : winnerTeamId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
