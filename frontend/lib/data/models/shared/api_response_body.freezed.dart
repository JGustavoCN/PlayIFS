// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiResponseBody<T> {

 T get data;
/// Create a copy of ApiResponseBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseBodyCopyWith<T, ApiResponseBody<T>> get copyWith => _$ApiResponseBodyCopyWithImpl<T, ApiResponseBody<T>>(this as ApiResponseBody<T>, _$identity);

  /// Serializes this ApiResponseBody to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponseBody<T>&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ApiResponseBody<$T>(data: $data)';
}


}

/// @nodoc
abstract mixin class $ApiResponseBodyCopyWith<T,$Res>  {
  factory $ApiResponseBodyCopyWith(ApiResponseBody<T> value, $Res Function(ApiResponseBody<T>) _then) = _$ApiResponseBodyCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$ApiResponseBodyCopyWithImpl<T,$Res>
    implements $ApiResponseBodyCopyWith<T, $Res> {
  _$ApiResponseBodyCopyWithImpl(this._self, this._then);

  final ApiResponseBody<T> _self;
  final $Res Function(ApiResponseBody<T>) _then;

/// Create a copy of ApiResponseBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiResponseBody].
extension ApiResponseBodyPatterns<T> on ApiResponseBody<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponseBody<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiResponseBody() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponseBody<T> value)  $default,){
final _that = this;
switch (_that) {
case _ApiResponseBody():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponseBody<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ApiResponseBody() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( T data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiResponseBody() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( T data)  $default,) {final _that = this;
switch (_that) {
case _ApiResponseBody():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( T data)?  $default,) {final _that = this;
switch (_that) {
case _ApiResponseBody() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _ApiResponseBody<T> implements ApiResponseBody<T> {
  const _ApiResponseBody({required this.data});
  factory _ApiResponseBody.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ApiResponseBodyFromJson(json,fromJsonT);

@override final  T data;

/// Create a copy of ApiResponseBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseBodyCopyWith<T, _ApiResponseBody<T>> get copyWith => __$ApiResponseBodyCopyWithImpl<T, _ApiResponseBody<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ApiResponseBodyToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponseBody<T>&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ApiResponseBody<$T>(data: $data)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseBodyCopyWith<T,$Res> implements $ApiResponseBodyCopyWith<T, $Res> {
  factory _$ApiResponseBodyCopyWith(_ApiResponseBody<T> value, $Res Function(_ApiResponseBody<T>) _then) = __$ApiResponseBodyCopyWithImpl;
@override @useResult
$Res call({
 T data
});




}
/// @nodoc
class __$ApiResponseBodyCopyWithImpl<T,$Res>
    implements _$ApiResponseBodyCopyWith<T, $Res> {
  __$ApiResponseBodyCopyWithImpl(this._self, this._then);

  final _ApiResponseBody<T> _self;
  final $Res Function(_ApiResponseBody<T>) _then;

/// Create a copy of ApiResponseBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_ApiResponseBody<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

// dart format on
