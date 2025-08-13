// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginRequestDTO {

 String get registration; String get password;
/// Create a copy of LoginRequestDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginRequestDTOCopyWith<LoginRequestDTO> get copyWith => _$LoginRequestDTOCopyWithImpl<LoginRequestDTO>(this as LoginRequestDTO, _$identity);

  /// Serializes this LoginRequestDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRequestDTO&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,registration,password);

@override
String toString() {
  return 'LoginRequestDTO(registration: $registration, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginRequestDTOCopyWith<$Res>  {
  factory $LoginRequestDTOCopyWith(LoginRequestDTO value, $Res Function(LoginRequestDTO) _then) = _$LoginRequestDTOCopyWithImpl;
@useResult
$Res call({
 String registration, String password
});




}
/// @nodoc
class _$LoginRequestDTOCopyWithImpl<$Res>
    implements $LoginRequestDTOCopyWith<$Res> {
  _$LoginRequestDTOCopyWithImpl(this._self, this._then);

  final LoginRequestDTO _self;
  final $Res Function(LoginRequestDTO) _then;

/// Create a copy of LoginRequestDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? registration = null,Object? password = null,}) {
  return _then(_self.copyWith(
registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginRequestDTO].
extension LoginRequestDTOPatterns on LoginRequestDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginRequestDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginRequestDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginRequestDTO value)  $default,){
final _that = this;
switch (_that) {
case _LoginRequestDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginRequestDTO value)?  $default,){
final _that = this;
switch (_that) {
case _LoginRequestDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String registration,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginRequestDTO() when $default != null:
return $default(_that.registration,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String registration,  String password)  $default,) {final _that = this;
switch (_that) {
case _LoginRequestDTO():
return $default(_that.registration,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String registration,  String password)?  $default,) {final _that = this;
switch (_that) {
case _LoginRequestDTO() when $default != null:
return $default(_that.registration,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginRequestDTO implements LoginRequestDTO {
  const _LoginRequestDTO({required this.registration, required this.password});
  factory _LoginRequestDTO.fromJson(Map<String, dynamic> json) => _$LoginRequestDTOFromJson(json);

@override final  String registration;
@override final  String password;

/// Create a copy of LoginRequestDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginRequestDTOCopyWith<_LoginRequestDTO> get copyWith => __$LoginRequestDTOCopyWithImpl<_LoginRequestDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginRequestDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginRequestDTO&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,registration,password);

@override
String toString() {
  return 'LoginRequestDTO(registration: $registration, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginRequestDTOCopyWith<$Res> implements $LoginRequestDTOCopyWith<$Res> {
  factory _$LoginRequestDTOCopyWith(_LoginRequestDTO value, $Res Function(_LoginRequestDTO) _then) = __$LoginRequestDTOCopyWithImpl;
@override @useResult
$Res call({
 String registration, String password
});




}
/// @nodoc
class __$LoginRequestDTOCopyWithImpl<$Res>
    implements _$LoginRequestDTOCopyWith<$Res> {
  __$LoginRequestDTOCopyWithImpl(this._self, this._then);

  final _LoginRequestDTO _self;
  final $Res Function(_LoginRequestDTO) _then;

/// Create a copy of LoginRequestDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? registration = null,Object? password = null,}) {
  return _then(_LoginRequestDTO(
registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
