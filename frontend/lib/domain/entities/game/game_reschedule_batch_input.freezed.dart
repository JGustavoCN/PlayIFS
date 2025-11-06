// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_reschedule_batch_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameRescheduleBatchInput {

 List<GameRescheduleItem> get schedules;
/// Create a copy of GameRescheduleBatchInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameRescheduleBatchInputCopyWith<GameRescheduleBatchInput> get copyWith => _$GameRescheduleBatchInputCopyWithImpl<GameRescheduleBatchInput>(this as GameRescheduleBatchInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameRescheduleBatchInput&&const DeepCollectionEquality().equals(other.schedules, schedules));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(schedules));

@override
String toString() {
  return 'GameRescheduleBatchInput(schedules: $schedules)';
}


}

/// @nodoc
abstract mixin class $GameRescheduleBatchInputCopyWith<$Res>  {
  factory $GameRescheduleBatchInputCopyWith(GameRescheduleBatchInput value, $Res Function(GameRescheduleBatchInput) _then) = _$GameRescheduleBatchInputCopyWithImpl;
@useResult
$Res call({
 List<GameRescheduleItem> schedules
});




}
/// @nodoc
class _$GameRescheduleBatchInputCopyWithImpl<$Res>
    implements $GameRescheduleBatchInputCopyWith<$Res> {
  _$GameRescheduleBatchInputCopyWithImpl(this._self, this._then);

  final GameRescheduleBatchInput _self;
  final $Res Function(GameRescheduleBatchInput) _then;

/// Create a copy of GameRescheduleBatchInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schedules = null,}) {
  return _then(_self.copyWith(
schedules: null == schedules ? _self.schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<GameRescheduleItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [GameRescheduleBatchInput].
extension GameRescheduleBatchInputPatterns on GameRescheduleBatchInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameRescheduleBatchInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameRescheduleBatchInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameRescheduleBatchInput value)  $default,){
final _that = this;
switch (_that) {
case _GameRescheduleBatchInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameRescheduleBatchInput value)?  $default,){
final _that = this;
switch (_that) {
case _GameRescheduleBatchInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GameRescheduleItem> schedules)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameRescheduleBatchInput() when $default != null:
return $default(_that.schedules);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GameRescheduleItem> schedules)  $default,) {final _that = this;
switch (_that) {
case _GameRescheduleBatchInput():
return $default(_that.schedules);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GameRescheduleItem> schedules)?  $default,) {final _that = this;
switch (_that) {
case _GameRescheduleBatchInput() when $default != null:
return $default(_that.schedules);case _:
  return null;

}
}

}

/// @nodoc


class _GameRescheduleBatchInput implements GameRescheduleBatchInput {
  const _GameRescheduleBatchInput({required final  List<GameRescheduleItem> schedules}): _schedules = schedules;
  

 final  List<GameRescheduleItem> _schedules;
@override List<GameRescheduleItem> get schedules {
  if (_schedules is EqualUnmodifiableListView) return _schedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_schedules);
}


/// Create a copy of GameRescheduleBatchInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameRescheduleBatchInputCopyWith<_GameRescheduleBatchInput> get copyWith => __$GameRescheduleBatchInputCopyWithImpl<_GameRescheduleBatchInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameRescheduleBatchInput&&const DeepCollectionEquality().equals(other._schedules, _schedules));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_schedules));

@override
String toString() {
  return 'GameRescheduleBatchInput(schedules: $schedules)';
}


}

/// @nodoc
abstract mixin class _$GameRescheduleBatchInputCopyWith<$Res> implements $GameRescheduleBatchInputCopyWith<$Res> {
  factory _$GameRescheduleBatchInputCopyWith(_GameRescheduleBatchInput value, $Res Function(_GameRescheduleBatchInput) _then) = __$GameRescheduleBatchInputCopyWithImpl;
@override @useResult
$Res call({
 List<GameRescheduleItem> schedules
});




}
/// @nodoc
class __$GameRescheduleBatchInputCopyWithImpl<$Res>
    implements _$GameRescheduleBatchInputCopyWith<$Res> {
  __$GameRescheduleBatchInputCopyWithImpl(this._self, this._then);

  final _GameRescheduleBatchInput _self;
  final $Res Function(_GameRescheduleBatchInput) _then;

/// Create a copy of GameRescheduleBatchInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schedules = null,}) {
  return _then(_GameRescheduleBatchInput(
schedules: null == schedules ? _self._schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<GameRescheduleItem>,
  ));
}


}

// dart format on
