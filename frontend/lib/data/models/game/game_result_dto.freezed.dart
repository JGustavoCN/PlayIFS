// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameResultDTO {

 int get scoreTeamA; int get scoreTeamB;
/// Create a copy of GameResultDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameResultDTOCopyWith<GameResultDTO> get copyWith => _$GameResultDTOCopyWithImpl<GameResultDTO>(this as GameResultDTO, _$identity);

  /// Serializes this GameResultDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameResultDTO&&(identical(other.scoreTeamA, scoreTeamA) || other.scoreTeamA == scoreTeamA)&&(identical(other.scoreTeamB, scoreTeamB) || other.scoreTeamB == scoreTeamB));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scoreTeamA,scoreTeamB);

@override
String toString() {
  return 'GameResultDTO(scoreTeamA: $scoreTeamA, scoreTeamB: $scoreTeamB)';
}


}

/// @nodoc
abstract mixin class $GameResultDTOCopyWith<$Res>  {
  factory $GameResultDTOCopyWith(GameResultDTO value, $Res Function(GameResultDTO) _then) = _$GameResultDTOCopyWithImpl;
@useResult
$Res call({
 int scoreTeamA, int scoreTeamB
});




}
/// @nodoc
class _$GameResultDTOCopyWithImpl<$Res>
    implements $GameResultDTOCopyWith<$Res> {
  _$GameResultDTOCopyWithImpl(this._self, this._then);

  final GameResultDTO _self;
  final $Res Function(GameResultDTO) _then;

/// Create a copy of GameResultDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scoreTeamA = null,Object? scoreTeamB = null,}) {
  return _then(_self.copyWith(
scoreTeamA: null == scoreTeamA ? _self.scoreTeamA : scoreTeamA // ignore: cast_nullable_to_non_nullable
as int,scoreTeamB: null == scoreTeamB ? _self.scoreTeamB : scoreTeamB // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GameResultDTO].
extension GameResultDTOPatterns on GameResultDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameResultDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameResultDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameResultDTO value)  $default,){
final _that = this;
switch (_that) {
case _GameResultDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameResultDTO value)?  $default,){
final _that = this;
switch (_that) {
case _GameResultDTO() when $default != null:
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
case _GameResultDTO() when $default != null:
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
case _GameResultDTO():
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
case _GameResultDTO() when $default != null:
return $default(_that.scoreTeamA,_that.scoreTeamB);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
class _GameResultDTO implements GameResultDTO {
  const _GameResultDTO({required this.scoreTeamA, required this.scoreTeamB});
  factory _GameResultDTO.fromJson(Map<String, dynamic> json) => _$GameResultDTOFromJson(json);

@override final  int scoreTeamA;
@override final  int scoreTeamB;

/// Create a copy of GameResultDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameResultDTOCopyWith<_GameResultDTO> get copyWith => __$GameResultDTOCopyWithImpl<_GameResultDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameResultDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameResultDTO&&(identical(other.scoreTeamA, scoreTeamA) || other.scoreTeamA == scoreTeamA)&&(identical(other.scoreTeamB, scoreTeamB) || other.scoreTeamB == scoreTeamB));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scoreTeamA,scoreTeamB);

@override
String toString() {
  return 'GameResultDTO(scoreTeamA: $scoreTeamA, scoreTeamB: $scoreTeamB)';
}


}

/// @nodoc
abstract mixin class _$GameResultDTOCopyWith<$Res> implements $GameResultDTOCopyWith<$Res> {
  factory _$GameResultDTOCopyWith(_GameResultDTO value, $Res Function(_GameResultDTO) _then) = __$GameResultDTOCopyWithImpl;
@override @useResult
$Res call({
 int scoreTeamA, int scoreTeamB
});




}
/// @nodoc
class __$GameResultDTOCopyWithImpl<$Res>
    implements _$GameResultDTOCopyWith<$Res> {
  __$GameResultDTOCopyWithImpl(this._self, this._then);

  final _GameResultDTO _self;
  final $Res Function(_GameResultDTO) _then;

/// Create a copy of GameResultDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scoreTeamA = null,Object? scoreTeamB = null,}) {
  return _then(_GameResultDTO(
scoreTeamA: null == scoreTeamA ? _self.scoreTeamA : scoreTeamA // ignore: cast_nullable_to_non_nullable
as int,scoreTeamB: null == scoreTeamB ? _self.scoreTeamB : scoreTeamB // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
