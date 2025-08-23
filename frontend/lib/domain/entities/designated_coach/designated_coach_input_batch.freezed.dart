// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'designated_coach_input_batch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DesignatedCoachInputBatch {

 List<DesignatedCoachInput> get designations;
/// Create a copy of DesignatedCoachInputBatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DesignatedCoachInputBatchCopyWith<DesignatedCoachInputBatch> get copyWith => _$DesignatedCoachInputBatchCopyWithImpl<DesignatedCoachInputBatch>(this as DesignatedCoachInputBatch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DesignatedCoachInputBatch&&const DeepCollectionEquality().equals(other.designations, designations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(designations));

@override
String toString() {
  return 'DesignatedCoachInputBatch(designations: $designations)';
}


}

/// @nodoc
abstract mixin class $DesignatedCoachInputBatchCopyWith<$Res>  {
  factory $DesignatedCoachInputBatchCopyWith(DesignatedCoachInputBatch value, $Res Function(DesignatedCoachInputBatch) _then) = _$DesignatedCoachInputBatchCopyWithImpl;
@useResult
$Res call({
 List<DesignatedCoachInput> designations
});




}
/// @nodoc
class _$DesignatedCoachInputBatchCopyWithImpl<$Res>
    implements $DesignatedCoachInputBatchCopyWith<$Res> {
  _$DesignatedCoachInputBatchCopyWithImpl(this._self, this._then);

  final DesignatedCoachInputBatch _self;
  final $Res Function(DesignatedCoachInputBatch) _then;

/// Create a copy of DesignatedCoachInputBatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? designations = null,}) {
  return _then(_self.copyWith(
designations: null == designations ? _self.designations : designations // ignore: cast_nullable_to_non_nullable
as List<DesignatedCoachInput>,
  ));
}

}


/// Adds pattern-matching-related methods to [DesignatedCoachInputBatch].
extension DesignatedCoachInputBatchPatterns on DesignatedCoachInputBatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DesignatedCoachInputBatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DesignatedCoachInputBatch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DesignatedCoachInputBatch value)  $default,){
final _that = this;
switch (_that) {
case _DesignatedCoachInputBatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DesignatedCoachInputBatch value)?  $default,){
final _that = this;
switch (_that) {
case _DesignatedCoachInputBatch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DesignatedCoachInput> designations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DesignatedCoachInputBatch() when $default != null:
return $default(_that.designations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DesignatedCoachInput> designations)  $default,) {final _that = this;
switch (_that) {
case _DesignatedCoachInputBatch():
return $default(_that.designations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DesignatedCoachInput> designations)?  $default,) {final _that = this;
switch (_that) {
case _DesignatedCoachInputBatch() when $default != null:
return $default(_that.designations);case _:
  return null;

}
}

}

/// @nodoc


class _DesignatedCoachInputBatch implements DesignatedCoachInputBatch {
  const _DesignatedCoachInputBatch({required final  List<DesignatedCoachInput> designations}): _designations = designations;
  

 final  List<DesignatedCoachInput> _designations;
@override List<DesignatedCoachInput> get designations {
  if (_designations is EqualUnmodifiableListView) return _designations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_designations);
}


/// Create a copy of DesignatedCoachInputBatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DesignatedCoachInputBatchCopyWith<_DesignatedCoachInputBatch> get copyWith => __$DesignatedCoachInputBatchCopyWithImpl<_DesignatedCoachInputBatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DesignatedCoachInputBatch&&const DeepCollectionEquality().equals(other._designations, _designations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_designations));

@override
String toString() {
  return 'DesignatedCoachInputBatch(designations: $designations)';
}


}

/// @nodoc
abstract mixin class _$DesignatedCoachInputBatchCopyWith<$Res> implements $DesignatedCoachInputBatchCopyWith<$Res> {
  factory _$DesignatedCoachInputBatchCopyWith(_DesignatedCoachInputBatch value, $Res Function(_DesignatedCoachInputBatch) _then) = __$DesignatedCoachInputBatchCopyWithImpl;
@override @useResult
$Res call({
 List<DesignatedCoachInput> designations
});




}
/// @nodoc
class __$DesignatedCoachInputBatchCopyWithImpl<$Res>
    implements _$DesignatedCoachInputBatchCopyWith<$Res> {
  __$DesignatedCoachInputBatchCopyWithImpl(this._self, this._then);

  final _DesignatedCoachInputBatch _self;
  final $Res Function(_DesignatedCoachInputBatch) _then;

/// Create a copy of DesignatedCoachInputBatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? designations = null,}) {
  return _then(_DesignatedCoachInputBatch(
designations: null == designations ? _self._designations : designations // ignore: cast_nullable_to_non_nullable
as List<DesignatedCoachInput>,
  ));
}


}

// dart format on
