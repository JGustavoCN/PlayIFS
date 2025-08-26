// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'elimination_bracket_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EliminationBracketDTO {

// json_serializable handles enum keys by default, converting them to strings.
 Map<GamePhase, List<GameDetailsDTO>> get rounds;
/// Create a copy of EliminationBracketDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EliminationBracketDTOCopyWith<EliminationBracketDTO> get copyWith => _$EliminationBracketDTOCopyWithImpl<EliminationBracketDTO>(this as EliminationBracketDTO, _$identity);

  /// Serializes this EliminationBracketDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EliminationBracketDTO&&const DeepCollectionEquality().equals(other.rounds, rounds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(rounds));

@override
String toString() {
  return 'EliminationBracketDTO(rounds: $rounds)';
}


}

/// @nodoc
abstract mixin class $EliminationBracketDTOCopyWith<$Res>  {
  factory $EliminationBracketDTOCopyWith(EliminationBracketDTO value, $Res Function(EliminationBracketDTO) _then) = _$EliminationBracketDTOCopyWithImpl;
@useResult
$Res call({
 Map<GamePhase, List<GameDetailsDTO>> rounds
});




}
/// @nodoc
class _$EliminationBracketDTOCopyWithImpl<$Res>
    implements $EliminationBracketDTOCopyWith<$Res> {
  _$EliminationBracketDTOCopyWithImpl(this._self, this._then);

  final EliminationBracketDTO _self;
  final $Res Function(EliminationBracketDTO) _then;

/// Create a copy of EliminationBracketDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rounds = null,}) {
  return _then(_self.copyWith(
rounds: null == rounds ? _self.rounds : rounds // ignore: cast_nullable_to_non_nullable
as Map<GamePhase, List<GameDetailsDTO>>,
  ));
}

}


/// Adds pattern-matching-related methods to [EliminationBracketDTO].
extension EliminationBracketDTOPatterns on EliminationBracketDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EliminationBracketDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EliminationBracketDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EliminationBracketDTO value)  $default,){
final _that = this;
switch (_that) {
case _EliminationBracketDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EliminationBracketDTO value)?  $default,){
final _that = this;
switch (_that) {
case _EliminationBracketDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<GamePhase, List<GameDetailsDTO>> rounds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EliminationBracketDTO() when $default != null:
return $default(_that.rounds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<GamePhase, List<GameDetailsDTO>> rounds)  $default,) {final _that = this;
switch (_that) {
case _EliminationBracketDTO():
return $default(_that.rounds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<GamePhase, List<GameDetailsDTO>> rounds)?  $default,) {final _that = this;
switch (_that) {
case _EliminationBracketDTO() when $default != null:
return $default(_that.rounds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EliminationBracketDTO implements EliminationBracketDTO {
  const _EliminationBracketDTO({required final  Map<GamePhase, List<GameDetailsDTO>> rounds}): _rounds = rounds;
  factory _EliminationBracketDTO.fromJson(Map<String, dynamic> json) => _$EliminationBracketDTOFromJson(json);

// json_serializable handles enum keys by default, converting them to strings.
 final  Map<GamePhase, List<GameDetailsDTO>> _rounds;
// json_serializable handles enum keys by default, converting them to strings.
@override Map<GamePhase, List<GameDetailsDTO>> get rounds {
  if (_rounds is EqualUnmodifiableMapView) return _rounds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_rounds);
}


/// Create a copy of EliminationBracketDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EliminationBracketDTOCopyWith<_EliminationBracketDTO> get copyWith => __$EliminationBracketDTOCopyWithImpl<_EliminationBracketDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EliminationBracketDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EliminationBracketDTO&&const DeepCollectionEquality().equals(other._rounds, _rounds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_rounds));

@override
String toString() {
  return 'EliminationBracketDTO(rounds: $rounds)';
}


}

/// @nodoc
abstract mixin class _$EliminationBracketDTOCopyWith<$Res> implements $EliminationBracketDTOCopyWith<$Res> {
  factory _$EliminationBracketDTOCopyWith(_EliminationBracketDTO value, $Res Function(_EliminationBracketDTO) _then) = __$EliminationBracketDTOCopyWithImpl;
@override @useResult
$Res call({
 Map<GamePhase, List<GameDetailsDTO>> rounds
});




}
/// @nodoc
class __$EliminationBracketDTOCopyWithImpl<$Res>
    implements _$EliminationBracketDTOCopyWith<$Res> {
  __$EliminationBracketDTOCopyWithImpl(this._self, this._then);

  final _EliminationBracketDTO _self;
  final $Res Function(_EliminationBracketDTO) _then;

/// Create a copy of EliminationBracketDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rounds = null,}) {
  return _then(_EliminationBracketDTO(
rounds: null == rounds ? _self._rounds : rounds // ignore: cast_nullable_to_non_nullable
as Map<GamePhase, List<GameDetailsDTO>>,
  ));
}


}

// dart format on
