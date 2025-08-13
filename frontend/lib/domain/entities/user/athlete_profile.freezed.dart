// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'athlete_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AthleteProfile {

 int get id; String get registration; String get fullName; String get nickname; String get phone; String get email; bool get isCoach;
/// Create a copy of AthleteProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AthleteProfileCopyWith<AthleteProfile> get copyWith => _$AthleteProfileCopyWithImpl<AthleteProfile>(this as AthleteProfile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AthleteProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.isCoach, isCoach) || other.isCoach == isCoach));
}


@override
int get hashCode => Object.hash(runtimeType,id,registration,fullName,nickname,phone,email,isCoach);

@override
String toString() {
  return 'AthleteProfile(id: $id, registration: $registration, fullName: $fullName, nickname: $nickname, phone: $phone, email: $email, isCoach: $isCoach)';
}


}

/// @nodoc
abstract mixin class $AthleteProfileCopyWith<$Res>  {
  factory $AthleteProfileCopyWith(AthleteProfile value, $Res Function(AthleteProfile) _then) = _$AthleteProfileCopyWithImpl;
@useResult
$Res call({
 int id, String registration, String fullName, String nickname, String phone, String email, bool isCoach
});




}
/// @nodoc
class _$AthleteProfileCopyWithImpl<$Res>
    implements $AthleteProfileCopyWith<$Res> {
  _$AthleteProfileCopyWithImpl(this._self, this._then);

  final AthleteProfile _self;
  final $Res Function(AthleteProfile) _then;

/// Create a copy of AthleteProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? registration = null,Object? fullName = null,Object? nickname = null,Object? phone = null,Object? email = null,Object? isCoach = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isCoach: null == isCoach ? _self.isCoach : isCoach // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AthleteProfile].
extension AthleteProfilePatterns on AthleteProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AthleteProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AthleteProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AthleteProfile value)  $default,){
final _that = this;
switch (_that) {
case _AthleteProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AthleteProfile value)?  $default,){
final _that = this;
switch (_that) {
case _AthleteProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String registration,  String fullName,  String nickname,  String phone,  String email,  bool isCoach)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AthleteProfile() when $default != null:
return $default(_that.id,_that.registration,_that.fullName,_that.nickname,_that.phone,_that.email,_that.isCoach);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String registration,  String fullName,  String nickname,  String phone,  String email,  bool isCoach)  $default,) {final _that = this;
switch (_that) {
case _AthleteProfile():
return $default(_that.id,_that.registration,_that.fullName,_that.nickname,_that.phone,_that.email,_that.isCoach);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String registration,  String fullName,  String nickname,  String phone,  String email,  bool isCoach)?  $default,) {final _that = this;
switch (_that) {
case _AthleteProfile() when $default != null:
return $default(_that.id,_that.registration,_that.fullName,_that.nickname,_that.phone,_that.email,_that.isCoach);case _:
  return null;

}
}

}

/// @nodoc


class _AthleteProfile implements AthleteProfile {
  const _AthleteProfile({required this.id, required this.registration, required this.fullName, required this.nickname, required this.phone, required this.email, required this.isCoach});
  

@override final  int id;
@override final  String registration;
@override final  String fullName;
@override final  String nickname;
@override final  String phone;
@override final  String email;
@override final  bool isCoach;

/// Create a copy of AthleteProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AthleteProfileCopyWith<_AthleteProfile> get copyWith => __$AthleteProfileCopyWithImpl<_AthleteProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AthleteProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.isCoach, isCoach) || other.isCoach == isCoach));
}


@override
int get hashCode => Object.hash(runtimeType,id,registration,fullName,nickname,phone,email,isCoach);

@override
String toString() {
  return 'AthleteProfile(id: $id, registration: $registration, fullName: $fullName, nickname: $nickname, phone: $phone, email: $email, isCoach: $isCoach)';
}


}

/// @nodoc
abstract mixin class _$AthleteProfileCopyWith<$Res> implements $AthleteProfileCopyWith<$Res> {
  factory _$AthleteProfileCopyWith(_AthleteProfile value, $Res Function(_AthleteProfile) _then) = __$AthleteProfileCopyWithImpl;
@override @useResult
$Res call({
 int id, String registration, String fullName, String nickname, String phone, String email, bool isCoach
});




}
/// @nodoc
class __$AthleteProfileCopyWithImpl<$Res>
    implements _$AthleteProfileCopyWith<$Res> {
  __$AthleteProfileCopyWithImpl(this._self, this._then);

  final _AthleteProfile _self;
  final $Res Function(_AthleteProfile) _then;

/// Create a copy of AthleteProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? registration = null,Object? fullName = null,Object? nickname = null,Object? phone = null,Object? email = null,Object? isCoach = null,}) {
  return _then(_AthleteProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isCoach: null == isCoach ? _self.isCoach : isCoach // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
