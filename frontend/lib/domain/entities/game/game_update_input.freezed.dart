// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_update_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameUpdateInput {

 DateTime get dateTime;
/// Create a copy of GameUpdateInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameUpdateInputCopyWith<GameUpdateInput> get copyWith => _$GameUpdateInputCopyWithImpl<GameUpdateInput>(this as GameUpdateInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameUpdateInput&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime));
}


@override
int get hashCode => Object.hash(runtimeType,dateTime);

@override
String toString() {
  return 'GameUpdateInput(dateTime: $dateTime)';
}


}

/// @nodoc
abstract mixin class $GameUpdateInputCopyWith<$Res>  {
  factory $GameUpdateInputCopyWith(GameUpdateInput value, $Res Function(GameUpdateInput) _then) = _$GameUpdateInputCopyWithImpl;
@useResult
$Res call({
 DateTime dateTime
});




}
/// @nodoc
class _$GameUpdateInputCopyWithImpl<$Res>
    implements $GameUpdateInputCopyWith<$Res> {
  _$GameUpdateInputCopyWithImpl(this._self, this._then);

  final GameUpdateInput _self;
  final $Res Function(GameUpdateInput) _then;

/// Create a copy of GameUpdateInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateTime = null,}) {
  return _then(_self.copyWith(
dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [GameUpdateInput].
extension GameUpdateInputPatterns on GameUpdateInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameUpdateInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameUpdateInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameUpdateInput value)  $default,){
final _that = this;
switch (_that) {
case _GameUpdateInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameUpdateInput value)?  $default,){
final _that = this;
switch (_that) {
case _GameUpdateInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime dateTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameUpdateInput() when $default != null:
return $default(_that.dateTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime dateTime)  $default,) {final _that = this;
switch (_that) {
case _GameUpdateInput():
return $default(_that.dateTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime dateTime)?  $default,) {final _that = this;
switch (_that) {
case _GameUpdateInput() when $default != null:
return $default(_that.dateTime);case _:
  return null;

}
}

}

/// @nodoc


class _GameUpdateInput implements GameUpdateInput {
  const _GameUpdateInput({required this.dateTime});
  

@override final  DateTime dateTime;

/// Create a copy of GameUpdateInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameUpdateInputCopyWith<_GameUpdateInput> get copyWith => __$GameUpdateInputCopyWithImpl<_GameUpdateInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameUpdateInput&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime));
}


@override
int get hashCode => Object.hash(runtimeType,dateTime);

@override
String toString() {
  return 'GameUpdateInput(dateTime: $dateTime)';
}


}

/// @nodoc
abstract mixin class _$GameUpdateInputCopyWith<$Res> implements $GameUpdateInputCopyWith<$Res> {
  factory _$GameUpdateInputCopyWith(_GameUpdateInput value, $Res Function(_GameUpdateInput) _then) = __$GameUpdateInputCopyWithImpl;
@override @useResult
$Res call({
 DateTime dateTime
});




}
/// @nodoc
class __$GameUpdateInputCopyWithImpl<$Res>
    implements _$GameUpdateInputCopyWith<$Res> {
  __$GameUpdateInputCopyWithImpl(this._self, this._then);

  final _GameUpdateInput _self;
  final $Res Function(_GameUpdateInput) _then;

/// Create a copy of GameUpdateInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateTime = null,}) {
  return _then(_GameUpdateInput(
dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
