// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_reschedule_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameRescheduleItem {

 int get gameId; DateTime get dateTime;
/// Create a copy of GameRescheduleItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameRescheduleItemCopyWith<GameRescheduleItem> get copyWith => _$GameRescheduleItemCopyWithImpl<GameRescheduleItem>(this as GameRescheduleItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameRescheduleItem&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime));
}


@override
int get hashCode => Object.hash(runtimeType,gameId,dateTime);

@override
String toString() {
  return 'GameRescheduleItem(gameId: $gameId, dateTime: $dateTime)';
}


}

/// @nodoc
abstract mixin class $GameRescheduleItemCopyWith<$Res>  {
  factory $GameRescheduleItemCopyWith(GameRescheduleItem value, $Res Function(GameRescheduleItem) _then) = _$GameRescheduleItemCopyWithImpl;
@useResult
$Res call({
 int gameId, DateTime dateTime
});




}
/// @nodoc
class _$GameRescheduleItemCopyWithImpl<$Res>
    implements $GameRescheduleItemCopyWith<$Res> {
  _$GameRescheduleItemCopyWithImpl(this._self, this._then);

  final GameRescheduleItem _self;
  final $Res Function(GameRescheduleItem) _then;

/// Create a copy of GameRescheduleItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gameId = null,Object? dateTime = null,}) {
  return _then(_self.copyWith(
gameId: null == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as int,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [GameRescheduleItem].
extension GameRescheduleItemPatterns on GameRescheduleItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameRescheduleItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameRescheduleItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameRescheduleItem value)  $default,){
final _that = this;
switch (_that) {
case _GameRescheduleItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameRescheduleItem value)?  $default,){
final _that = this;
switch (_that) {
case _GameRescheduleItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int gameId,  DateTime dateTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameRescheduleItem() when $default != null:
return $default(_that.gameId,_that.dateTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int gameId,  DateTime dateTime)  $default,) {final _that = this;
switch (_that) {
case _GameRescheduleItem():
return $default(_that.gameId,_that.dateTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int gameId,  DateTime dateTime)?  $default,) {final _that = this;
switch (_that) {
case _GameRescheduleItem() when $default != null:
return $default(_that.gameId,_that.dateTime);case _:
  return null;

}
}

}

/// @nodoc


class _GameRescheduleItem implements GameRescheduleItem {
  const _GameRescheduleItem({required this.gameId, required this.dateTime});
  

@override final  int gameId;
@override final  DateTime dateTime;

/// Create a copy of GameRescheduleItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameRescheduleItemCopyWith<_GameRescheduleItem> get copyWith => __$GameRescheduleItemCopyWithImpl<_GameRescheduleItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameRescheduleItem&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime));
}


@override
int get hashCode => Object.hash(runtimeType,gameId,dateTime);

@override
String toString() {
  return 'GameRescheduleItem(gameId: $gameId, dateTime: $dateTime)';
}


}

/// @nodoc
abstract mixin class _$GameRescheduleItemCopyWith<$Res> implements $GameRescheduleItemCopyWith<$Res> {
  factory _$GameRescheduleItemCopyWith(_GameRescheduleItem value, $Res Function(_GameRescheduleItem) _then) = __$GameRescheduleItemCopyWithImpl;
@override @useResult
$Res call({
 int gameId, DateTime dateTime
});




}
/// @nodoc
class __$GameRescheduleItemCopyWithImpl<$Res>
    implements _$GameRescheduleItemCopyWith<$Res> {
  __$GameRescheduleItemCopyWithImpl(this._self, this._then);

  final _GameRescheduleItem _self;
  final $Res Function(_GameRescheduleItem) _then;

/// Create a copy of GameRescheduleItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gameId = null,Object? dateTime = null,}) {
  return _then(_GameRescheduleItem(
gameId: null == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as int,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
