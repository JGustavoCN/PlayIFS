// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_reschedule_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameRescheduleItemDTO {

 int get gameId; String get dateTime;
/// Create a copy of GameRescheduleItemDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameRescheduleItemDTOCopyWith<GameRescheduleItemDTO> get copyWith => _$GameRescheduleItemDTOCopyWithImpl<GameRescheduleItemDTO>(this as GameRescheduleItemDTO, _$identity);

  /// Serializes this GameRescheduleItemDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameRescheduleItemDTO&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gameId,dateTime);

@override
String toString() {
  return 'GameRescheduleItemDTO(gameId: $gameId, dateTime: $dateTime)';
}


}

/// @nodoc
abstract mixin class $GameRescheduleItemDTOCopyWith<$Res>  {
  factory $GameRescheduleItemDTOCopyWith(GameRescheduleItemDTO value, $Res Function(GameRescheduleItemDTO) _then) = _$GameRescheduleItemDTOCopyWithImpl;
@useResult
$Res call({
 int gameId, String dateTime
});




}
/// @nodoc
class _$GameRescheduleItemDTOCopyWithImpl<$Res>
    implements $GameRescheduleItemDTOCopyWith<$Res> {
  _$GameRescheduleItemDTOCopyWithImpl(this._self, this._then);

  final GameRescheduleItemDTO _self;
  final $Res Function(GameRescheduleItemDTO) _then;

/// Create a copy of GameRescheduleItemDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gameId = null,Object? dateTime = null,}) {
  return _then(_self.copyWith(
gameId: null == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as int,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GameRescheduleItemDTO].
extension GameRescheduleItemDTOPatterns on GameRescheduleItemDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameRescheduleItemDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameRescheduleItemDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameRescheduleItemDTO value)  $default,){
final _that = this;
switch (_that) {
case _GameRescheduleItemDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameRescheduleItemDTO value)?  $default,){
final _that = this;
switch (_that) {
case _GameRescheduleItemDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int gameId,  String dateTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameRescheduleItemDTO() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int gameId,  String dateTime)  $default,) {final _that = this;
switch (_that) {
case _GameRescheduleItemDTO():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int gameId,  String dateTime)?  $default,) {final _that = this;
switch (_that) {
case _GameRescheduleItemDTO() when $default != null:
return $default(_that.gameId,_that.dateTime);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
class _GameRescheduleItemDTO implements GameRescheduleItemDTO {
  const _GameRescheduleItemDTO({required this.gameId, required this.dateTime});
  factory _GameRescheduleItemDTO.fromJson(Map<String, dynamic> json) => _$GameRescheduleItemDTOFromJson(json);

@override final  int gameId;
@override final  String dateTime;

/// Create a copy of GameRescheduleItemDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameRescheduleItemDTOCopyWith<_GameRescheduleItemDTO> get copyWith => __$GameRescheduleItemDTOCopyWithImpl<_GameRescheduleItemDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameRescheduleItemDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameRescheduleItemDTO&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gameId,dateTime);

@override
String toString() {
  return 'GameRescheduleItemDTO(gameId: $gameId, dateTime: $dateTime)';
}


}

/// @nodoc
abstract mixin class _$GameRescheduleItemDTOCopyWith<$Res> implements $GameRescheduleItemDTOCopyWith<$Res> {
  factory _$GameRescheduleItemDTOCopyWith(_GameRescheduleItemDTO value, $Res Function(_GameRescheduleItemDTO) _then) = __$GameRescheduleItemDTOCopyWithImpl;
@override @useResult
$Res call({
 int gameId, String dateTime
});




}
/// @nodoc
class __$GameRescheduleItemDTOCopyWithImpl<$Res>
    implements _$GameRescheduleItemDTOCopyWith<$Res> {
  __$GameRescheduleItemDTOCopyWithImpl(this._self, this._then);

  final _GameRescheduleItemDTO _self;
  final $Res Function(_GameRescheduleItemDTO) _then;

/// Create a copy of GameRescheduleItemDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gameId = null,Object? dateTime = null,}) {
  return _then(_GameRescheduleItemDTO(
gameId: null == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as int,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
