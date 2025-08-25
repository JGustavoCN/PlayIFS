// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'id_batch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IdBatch {

 List<int> get ids;
/// Create a copy of IdBatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdBatchCopyWith<IdBatch> get copyWith => _$IdBatchCopyWithImpl<IdBatch>(this as IdBatch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdBatch&&const DeepCollectionEquality().equals(other.ids, ids));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(ids));

@override
String toString() {
  return 'IdBatch(ids: $ids)';
}


}

/// @nodoc
abstract mixin class $IdBatchCopyWith<$Res>  {
  factory $IdBatchCopyWith(IdBatch value, $Res Function(IdBatch) _then) = _$IdBatchCopyWithImpl;
@useResult
$Res call({
 List<int> ids
});




}
/// @nodoc
class _$IdBatchCopyWithImpl<$Res>
    implements $IdBatchCopyWith<$Res> {
  _$IdBatchCopyWithImpl(this._self, this._then);

  final IdBatch _self;
  final $Res Function(IdBatch) _then;

/// Create a copy of IdBatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ids = null,}) {
  return _then(_self.copyWith(
ids: null == ids ? _self.ids : ids // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [IdBatch].
extension IdBatchPatterns on IdBatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IdBatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdBatch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IdBatch value)  $default,){
final _that = this;
switch (_that) {
case _IdBatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IdBatch value)?  $default,){
final _that = this;
switch (_that) {
case _IdBatch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> ids)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdBatch() when $default != null:
return $default(_that.ids);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> ids)  $default,) {final _that = this;
switch (_that) {
case _IdBatch():
return $default(_that.ids);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> ids)?  $default,) {final _that = this;
switch (_that) {
case _IdBatch() when $default != null:
return $default(_that.ids);case _:
  return null;

}
}

}

/// @nodoc


class _IdBatch implements IdBatch {
  const _IdBatch({required final  List<int> ids}): _ids = ids;
  

 final  List<int> _ids;
@override List<int> get ids {
  if (_ids is EqualUnmodifiableListView) return _ids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ids);
}


/// Create a copy of IdBatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdBatchCopyWith<_IdBatch> get copyWith => __$IdBatchCopyWithImpl<_IdBatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdBatch&&const DeepCollectionEquality().equals(other._ids, _ids));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ids));

@override
String toString() {
  return 'IdBatch(ids: $ids)';
}


}

/// @nodoc
abstract mixin class _$IdBatchCopyWith<$Res> implements $IdBatchCopyWith<$Res> {
  factory _$IdBatchCopyWith(_IdBatch value, $Res Function(_IdBatch) _then) = __$IdBatchCopyWithImpl;
@override @useResult
$Res call({
 List<int> ids
});




}
/// @nodoc
class __$IdBatchCopyWithImpl<$Res>
    implements _$IdBatchCopyWith<$Res> {
  __$IdBatchCopyWithImpl(this._self, this._then);

  final _IdBatch _self;
  final $Res Function(_IdBatch) _then;

/// Create a copy of IdBatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ids = null,}) {
  return _then(_IdBatch(
ids: null == ids ? _self._ids : ids // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
