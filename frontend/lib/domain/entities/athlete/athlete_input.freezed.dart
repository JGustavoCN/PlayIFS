// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'athlete_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AthleteInput {

 String get registration; String get fullName; String? get nickname; String? get phone; String get email; String get password;
/// Create a copy of AthleteInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AthleteInputCopyWith<AthleteInput> get copyWith => _$AthleteInputCopyWithImpl<AthleteInput>(this as AthleteInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AthleteInput&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,registration,fullName,nickname,phone,email,password);

@override
String toString() {
  return 'AthleteInput(registration: $registration, fullName: $fullName, nickname: $nickname, phone: $phone, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $AthleteInputCopyWith<$Res>  {
  factory $AthleteInputCopyWith(AthleteInput value, $Res Function(AthleteInput) _then) = _$AthleteInputCopyWithImpl;
@useResult
$Res call({
 String registration, String fullName, String? nickname, String? phone, String email, String password
});




}
/// @nodoc
class _$AthleteInputCopyWithImpl<$Res>
    implements $AthleteInputCopyWith<$Res> {
  _$AthleteInputCopyWithImpl(this._self, this._then);

  final AthleteInput _self;
  final $Res Function(AthleteInput) _then;

/// Create a copy of AthleteInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? registration = null,Object? fullName = null,Object? nickname = freezed,Object? phone = freezed,Object? email = null,Object? password = null,}) {
  return _then(_self.copyWith(
registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AthleteInput].
extension AthleteInputPatterns on AthleteInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AthleteInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AthleteInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AthleteInput value)  $default,){
final _that = this;
switch (_that) {
case _AthleteInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AthleteInput value)?  $default,){
final _that = this;
switch (_that) {
case _AthleteInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String registration,  String fullName,  String? nickname,  String? phone,  String email,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AthleteInput() when $default != null:
return $default(_that.registration,_that.fullName,_that.nickname,_that.phone,_that.email,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String registration,  String fullName,  String? nickname,  String? phone,  String email,  String password)  $default,) {final _that = this;
switch (_that) {
case _AthleteInput():
return $default(_that.registration,_that.fullName,_that.nickname,_that.phone,_that.email,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String registration,  String fullName,  String? nickname,  String? phone,  String email,  String password)?  $default,) {final _that = this;
switch (_that) {
case _AthleteInput() when $default != null:
return $default(_that.registration,_that.fullName,_that.nickname,_that.phone,_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc


class _AthleteInput implements AthleteInput {
  const _AthleteInput({required this.registration, required this.fullName, this.nickname, this.phone, required this.email, required this.password});
  

@override final  String registration;
@override final  String fullName;
@override final  String? nickname;
@override final  String? phone;
@override final  String email;
@override final  String password;

/// Create a copy of AthleteInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AthleteInputCopyWith<_AthleteInput> get copyWith => __$AthleteInputCopyWithImpl<_AthleteInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AthleteInput&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,registration,fullName,nickname,phone,email,password);

@override
String toString() {
  return 'AthleteInput(registration: $registration, fullName: $fullName, nickname: $nickname, phone: $phone, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$AthleteInputCopyWith<$Res> implements $AthleteInputCopyWith<$Res> {
  factory _$AthleteInputCopyWith(_AthleteInput value, $Res Function(_AthleteInput) _then) = __$AthleteInputCopyWithImpl;
@override @useResult
$Res call({
 String registration, String fullName, String? nickname, String? phone, String email, String password
});




}
/// @nodoc
class __$AthleteInputCopyWithImpl<$Res>
    implements _$AthleteInputCopyWith<$Res> {
  __$AthleteInputCopyWithImpl(this._self, this._then);

  final _AthleteInput _self;
  final $Res Function(_AthleteInput) _then;

/// Create a copy of AthleteInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? registration = null,Object? fullName = null,Object? nickname = freezed,Object? phone = freezed,Object? email = null,Object? password = null,}) {
  return _then(_AthleteInput(
registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
