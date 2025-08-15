// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'athlete_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AthleteUpdate {

 String get registration; String get fullName; String? get nickname; String? get phone; String get email;
/// Create a copy of AthleteUpdate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AthleteUpdateCopyWith<AthleteUpdate> get copyWith => _$AthleteUpdateCopyWithImpl<AthleteUpdate>(this as AthleteUpdate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AthleteUpdate&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,registration,fullName,nickname,phone,email);

@override
String toString() {
  return 'AthleteUpdate(registration: $registration, fullName: $fullName, nickname: $nickname, phone: $phone, email: $email)';
}


}

/// @nodoc
abstract mixin class $AthleteUpdateCopyWith<$Res>  {
  factory $AthleteUpdateCopyWith(AthleteUpdate value, $Res Function(AthleteUpdate) _then) = _$AthleteUpdateCopyWithImpl;
@useResult
$Res call({
 String registration, String fullName, String? nickname, String? phone, String email
});




}
/// @nodoc
class _$AthleteUpdateCopyWithImpl<$Res>
    implements $AthleteUpdateCopyWith<$Res> {
  _$AthleteUpdateCopyWithImpl(this._self, this._then);

  final AthleteUpdate _self;
  final $Res Function(AthleteUpdate) _then;

/// Create a copy of AthleteUpdate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? registration = null,Object? fullName = null,Object? nickname = freezed,Object? phone = freezed,Object? email = null,}) {
  return _then(_self.copyWith(
registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AthleteUpdate].
extension AthleteUpdatePatterns on AthleteUpdate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AthleteUpdate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AthleteUpdate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AthleteUpdate value)  $default,){
final _that = this;
switch (_that) {
case _AthleteUpdate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AthleteUpdate value)?  $default,){
final _that = this;
switch (_that) {
case _AthleteUpdate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String registration,  String fullName,  String? nickname,  String? phone,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AthleteUpdate() when $default != null:
return $default(_that.registration,_that.fullName,_that.nickname,_that.phone,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String registration,  String fullName,  String? nickname,  String? phone,  String email)  $default,) {final _that = this;
switch (_that) {
case _AthleteUpdate():
return $default(_that.registration,_that.fullName,_that.nickname,_that.phone,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String registration,  String fullName,  String? nickname,  String? phone,  String email)?  $default,) {final _that = this;
switch (_that) {
case _AthleteUpdate() when $default != null:
return $default(_that.registration,_that.fullName,_that.nickname,_that.phone,_that.email);case _:
  return null;

}
}

}

/// @nodoc


class _AthleteUpdate implements AthleteUpdate {
  const _AthleteUpdate({required this.registration, required this.fullName, this.nickname, this.phone, required this.email});
  

@override final  String registration;
@override final  String fullName;
@override final  String? nickname;
@override final  String? phone;
@override final  String email;

/// Create a copy of AthleteUpdate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AthleteUpdateCopyWith<_AthleteUpdate> get copyWith => __$AthleteUpdateCopyWithImpl<_AthleteUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AthleteUpdate&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,registration,fullName,nickname,phone,email);

@override
String toString() {
  return 'AthleteUpdate(registration: $registration, fullName: $fullName, nickname: $nickname, phone: $phone, email: $email)';
}


}

/// @nodoc
abstract mixin class _$AthleteUpdateCopyWith<$Res> implements $AthleteUpdateCopyWith<$Res> {
  factory _$AthleteUpdateCopyWith(_AthleteUpdate value, $Res Function(_AthleteUpdate) _then) = __$AthleteUpdateCopyWithImpl;
@override @useResult
$Res call({
 String registration, String fullName, String? nickname, String? phone, String email
});




}
/// @nodoc
class __$AthleteUpdateCopyWithImpl<$Res>
    implements _$AthleteUpdateCopyWith<$Res> {
  __$AthleteUpdateCopyWithImpl(this._self, this._then);

  final _AthleteUpdate _self;
  final $Res Function(_AthleteUpdate) _then;

/// Create a copy of AthleteUpdate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? registration = null,Object? fullName = null,Object? nickname = freezed,Object? phone = freezed,Object? email = null,}) {
  return _then(_AthleteUpdate(
registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
