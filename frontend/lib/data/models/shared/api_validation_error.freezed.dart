// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_validation_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiValidationError {

 int get status; String get error; List<FieldError> get errors; String get path; String get timestamp;
/// Create a copy of ApiValidationError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiValidationErrorCopyWith<ApiValidationError> get copyWith => _$ApiValidationErrorCopyWithImpl<ApiValidationError>(this as ApiValidationError, _$identity);

  /// Serializes this ApiValidationError to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiValidationError&&(identical(other.status, status) || other.status == status)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.errors, errors)&&(identical(other.path, path) || other.path == path)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,error,const DeepCollectionEquality().hash(errors),path,timestamp);

@override
String toString() {
  return 'ApiValidationError(status: $status, error: $error, errors: $errors, path: $path, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $ApiValidationErrorCopyWith<$Res>  {
  factory $ApiValidationErrorCopyWith(ApiValidationError value, $Res Function(ApiValidationError) _then) = _$ApiValidationErrorCopyWithImpl;
@useResult
$Res call({
 int status, String error, List<FieldError> errors, String path, String timestamp
});




}
/// @nodoc
class _$ApiValidationErrorCopyWithImpl<$Res>
    implements $ApiValidationErrorCopyWith<$Res> {
  _$ApiValidationErrorCopyWithImpl(this._self, this._then);

  final ApiValidationError _self;
  final $Res Function(ApiValidationError) _then;

/// Create a copy of ApiValidationError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? error = null,Object? errors = null,Object? path = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,errors: null == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as List<FieldError>,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiValidationError].
extension ApiValidationErrorPatterns on ApiValidationError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiValidationError value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiValidationError() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiValidationError value)  $default,){
final _that = this;
switch (_that) {
case _ApiValidationError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiValidationError value)?  $default,){
final _that = this;
switch (_that) {
case _ApiValidationError() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int status,  String error,  List<FieldError> errors,  String path,  String timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiValidationError() when $default != null:
return $default(_that.status,_that.error,_that.errors,_that.path,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int status,  String error,  List<FieldError> errors,  String path,  String timestamp)  $default,) {final _that = this;
switch (_that) {
case _ApiValidationError():
return $default(_that.status,_that.error,_that.errors,_that.path,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int status,  String error,  List<FieldError> errors,  String path,  String timestamp)?  $default,) {final _that = this;
switch (_that) {
case _ApiValidationError() when $default != null:
return $default(_that.status,_that.error,_that.errors,_that.path,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiValidationError implements ApiValidationError {
  const _ApiValidationError({required this.status, required this.error, required final  List<FieldError> errors, required this.path, required this.timestamp}): _errors = errors;
  factory _ApiValidationError.fromJson(Map<String, dynamic> json) => _$ApiValidationErrorFromJson(json);

@override final  int status;
@override final  String error;
 final  List<FieldError> _errors;
@override List<FieldError> get errors {
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_errors);
}

@override final  String path;
@override final  String timestamp;

/// Create a copy of ApiValidationError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiValidationErrorCopyWith<_ApiValidationError> get copyWith => __$ApiValidationErrorCopyWithImpl<_ApiValidationError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiValidationErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiValidationError&&(identical(other.status, status) || other.status == status)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other._errors, _errors)&&(identical(other.path, path) || other.path == path)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,error,const DeepCollectionEquality().hash(_errors),path,timestamp);

@override
String toString() {
  return 'ApiValidationError(status: $status, error: $error, errors: $errors, path: $path, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$ApiValidationErrorCopyWith<$Res> implements $ApiValidationErrorCopyWith<$Res> {
  factory _$ApiValidationErrorCopyWith(_ApiValidationError value, $Res Function(_ApiValidationError) _then) = __$ApiValidationErrorCopyWithImpl;
@override @useResult
$Res call({
 int status, String error, List<FieldError> errors, String path, String timestamp
});




}
/// @nodoc
class __$ApiValidationErrorCopyWithImpl<$Res>
    implements _$ApiValidationErrorCopyWith<$Res> {
  __$ApiValidationErrorCopyWithImpl(this._self, this._then);

  final _ApiValidationError _self;
  final $Res Function(_ApiValidationError) _then;

/// Create a copy of ApiValidationError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? error = null,Object? errors = null,Object? path = null,Object? timestamp = null,}) {
  return _then(_ApiValidationError(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,errors: null == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<FieldError>,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
