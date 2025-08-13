// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileDTO {

 int get userId; String get registration; List<String> get roles; AthleteDetailsDTO? get athleteProfile; CoordinatorDetailsDTO? get coordinatorProfile;// ADICIONE ESTE CAMPO
 List<LinkDTO>? get links;
/// Create a copy of ProfileDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDTOCopyWith<ProfileDTO> get copyWith => _$ProfileDTOCopyWithImpl<ProfileDTO>(this as ProfileDTO, _$identity);

  /// Serializes this ProfileDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileDTO&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.registration, registration) || other.registration == registration)&&const DeepCollectionEquality().equals(other.roles, roles)&&(identical(other.athleteProfile, athleteProfile) || other.athleteProfile == athleteProfile)&&(identical(other.coordinatorProfile, coordinatorProfile) || other.coordinatorProfile == coordinatorProfile)&&const DeepCollectionEquality().equals(other.links, links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,registration,const DeepCollectionEquality().hash(roles),athleteProfile,coordinatorProfile,const DeepCollectionEquality().hash(links));

@override
String toString() {
  return 'ProfileDTO(userId: $userId, registration: $registration, roles: $roles, athleteProfile: $athleteProfile, coordinatorProfile: $coordinatorProfile, links: $links)';
}


}

/// @nodoc
abstract mixin class $ProfileDTOCopyWith<$Res>  {
  factory $ProfileDTOCopyWith(ProfileDTO value, $Res Function(ProfileDTO) _then) = _$ProfileDTOCopyWithImpl;
@useResult
$Res call({
 int userId, String registration, List<String> roles, AthleteDetailsDTO? athleteProfile, CoordinatorDetailsDTO? coordinatorProfile, List<LinkDTO>? links
});


$AthleteDetailsDTOCopyWith<$Res>? get athleteProfile;$CoordinatorDetailsDTOCopyWith<$Res>? get coordinatorProfile;

}
/// @nodoc
class _$ProfileDTOCopyWithImpl<$Res>
    implements $ProfileDTOCopyWith<$Res> {
  _$ProfileDTOCopyWithImpl(this._self, this._then);

  final ProfileDTO _self;
  final $Res Function(ProfileDTO) _then;

/// Create a copy of ProfileDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? registration = null,Object? roles = null,Object? athleteProfile = freezed,Object? coordinatorProfile = freezed,Object? links = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,athleteProfile: freezed == athleteProfile ? _self.athleteProfile : athleteProfile // ignore: cast_nullable_to_non_nullable
as AthleteDetailsDTO?,coordinatorProfile: freezed == coordinatorProfile ? _self.coordinatorProfile : coordinatorProfile // ignore: cast_nullable_to_non_nullable
as CoordinatorDetailsDTO?,links: freezed == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<LinkDTO>?,
  ));
}
/// Create a copy of ProfileDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteDetailsDTOCopyWith<$Res>? get athleteProfile {
    if (_self.athleteProfile == null) {
    return null;
  }

  return $AthleteDetailsDTOCopyWith<$Res>(_self.athleteProfile!, (value) {
    return _then(_self.copyWith(athleteProfile: value));
  });
}/// Create a copy of ProfileDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordinatorDetailsDTOCopyWith<$Res>? get coordinatorProfile {
    if (_self.coordinatorProfile == null) {
    return null;
  }

  return $CoordinatorDetailsDTOCopyWith<$Res>(_self.coordinatorProfile!, (value) {
    return _then(_self.copyWith(coordinatorProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileDTO].
extension ProfileDTOPatterns on ProfileDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileDTO value)  $default,){
final _that = this;
switch (_that) {
case _ProfileDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileDTO value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userId,  String registration,  List<String> roles,  AthleteDetailsDTO? athleteProfile,  CoordinatorDetailsDTO? coordinatorProfile,  List<LinkDTO>? links)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileDTO() when $default != null:
return $default(_that.userId,_that.registration,_that.roles,_that.athleteProfile,_that.coordinatorProfile,_that.links);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userId,  String registration,  List<String> roles,  AthleteDetailsDTO? athleteProfile,  CoordinatorDetailsDTO? coordinatorProfile,  List<LinkDTO>? links)  $default,) {final _that = this;
switch (_that) {
case _ProfileDTO():
return $default(_that.userId,_that.registration,_that.roles,_that.athleteProfile,_that.coordinatorProfile,_that.links);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userId,  String registration,  List<String> roles,  AthleteDetailsDTO? athleteProfile,  CoordinatorDetailsDTO? coordinatorProfile,  List<LinkDTO>? links)?  $default,) {final _that = this;
switch (_that) {
case _ProfileDTO() when $default != null:
return $default(_that.userId,_that.registration,_that.roles,_that.athleteProfile,_that.coordinatorProfile,_that.links);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileDTO implements ProfileDTO {
  const _ProfileDTO({required this.userId, required this.registration, required final  List<String> roles, this.athleteProfile, this.coordinatorProfile, final  List<LinkDTO>? links}): _roles = roles,_links = links;
  factory _ProfileDTO.fromJson(Map<String, dynamic> json) => _$ProfileDTOFromJson(json);

@override final  int userId;
@override final  String registration;
 final  List<String> _roles;
@override List<String> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

@override final  AthleteDetailsDTO? athleteProfile;
@override final  CoordinatorDetailsDTO? coordinatorProfile;
// ADICIONE ESTE CAMPO
 final  List<LinkDTO>? _links;
// ADICIONE ESTE CAMPO
@override List<LinkDTO>? get links {
  final value = _links;
  if (value == null) return null;
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProfileDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileDTOCopyWith<_ProfileDTO> get copyWith => __$ProfileDTOCopyWithImpl<_ProfileDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileDTO&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.registration, registration) || other.registration == registration)&&const DeepCollectionEquality().equals(other._roles, _roles)&&(identical(other.athleteProfile, athleteProfile) || other.athleteProfile == athleteProfile)&&(identical(other.coordinatorProfile, coordinatorProfile) || other.coordinatorProfile == coordinatorProfile)&&const DeepCollectionEquality().equals(other._links, _links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,registration,const DeepCollectionEquality().hash(_roles),athleteProfile,coordinatorProfile,const DeepCollectionEquality().hash(_links));

@override
String toString() {
  return 'ProfileDTO(userId: $userId, registration: $registration, roles: $roles, athleteProfile: $athleteProfile, coordinatorProfile: $coordinatorProfile, links: $links)';
}


}

/// @nodoc
abstract mixin class _$ProfileDTOCopyWith<$Res> implements $ProfileDTOCopyWith<$Res> {
  factory _$ProfileDTOCopyWith(_ProfileDTO value, $Res Function(_ProfileDTO) _then) = __$ProfileDTOCopyWithImpl;
@override @useResult
$Res call({
 int userId, String registration, List<String> roles, AthleteDetailsDTO? athleteProfile, CoordinatorDetailsDTO? coordinatorProfile, List<LinkDTO>? links
});


@override $AthleteDetailsDTOCopyWith<$Res>? get athleteProfile;@override $CoordinatorDetailsDTOCopyWith<$Res>? get coordinatorProfile;

}
/// @nodoc
class __$ProfileDTOCopyWithImpl<$Res>
    implements _$ProfileDTOCopyWith<$Res> {
  __$ProfileDTOCopyWithImpl(this._self, this._then);

  final _ProfileDTO _self;
  final $Res Function(_ProfileDTO) _then;

/// Create a copy of ProfileDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? registration = null,Object? roles = null,Object? athleteProfile = freezed,Object? coordinatorProfile = freezed,Object? links = freezed,}) {
  return _then(_ProfileDTO(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,athleteProfile: freezed == athleteProfile ? _self.athleteProfile : athleteProfile // ignore: cast_nullable_to_non_nullable
as AthleteDetailsDTO?,coordinatorProfile: freezed == coordinatorProfile ? _self.coordinatorProfile : coordinatorProfile // ignore: cast_nullable_to_non_nullable
as CoordinatorDetailsDTO?,links: freezed == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<LinkDTO>?,
  ));
}

/// Create a copy of ProfileDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteDetailsDTOCopyWith<$Res>? get athleteProfile {
    if (_self.athleteProfile == null) {
    return null;
  }

  return $AthleteDetailsDTOCopyWith<$Res>(_self.athleteProfile!, (value) {
    return _then(_self.copyWith(athleteProfile: value));
  });
}/// Create a copy of ProfileDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordinatorDetailsDTOCopyWith<$Res>? get coordinatorProfile {
    if (_self.coordinatorProfile == null) {
    return null;
  }

  return $CoordinatorDetailsDTOCopyWith<$Res>(_self.coordinatorProfile!, (value) {
    return _then(_self.copyWith(coordinatorProfile: value));
  });
}
}

// dart format on
