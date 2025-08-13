// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginCredentials {

 String get registration; String get password;
/// Create a copy of LoginCredentials
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginCredentialsCopyWith<LoginCredentials> get copyWith => _$LoginCredentialsCopyWithImpl<LoginCredentials>(this as LoginCredentials, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginCredentials&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,registration,password);

@override
String toString() {
  return 'LoginCredentials(registration: $registration, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginCredentialsCopyWith<$Res>  {
  factory $LoginCredentialsCopyWith(LoginCredentials value, $Res Function(LoginCredentials) _then) = _$LoginCredentialsCopyWithImpl;
@useResult
$Res call({
 String registration, String password
});




}
/// @nodoc
class _$LoginCredentialsCopyWithImpl<$Res>
    implements $LoginCredentialsCopyWith<$Res> {
  _$LoginCredentialsCopyWithImpl(this._self, this._then);

  final LoginCredentials _self;
  final $Res Function(LoginCredentials) _then;

/// Create a copy of LoginCredentials
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? registration = null,Object? password = null,}) {
  return _then(_self.copyWith(
registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginCredentials].
extension LoginCredentialsPatterns on LoginCredentials {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginCredentials value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginCredentials() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginCredentials value)  $default,){
final _that = this;
switch (_that) {
case _LoginCredentials():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginCredentials value)?  $default,){
final _that = this;
switch (_that) {
case _LoginCredentials() when $default != null:
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
case _LoginCredentials() when $default != null:
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
case _LoginCredentials():
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
case _LoginCredentials() when $default != null:
return $default(_that.registration,_that.password);case _:
  return null;

}
}

}

/// @nodoc


class _LoginCredentials implements LoginCredentials {
  const _LoginCredentials({required this.registration, required this.password});
  

@override final  String registration;
@override final  String password;

/// Create a copy of LoginCredentials
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginCredentialsCopyWith<_LoginCredentials> get copyWith => __$LoginCredentialsCopyWithImpl<_LoginCredentials>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginCredentials&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,registration,password);

@override
String toString() {
  return 'LoginCredentials(registration: $registration, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginCredentialsCopyWith<$Res> implements $LoginCredentialsCopyWith<$Res> {
  factory _$LoginCredentialsCopyWith(_LoginCredentials value, $Res Function(_LoginCredentials) _then) = __$LoginCredentialsCopyWithImpl;
@override @useResult
$Res call({
 String registration, String password
});




}
/// @nodoc
class __$LoginCredentialsCopyWithImpl<$Res>
    implements _$LoginCredentialsCopyWith<$Res> {
  __$LoginCredentialsCopyWithImpl(this._self, this._then);

  final _LoginCredentials _self;
  final $Res Function(_LoginCredentials) _then;

/// Create a copy of LoginCredentials
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? registration = null,Object? password = null,}) {
  return _then(_LoginCredentials(
registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
