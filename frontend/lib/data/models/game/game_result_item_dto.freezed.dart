// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_result_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameResultItemDTO {

 int get gameId; int get scoreTeamA; int get scoreTeamB;
/// Create a copy of GameResultItemDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameResultItemDTOCopyWith<GameResultItemDTO> get copyWith => _$GameResultItemDTOCopyWithImpl<GameResultItemDTO>(this as GameResultItemDTO, _$identity);

  /// Serializes this GameResultItemDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameResultItemDTO&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.scoreTeamA, scoreTeamA) || other.scoreTeamA == scoreTeamA)&&(identical(other.scoreTeamB, scoreTeamB) || other.scoreTeamB == scoreTeamB));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gameId,scoreTeamA,scoreTeamB);

@override
String toString() {
  return 'GameResultItemDTO(gameId: $gameId, scoreTeamA: $scoreTeamA, scoreTeamB: $scoreTeamB)';
}


}

/// @nodoc
abstract mixin class $GameResultItemDTOCopyWith<$Res>  {
  factory $GameResultItemDTOCopyWith(GameResultItemDTO value, $Res Function(GameResultItemDTO) _then) = _$GameResultItemDTOCopyWithImpl;
@useResult
$Res call({
 int gameId, int scoreTeamA, int scoreTeamB
});




}
/// @nodoc
class _$GameResultItemDTOCopyWithImpl<$Res>
    implements $GameResultItemDTOCopyWith<$Res> {
  _$GameResultItemDTOCopyWithImpl(this._self, this._then);

  final GameResultItemDTO _self;
  final $Res Function(GameResultItemDTO) _then;

/// Create a copy of GameResultItemDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gameId = null,Object? scoreTeamA = null,Object? scoreTeamB = null,}) {
  return _then(_self.copyWith(
gameId: null == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as int,scoreTeamA: null == scoreTeamA ? _self.scoreTeamA : scoreTeamA // ignore: cast_nullable_to_non_nullable
as int,scoreTeamB: null == scoreTeamB ? _self.scoreTeamB : scoreTeamB // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GameResultItemDTO].
extension GameResultItemDTOPatterns on GameResultItemDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameResultItemDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameResultItemDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameResultItemDTO value)  $default,){
final _that = this;
switch (_that) {
case _GameResultItemDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameResultItemDTO value)?  $default,){
final _that = this;
switch (_that) {
case _GameResultItemDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int gameId,  int scoreTeamA,  int scoreTeamB)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameResultItemDTO() when $default != null:
return $default(_that.gameId,_that.scoreTeamA,_that.scoreTeamB);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int gameId,  int scoreTeamA,  int scoreTeamB)  $default,) {final _that = this;
switch (_that) {
case _GameResultItemDTO():
return $default(_that.gameId,_that.scoreTeamA,_that.scoreTeamB);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int gameId,  int scoreTeamA,  int scoreTeamB)?  $default,) {final _that = this;
switch (_that) {
case _GameResultItemDTO() when $default != null:
return $default(_that.gameId,_that.scoreTeamA,_that.scoreTeamB);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
class _GameResultItemDTO implements GameResultItemDTO {
  const _GameResultItemDTO({required this.gameId, required this.scoreTeamA, required this.scoreTeamB});
  factory _GameResultItemDTO.fromJson(Map<String, dynamic> json) => _$GameResultItemDTOFromJson(json);

@override final  int gameId;
@override final  int scoreTeamA;
@override final  int scoreTeamB;

/// Create a copy of GameResultItemDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameResultItemDTOCopyWith<_GameResultItemDTO> get copyWith => __$GameResultItemDTOCopyWithImpl<_GameResultItemDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameResultItemDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameResultItemDTO&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.scoreTeamA, scoreTeamA) || other.scoreTeamA == scoreTeamA)&&(identical(other.scoreTeamB, scoreTeamB) || other.scoreTeamB == scoreTeamB));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gameId,scoreTeamA,scoreTeamB);

@override
String toString() {
  return 'GameResultItemDTO(gameId: $gameId, scoreTeamA: $scoreTeamA, scoreTeamB: $scoreTeamB)';
}


}

/// @nodoc
abstract mixin class _$GameResultItemDTOCopyWith<$Res> implements $GameResultItemDTOCopyWith<$Res> {
  factory _$GameResultItemDTOCopyWith(_GameResultItemDTO value, $Res Function(_GameResultItemDTO) _then) = __$GameResultItemDTOCopyWithImpl;
@override @useResult
$Res call({
 int gameId, int scoreTeamA, int scoreTeamB
});




}
/// @nodoc
class __$GameResultItemDTOCopyWithImpl<$Res>
    implements _$GameResultItemDTOCopyWith<$Res> {
  __$GameResultItemDTOCopyWithImpl(this._self, this._then);

  final _GameResultItemDTO _self;
  final $Res Function(_GameResultItemDTO) _then;

/// Create a copy of GameResultItemDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gameId = null,Object? scoreTeamA = null,Object? scoreTeamB = null,}) {
  return _then(_GameResultItemDTO(
gameId: null == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as int,scoreTeamA: null == scoreTeamA ? _self.scoreTeamA : scoreTeamA // ignore: cast_nullable_to_non_nullable
as int,scoreTeamB: null == scoreTeamB ? _self.scoreTeamB : scoreTeamB // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
