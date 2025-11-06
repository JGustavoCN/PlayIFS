// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_result_batch_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameResultBatchInput {

 List<GameResultItem> get results;
/// Create a copy of GameResultBatchInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameResultBatchInputCopyWith<GameResultBatchInput> get copyWith => _$GameResultBatchInputCopyWithImpl<GameResultBatchInput>(this as GameResultBatchInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameResultBatchInput&&const DeepCollectionEquality().equals(other.results, results));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'GameResultBatchInput(results: $results)';
}


}

/// @nodoc
abstract mixin class $GameResultBatchInputCopyWith<$Res>  {
  factory $GameResultBatchInputCopyWith(GameResultBatchInput value, $Res Function(GameResultBatchInput) _then) = _$GameResultBatchInputCopyWithImpl;
@useResult
$Res call({
 List<GameResultItem> results
});




}
/// @nodoc
class _$GameResultBatchInputCopyWithImpl<$Res>
    implements $GameResultBatchInputCopyWith<$Res> {
  _$GameResultBatchInputCopyWithImpl(this._self, this._then);

  final GameResultBatchInput _self;
  final $Res Function(GameResultBatchInput) _then;

/// Create a copy of GameResultBatchInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,}) {
  return _then(_self.copyWith(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<GameResultItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [GameResultBatchInput].
extension GameResultBatchInputPatterns on GameResultBatchInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameResultBatchInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameResultBatchInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameResultBatchInput value)  $default,){
final _that = this;
switch (_that) {
case _GameResultBatchInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameResultBatchInput value)?  $default,){
final _that = this;
switch (_that) {
case _GameResultBatchInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GameResultItem> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameResultBatchInput() when $default != null:
return $default(_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GameResultItem> results)  $default,) {final _that = this;
switch (_that) {
case _GameResultBatchInput():
return $default(_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GameResultItem> results)?  $default,) {final _that = this;
switch (_that) {
case _GameResultBatchInput() when $default != null:
return $default(_that.results);case _:
  return null;

}
}

}

/// @nodoc


class _GameResultBatchInput implements GameResultBatchInput {
  const _GameResultBatchInput({required final  List<GameResultItem> results}): _results = results;
  

 final  List<GameResultItem> _results;
@override List<GameResultItem> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of GameResultBatchInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameResultBatchInputCopyWith<_GameResultBatchInput> get copyWith => __$GameResultBatchInputCopyWithImpl<_GameResultBatchInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameResultBatchInput&&const DeepCollectionEquality().equals(other._results, _results));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'GameResultBatchInput(results: $results)';
}


}

/// @nodoc
abstract mixin class _$GameResultBatchInputCopyWith<$Res> implements $GameResultBatchInputCopyWith<$Res> {
  factory _$GameResultBatchInputCopyWith(_GameResultBatchInput value, $Res Function(_GameResultBatchInput) _then) = __$GameResultBatchInputCopyWithImpl;
@override @useResult
$Res call({
 List<GameResultItem> results
});




}
/// @nodoc
class __$GameResultBatchInputCopyWithImpl<$Res>
    implements _$GameResultBatchInputCopyWith<$Res> {
  __$GameResultBatchInputCopyWithImpl(this._self, this._then);

  final _GameResultBatchInput _self;
  final $Res Function(_GameResultBatchInput) _then;

/// Create a copy of GameResultBatchInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(_GameResultBatchInput(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<GameResultItem>,
  ));
}


}

// dart format on
