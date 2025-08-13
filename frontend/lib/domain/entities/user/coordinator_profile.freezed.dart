// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coordinator_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoordinatorProfile {

 int get id; String get registration; String get name; String get email;
/// Create a copy of CoordinatorProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoordinatorProfileCopyWith<CoordinatorProfile> get copyWith => _$CoordinatorProfileCopyWithImpl<CoordinatorProfile>(this as CoordinatorProfile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoordinatorProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,id,registration,name,email);

@override
String toString() {
  return 'CoordinatorProfile(id: $id, registration: $registration, name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class $CoordinatorProfileCopyWith<$Res>  {
  factory $CoordinatorProfileCopyWith(CoordinatorProfile value, $Res Function(CoordinatorProfile) _then) = _$CoordinatorProfileCopyWithImpl;
@useResult
$Res call({
 int id, String registration, String name, String email
});




}
/// @nodoc
class _$CoordinatorProfileCopyWithImpl<$Res>
    implements $CoordinatorProfileCopyWith<$Res> {
  _$CoordinatorProfileCopyWithImpl(this._self, this._then);

  final CoordinatorProfile _self;
  final $Res Function(CoordinatorProfile) _then;

/// Create a copy of CoordinatorProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? registration = null,Object? name = null,Object? email = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CoordinatorProfile].
extension CoordinatorProfilePatterns on CoordinatorProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoordinatorProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoordinatorProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoordinatorProfile value)  $default,){
final _that = this;
switch (_that) {
case _CoordinatorProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoordinatorProfile value)?  $default,){
final _that = this;
switch (_that) {
case _CoordinatorProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String registration,  String name,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoordinatorProfile() when $default != null:
return $default(_that.id,_that.registration,_that.name,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String registration,  String name,  String email)  $default,) {final _that = this;
switch (_that) {
case _CoordinatorProfile():
return $default(_that.id,_that.registration,_that.name,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String registration,  String name,  String email)?  $default,) {final _that = this;
switch (_that) {
case _CoordinatorProfile() when $default != null:
return $default(_that.id,_that.registration,_that.name,_that.email);case _:
  return null;

}
}

}

/// @nodoc


class _CoordinatorProfile implements CoordinatorProfile {
  const _CoordinatorProfile({required this.id, required this.registration, required this.name, required this.email});
  

@override final  int id;
@override final  String registration;
@override final  String name;
@override final  String email;

/// Create a copy of CoordinatorProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoordinatorProfileCopyWith<_CoordinatorProfile> get copyWith => __$CoordinatorProfileCopyWithImpl<_CoordinatorProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoordinatorProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,id,registration,name,email);

@override
String toString() {
  return 'CoordinatorProfile(id: $id, registration: $registration, name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class _$CoordinatorProfileCopyWith<$Res> implements $CoordinatorProfileCopyWith<$Res> {
  factory _$CoordinatorProfileCopyWith(_CoordinatorProfile value, $Res Function(_CoordinatorProfile) _then) = __$CoordinatorProfileCopyWithImpl;
@override @useResult
$Res call({
 int id, String registration, String name, String email
});




}
/// @nodoc
class __$CoordinatorProfileCopyWithImpl<$Res>
    implements _$CoordinatorProfileCopyWith<$Res> {
  __$CoordinatorProfileCopyWithImpl(this._self, this._then);

  final _CoordinatorProfile _self;
  final $Res Function(_CoordinatorProfile) _then;

/// Create a copy of CoordinatorProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? registration = null,Object? name = null,Object? email = null,}) {
  return _then(_CoordinatorProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
