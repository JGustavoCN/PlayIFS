// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'athlete_input_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AthleteInputDTO {

 String get registration; String get fullName; String? get nickname; String? get phone; String get email; String get password;
/// Create a copy of AthleteInputDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AthleteInputDTOCopyWith<AthleteInputDTO> get copyWith => _$AthleteInputDTOCopyWithImpl<AthleteInputDTO>(this as AthleteInputDTO, _$identity);

  /// Serializes this AthleteInputDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AthleteInputDTO&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,registration,fullName,nickname,phone,email,password);

@override
String toString() {
  return 'AthleteInputDTO(registration: $registration, fullName: $fullName, nickname: $nickname, phone: $phone, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $AthleteInputDTOCopyWith<$Res>  {
  factory $AthleteInputDTOCopyWith(AthleteInputDTO value, $Res Function(AthleteInputDTO) _then) = _$AthleteInputDTOCopyWithImpl;
@useResult
$Res call({
 String registration, String fullName, String? nickname, String? phone, String email, String password
});




}
/// @nodoc
class _$AthleteInputDTOCopyWithImpl<$Res>
    implements $AthleteInputDTOCopyWith<$Res> {
  _$AthleteInputDTOCopyWithImpl(this._self, this._then);

  final AthleteInputDTO _self;
  final $Res Function(AthleteInputDTO) _then;

/// Create a copy of AthleteInputDTO
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


/// Adds pattern-matching-related methods to [AthleteInputDTO].
extension AthleteInputDTOPatterns on AthleteInputDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AthleteInputDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AthleteInputDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AthleteInputDTO value)  $default,){
final _that = this;
switch (_that) {
case _AthleteInputDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AthleteInputDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AthleteInputDTO() when $default != null:
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
case _AthleteInputDTO() when $default != null:
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
case _AthleteInputDTO():
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
case _AthleteInputDTO() when $default != null:
return $default(_that.registration,_that.fullName,_that.nickname,_that.phone,_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AthleteInputDTO implements AthleteInputDTO {
  const _AthleteInputDTO({required this.registration, required this.fullName, this.nickname, this.phone, required this.email, required this.password});
  factory _AthleteInputDTO.fromJson(Map<String, dynamic> json) => _$AthleteInputDTOFromJson(json);

@override final  String registration;
@override final  String fullName;
@override final  String? nickname;
@override final  String? phone;
@override final  String email;
@override final  String password;

/// Create a copy of AthleteInputDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AthleteInputDTOCopyWith<_AthleteInputDTO> get copyWith => __$AthleteInputDTOCopyWithImpl<_AthleteInputDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AthleteInputDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AthleteInputDTO&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,registration,fullName,nickname,phone,email,password);

@override
String toString() {
  return 'AthleteInputDTO(registration: $registration, fullName: $fullName, nickname: $nickname, phone: $phone, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$AthleteInputDTOCopyWith<$Res> implements $AthleteInputDTOCopyWith<$Res> {
  factory _$AthleteInputDTOCopyWith(_AthleteInputDTO value, $Res Function(_AthleteInputDTO) _then) = __$AthleteInputDTOCopyWithImpl;
@override @useResult
$Res call({
 String registration, String fullName, String? nickname, String? phone, String email, String password
});




}
/// @nodoc
class __$AthleteInputDTOCopyWithImpl<$Res>
    implements _$AthleteInputDTOCopyWith<$Res> {
  __$AthleteInputDTOCopyWithImpl(this._self, this._then);

  final _AthleteInputDTO _self;
  final $Res Function(_AthleteInputDTO) _then;

/// Create a copy of AthleteInputDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? registration = null,Object? fullName = null,Object? nickname = freezed,Object? phone = freezed,Object? email = null,Object? password = null,}) {
  return _then(_AthleteInputDTO(
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
