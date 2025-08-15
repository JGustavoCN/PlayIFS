// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Profile {

 int get userId; String get registration; List<String> get roles; AthleteDetails? get athleteDetails; CoordinatorProfile? get coordinatorProfile;
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileCopyWith<Profile> get copyWith => _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Profile&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.registration, registration) || other.registration == registration)&&const DeepCollectionEquality().equals(other.roles, roles)&&(identical(other.athleteDetails, athleteDetails) || other.athleteDetails == athleteDetails)&&(identical(other.coordinatorProfile, coordinatorProfile) || other.coordinatorProfile == coordinatorProfile));
}


@override
int get hashCode => Object.hash(runtimeType,userId,registration,const DeepCollectionEquality().hash(roles),athleteDetails,coordinatorProfile);

@override
String toString() {
  return 'Profile(userId: $userId, registration: $registration, roles: $roles, athleteDetails: $athleteDetails, coordinatorProfile: $coordinatorProfile)';
}


}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res>  {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) = _$ProfileCopyWithImpl;
@useResult
$Res call({
 int userId, String registration, List<String> roles, AthleteDetails? athleteDetails, CoordinatorProfile? coordinatorProfile
});


$AthleteDetailsCopyWith<$Res>? get athleteDetails;$CoordinatorProfileCopyWith<$Res>? get coordinatorProfile;

}
/// @nodoc
class _$ProfileCopyWithImpl<$Res>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? registration = null,Object? roles = null,Object? athleteDetails = freezed,Object? coordinatorProfile = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,athleteDetails: freezed == athleteDetails ? _self.athleteDetails : athleteDetails // ignore: cast_nullable_to_non_nullable
as AthleteDetails?,coordinatorProfile: freezed == coordinatorProfile ? _self.coordinatorProfile : coordinatorProfile // ignore: cast_nullable_to_non_nullable
as CoordinatorProfile?,
  ));
}
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteDetailsCopyWith<$Res>? get athleteDetails {
    if (_self.athleteDetails == null) {
    return null;
  }

  return $AthleteDetailsCopyWith<$Res>(_self.athleteDetails!, (value) {
    return _then(_self.copyWith(athleteDetails: value));
  });
}/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordinatorProfileCopyWith<$Res>? get coordinatorProfile {
    if (_self.coordinatorProfile == null) {
    return null;
  }

  return $CoordinatorProfileCopyWith<$Res>(_self.coordinatorProfile!, (value) {
    return _then(_self.copyWith(coordinatorProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [Profile].
extension ProfilePatterns on Profile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Profile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Profile value)  $default,){
final _that = this;
switch (_that) {
case _Profile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Profile value)?  $default,){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userId,  String registration,  List<String> roles,  AthleteDetails? athleteDetails,  CoordinatorProfile? coordinatorProfile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.userId,_that.registration,_that.roles,_that.athleteDetails,_that.coordinatorProfile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userId,  String registration,  List<String> roles,  AthleteDetails? athleteDetails,  CoordinatorProfile? coordinatorProfile)  $default,) {final _that = this;
switch (_that) {
case _Profile():
return $default(_that.userId,_that.registration,_that.roles,_that.athleteDetails,_that.coordinatorProfile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userId,  String registration,  List<String> roles,  AthleteDetails? athleteDetails,  CoordinatorProfile? coordinatorProfile)?  $default,) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.userId,_that.registration,_that.roles,_that.athleteDetails,_that.coordinatorProfile);case _:
  return null;

}
}

}

/// @nodoc


class _Profile implements Profile {
  const _Profile({required this.userId, required this.registration, required final  List<String> roles, this.athleteDetails, this.coordinatorProfile}): _roles = roles;
  

@override final  int userId;
@override final  String registration;
 final  List<String> _roles;
@override List<String> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

@override final  AthleteDetails? athleteDetails;
@override final  CoordinatorProfile? coordinatorProfile;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileCopyWith<_Profile> get copyWith => __$ProfileCopyWithImpl<_Profile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Profile&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.registration, registration) || other.registration == registration)&&const DeepCollectionEquality().equals(other._roles, _roles)&&(identical(other.athleteDetails, athleteDetails) || other.athleteDetails == athleteDetails)&&(identical(other.coordinatorProfile, coordinatorProfile) || other.coordinatorProfile == coordinatorProfile));
}


@override
int get hashCode => Object.hash(runtimeType,userId,registration,const DeepCollectionEquality().hash(_roles),athleteDetails,coordinatorProfile);

@override
String toString() {
  return 'Profile(userId: $userId, registration: $registration, roles: $roles, athleteDetails: $athleteDetails, coordinatorProfile: $coordinatorProfile)';
}


}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) = __$ProfileCopyWithImpl;
@override @useResult
$Res call({
 int userId, String registration, List<String> roles, AthleteDetails? athleteDetails, CoordinatorProfile? coordinatorProfile
});


@override $AthleteDetailsCopyWith<$Res>? get athleteDetails;@override $CoordinatorProfileCopyWith<$Res>? get coordinatorProfile;

}
/// @nodoc
class __$ProfileCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? registration = null,Object? roles = null,Object? athleteDetails = freezed,Object? coordinatorProfile = freezed,}) {
  return _then(_Profile(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,athleteDetails: freezed == athleteDetails ? _self.athleteDetails : athleteDetails // ignore: cast_nullable_to_non_nullable
as AthleteDetails?,coordinatorProfile: freezed == coordinatorProfile ? _self.coordinatorProfile : coordinatorProfile // ignore: cast_nullable_to_non_nullable
as CoordinatorProfile?,
  ));
}

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteDetailsCopyWith<$Res>? get athleteDetails {
    if (_self.athleteDetails == null) {
    return null;
  }

  return $AthleteDetailsCopyWith<$Res>(_self.athleteDetails!, (value) {
    return _then(_self.copyWith(athleteDetails: value));
  });
}/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordinatorProfileCopyWith<$Res>? get coordinatorProfile {
    if (_self.coordinatorProfile == null) {
    return null;
  }

  return $CoordinatorProfileCopyWith<$Res>(_self.coordinatorProfile!, (value) {
    return _then(_self.copyWith(coordinatorProfile: value));
  });
}
}

// dart format on
