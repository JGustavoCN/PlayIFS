// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'elimination_bracket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EliminationBracket {

 Map<GamePhase, List<GameDetails>> get rounds;
/// Create a copy of EliminationBracket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EliminationBracketCopyWith<EliminationBracket> get copyWith => _$EliminationBracketCopyWithImpl<EliminationBracket>(this as EliminationBracket, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EliminationBracket&&const DeepCollectionEquality().equals(other.rounds, rounds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(rounds));

@override
String toString() {
  return 'EliminationBracket(rounds: $rounds)';
}


}

/// @nodoc
abstract mixin class $EliminationBracketCopyWith<$Res>  {
  factory $EliminationBracketCopyWith(EliminationBracket value, $Res Function(EliminationBracket) _then) = _$EliminationBracketCopyWithImpl;
@useResult
$Res call({
 Map<GamePhase, List<GameDetails>> rounds
});




}
/// @nodoc
class _$EliminationBracketCopyWithImpl<$Res>
    implements $EliminationBracketCopyWith<$Res> {
  _$EliminationBracketCopyWithImpl(this._self, this._then);

  final EliminationBracket _self;
  final $Res Function(EliminationBracket) _then;

/// Create a copy of EliminationBracket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rounds = null,}) {
  return _then(_self.copyWith(
rounds: null == rounds ? _self.rounds : rounds // ignore: cast_nullable_to_non_nullable
as Map<GamePhase, List<GameDetails>>,
  ));
}

}


/// Adds pattern-matching-related methods to [EliminationBracket].
extension EliminationBracketPatterns on EliminationBracket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EliminationBracket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EliminationBracket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EliminationBracket value)  $default,){
final _that = this;
switch (_that) {
case _EliminationBracket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EliminationBracket value)?  $default,){
final _that = this;
switch (_that) {
case _EliminationBracket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<GamePhase, List<GameDetails>> rounds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EliminationBracket() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<GamePhase, List<GameDetails>> rounds)  $default,) {final _that = this;
switch (_that) {
case _EliminationBracket():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<GamePhase, List<GameDetails>> rounds)?  $default,) {final _that = this;
switch (_that) {
case _EliminationBracket() when $default != null:
return $default(_that.rounds);case _:
  return null;

}
}

}

/// @nodoc


class _EliminationBracket implements EliminationBracket {
  const _EliminationBracket({required final  Map<GamePhase, List<GameDetails>> rounds}): _rounds = rounds;
  

 final  Map<GamePhase, List<GameDetails>> _rounds;
@override Map<GamePhase, List<GameDetails>> get rounds {
  if (_rounds is EqualUnmodifiableMapView) return _rounds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_rounds);
}


/// Create a copy of EliminationBracket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EliminationBracketCopyWith<_EliminationBracket> get copyWith => __$EliminationBracketCopyWithImpl<_EliminationBracket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EliminationBracket&&const DeepCollectionEquality().equals(other._rounds, _rounds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_rounds));

@override
String toString() {
  return 'EliminationBracket(rounds: $rounds)';
}


}

/// @nodoc
abstract mixin class _$EliminationBracketCopyWith<$Res> implements $EliminationBracketCopyWith<$Res> {
  factory _$EliminationBracketCopyWith(_EliminationBracket value, $Res Function(_EliminationBracket) _then) = __$EliminationBracketCopyWithImpl;
@override @useResult
$Res call({
 Map<GamePhase, List<GameDetails>> rounds
});




}
/// @nodoc
class __$EliminationBracketCopyWithImpl<$Res>
    implements _$EliminationBracketCopyWith<$Res> {
  __$EliminationBracketCopyWithImpl(this._self, this._then);

  final _EliminationBracket _self;
  final $Res Function(_EliminationBracket) _then;

/// Create a copy of EliminationBracket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rounds = null,}) {
  return _then(_EliminationBracket(
rounds: null == rounds ? _self._rounds : rounds // ignore: cast_nullable_to_non_nullable
as Map<GamePhase, List<GameDetails>>,
  ));
}


}

// dart format on
