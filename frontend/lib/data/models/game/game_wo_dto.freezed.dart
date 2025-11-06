// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_wo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameWoDTO {

 int get winnerTeamId;
/// Create a copy of GameWoDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameWoDTOCopyWith<GameWoDTO> get copyWith => _$GameWoDTOCopyWithImpl<GameWoDTO>(this as GameWoDTO, _$identity);

  /// Serializes this GameWoDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameWoDTO&&(identical(other.winnerTeamId, winnerTeamId) || other.winnerTeamId == winnerTeamId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,winnerTeamId);

@override
String toString() {
  return 'GameWoDTO(winnerTeamId: $winnerTeamId)';
}


}

/// @nodoc
abstract mixin class $GameWoDTOCopyWith<$Res>  {
  factory $GameWoDTOCopyWith(GameWoDTO value, $Res Function(GameWoDTO) _then) = _$GameWoDTOCopyWithImpl;
@useResult
$Res call({
 int winnerTeamId
});




}
/// @nodoc
class _$GameWoDTOCopyWithImpl<$Res>
    implements $GameWoDTOCopyWith<$Res> {
  _$GameWoDTOCopyWithImpl(this._self, this._then);

  final GameWoDTO _self;
  final $Res Function(GameWoDTO) _then;

/// Create a copy of GameWoDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? winnerTeamId = null,}) {
  return _then(_self.copyWith(
winnerTeamId: null == winnerTeamId ? _self.winnerTeamId : winnerTeamId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GameWoDTO].
extension GameWoDTOPatterns on GameWoDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameWoDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameWoDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameWoDTO value)  $default,){
final _that = this;
switch (_that) {
case _GameWoDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameWoDTO value)?  $default,){
final _that = this;
switch (_that) {
case _GameWoDTO() when $default != null:
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
case _GameWoDTO() when $default != null:
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
case _GameWoDTO():
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
case _GameWoDTO() when $default != null:
return $default(_that.winnerTeamId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
class _GameWoDTO implements GameWoDTO {
  const _GameWoDTO({required this.winnerTeamId});
  factory _GameWoDTO.fromJson(Map<String, dynamic> json) => _$GameWoDTOFromJson(json);

@override final  int winnerTeamId;

/// Create a copy of GameWoDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameWoDTOCopyWith<_GameWoDTO> get copyWith => __$GameWoDTOCopyWithImpl<_GameWoDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameWoDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameWoDTO&&(identical(other.winnerTeamId, winnerTeamId) || other.winnerTeamId == winnerTeamId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,winnerTeamId);

@override
String toString() {
  return 'GameWoDTO(winnerTeamId: $winnerTeamId)';
}


}

/// @nodoc
abstract mixin class _$GameWoDTOCopyWith<$Res> implements $GameWoDTOCopyWith<$Res> {
  factory _$GameWoDTOCopyWith(_GameWoDTO value, $Res Function(_GameWoDTO) _then) = __$GameWoDTOCopyWithImpl;
@override @useResult
$Res call({
 int winnerTeamId
});




}
/// @nodoc
class __$GameWoDTOCopyWithImpl<$Res>
    implements _$GameWoDTOCopyWith<$Res> {
  __$GameWoDTOCopyWithImpl(this._self, this._then);

  final _GameWoDTO _self;
  final $Res Function(_GameWoDTO) _then;

/// Create a copy of GameWoDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? winnerTeamId = null,}) {
  return _then(_GameWoDTO(
winnerTeamId: null == winnerTeamId ? _self.winnerTeamId : winnerTeamId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
