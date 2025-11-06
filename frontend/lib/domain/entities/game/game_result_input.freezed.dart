// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_result_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameResultInput {

 int get scoreTeamA; int get scoreTeamB;
/// Create a copy of GameResultInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameResultInputCopyWith<GameResultInput> get copyWith => _$GameResultInputCopyWithImpl<GameResultInput>(this as GameResultInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameResultInput&&(identical(other.scoreTeamA, scoreTeamA) || other.scoreTeamA == scoreTeamA)&&(identical(other.scoreTeamB, scoreTeamB) || other.scoreTeamB == scoreTeamB));
}


@override
int get hashCode => Object.hash(runtimeType,scoreTeamA,scoreTeamB);

@override
String toString() {
  return 'GameResultInput(scoreTeamA: $scoreTeamA, scoreTeamB: $scoreTeamB)';
}


}

/// @nodoc
abstract mixin class $GameResultInputCopyWith<$Res>  {
  factory $GameResultInputCopyWith(GameResultInput value, $Res Function(GameResultInput) _then) = _$GameResultInputCopyWithImpl;
@useResult
$Res call({
 int scoreTeamA, int scoreTeamB
});




}
/// @nodoc
class _$GameResultInputCopyWithImpl<$Res>
    implements $GameResultInputCopyWith<$Res> {
  _$GameResultInputCopyWithImpl(this._self, this._then);

  final GameResultInput _self;
  final $Res Function(GameResultInput) _then;

/// Create a copy of GameResultInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scoreTeamA = null,Object? scoreTeamB = null,}) {
  return _then(_self.copyWith(
scoreTeamA: null == scoreTeamA ? _self.scoreTeamA : scoreTeamA // ignore: cast_nullable_to_non_nullable
as int,scoreTeamB: null == scoreTeamB ? _self.scoreTeamB : scoreTeamB // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GameResultInput].
extension GameResultInputPatterns on GameResultInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameResultInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameResultInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameResultInput value)  $default,){
final _that = this;
switch (_that) {
case _GameResultInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameResultInput value)?  $default,){
final _that = this;
switch (_that) {
case _GameResultInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int scoreTeamA,  int scoreTeamB)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameResultInput() when $default != null:
return $default(_that.scoreTeamA,_that.scoreTeamB);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int scoreTeamA,  int scoreTeamB)  $default,) {final _that = this;
switch (_that) {
case _GameResultInput():
return $default(_that.scoreTeamA,_that.scoreTeamB);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int scoreTeamA,  int scoreTeamB)?  $default,) {final _that = this;
switch (_that) {
case _GameResultInput() when $default != null:
return $default(_that.scoreTeamA,_that.scoreTeamB);case _:
  return null;

}
}

}

/// @nodoc


class _GameResultInput implements GameResultInput {
  const _GameResultInput({required this.scoreTeamA, required this.scoreTeamB});
  

@override final  int scoreTeamA;
@override final  int scoreTeamB;

/// Create a copy of GameResultInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameResultInputCopyWith<_GameResultInput> get copyWith => __$GameResultInputCopyWithImpl<_GameResultInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameResultInput&&(identical(other.scoreTeamA, scoreTeamA) || other.scoreTeamA == scoreTeamA)&&(identical(other.scoreTeamB, scoreTeamB) || other.scoreTeamB == scoreTeamB));
}


@override
int get hashCode => Object.hash(runtimeType,scoreTeamA,scoreTeamB);

@override
String toString() {
  return 'GameResultInput(scoreTeamA: $scoreTeamA, scoreTeamB: $scoreTeamB)';
}


}

/// @nodoc
abstract mixin class _$GameResultInputCopyWith<$Res> implements $GameResultInputCopyWith<$Res> {
  factory _$GameResultInputCopyWith(_GameResultInput value, $Res Function(_GameResultInput) _then) = __$GameResultInputCopyWithImpl;
@override @useResult
$Res call({
 int scoreTeamA, int scoreTeamB
});




}
/// @nodoc
class __$GameResultInputCopyWithImpl<$Res>
    implements _$GameResultInputCopyWith<$Res> {
  __$GameResultInputCopyWithImpl(this._self, this._then);

  final _GameResultInput _self;
  final $Res Function(_GameResultInput) _then;

/// Create a copy of GameResultInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scoreTeamA = null,Object? scoreTeamB = null,}) {
  return _then(_GameResultInput(
scoreTeamA: null == scoreTeamA ? _self.scoreTeamA : scoreTeamA // ignore: cast_nullable_to_non_nullable
as int,scoreTeamB: null == scoreTeamB ? _self.scoreTeamB : scoreTeamB // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
