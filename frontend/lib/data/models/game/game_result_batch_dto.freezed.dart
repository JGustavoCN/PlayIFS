// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_result_batch_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameResultBatchDTO {

 List<GameResultItemDTO> get results;
/// Create a copy of GameResultBatchDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameResultBatchDTOCopyWith<GameResultBatchDTO> get copyWith => _$GameResultBatchDTOCopyWithImpl<GameResultBatchDTO>(this as GameResultBatchDTO, _$identity);

  /// Serializes this GameResultBatchDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameResultBatchDTO&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'GameResultBatchDTO(results: $results)';
}


}

/// @nodoc
abstract mixin class $GameResultBatchDTOCopyWith<$Res>  {
  factory $GameResultBatchDTOCopyWith(GameResultBatchDTO value, $Res Function(GameResultBatchDTO) _then) = _$GameResultBatchDTOCopyWithImpl;
@useResult
$Res call({
 List<GameResultItemDTO> results
});




}
/// @nodoc
class _$GameResultBatchDTOCopyWithImpl<$Res>
    implements $GameResultBatchDTOCopyWith<$Res> {
  _$GameResultBatchDTOCopyWithImpl(this._self, this._then);

  final GameResultBatchDTO _self;
  final $Res Function(GameResultBatchDTO) _then;

/// Create a copy of GameResultBatchDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,}) {
  return _then(_self.copyWith(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<GameResultItemDTO>,
  ));
}

}


/// Adds pattern-matching-related methods to [GameResultBatchDTO].
extension GameResultBatchDTOPatterns on GameResultBatchDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameResultBatchDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameResultBatchDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameResultBatchDTO value)  $default,){
final _that = this;
switch (_that) {
case _GameResultBatchDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameResultBatchDTO value)?  $default,){
final _that = this;
switch (_that) {
case _GameResultBatchDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GameResultItemDTO> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameResultBatchDTO() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GameResultItemDTO> results)  $default,) {final _that = this;
switch (_that) {
case _GameResultBatchDTO():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GameResultItemDTO> results)?  $default,) {final _that = this;
switch (_that) {
case _GameResultBatchDTO() when $default != null:
return $default(_that.results);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
class _GameResultBatchDTO implements GameResultBatchDTO {
  const _GameResultBatchDTO({required final  List<GameResultItemDTO> results}): _results = results;
  factory _GameResultBatchDTO.fromJson(Map<String, dynamic> json) => _$GameResultBatchDTOFromJson(json);

 final  List<GameResultItemDTO> _results;
@override List<GameResultItemDTO> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of GameResultBatchDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameResultBatchDTOCopyWith<_GameResultBatchDTO> get copyWith => __$GameResultBatchDTOCopyWithImpl<_GameResultBatchDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameResultBatchDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameResultBatchDTO&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'GameResultBatchDTO(results: $results)';
}


}

/// @nodoc
abstract mixin class _$GameResultBatchDTOCopyWith<$Res> implements $GameResultBatchDTOCopyWith<$Res> {
  factory _$GameResultBatchDTOCopyWith(_GameResultBatchDTO value, $Res Function(_GameResultBatchDTO) _then) = __$GameResultBatchDTOCopyWithImpl;
@override @useResult
$Res call({
 List<GameResultItemDTO> results
});




}
/// @nodoc
class __$GameResultBatchDTOCopyWithImpl<$Res>
    implements _$GameResultBatchDTOCopyWith<$Res> {
  __$GameResultBatchDTOCopyWithImpl(this._self, this._then);

  final _GameResultBatchDTO _self;
  final $Res Function(_GameResultBatchDTO) _then;

/// Create a copy of GameResultBatchDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(_GameResultBatchDTO(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<GameResultItemDTO>,
  ));
}


}

// dart format on
