// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'athlete_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AthleteDetailsDTO {

 int get id; String get registration; String get fullName; String? get nickname; String? get phone; String get email;// CORREÇÃO APLICADA AQUI:
// Usamos @JsonKey(name: '...') para dizer ao gerador que, no JSON,
// este campo se chama 'coach'.
@JsonKey(name: 'coach') bool get isCoach; DateTime? get createdAt; DateTime? get updatedAt; List<LinkDTO>? get links;
/// Create a copy of AthleteDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AthleteDetailsDTOCopyWith<AthleteDetailsDTO> get copyWith => _$AthleteDetailsDTOCopyWithImpl<AthleteDetailsDTO>(this as AthleteDetailsDTO, _$identity);

  /// Serializes this AthleteDetailsDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AthleteDetailsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.isCoach, isCoach) || other.isCoach == isCoach)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.links, links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,registration,fullName,nickname,phone,email,isCoach,createdAt,updatedAt,const DeepCollectionEquality().hash(links));

@override
String toString() {
  return 'AthleteDetailsDTO(id: $id, registration: $registration, fullName: $fullName, nickname: $nickname, phone: $phone, email: $email, isCoach: $isCoach, createdAt: $createdAt, updatedAt: $updatedAt, links: $links)';
}


}

/// @nodoc
abstract mixin class $AthleteDetailsDTOCopyWith<$Res>  {
  factory $AthleteDetailsDTOCopyWith(AthleteDetailsDTO value, $Res Function(AthleteDetailsDTO) _then) = _$AthleteDetailsDTOCopyWithImpl;
@useResult
$Res call({
 int id, String registration, String fullName, String? nickname, String? phone, String email,@JsonKey(name: 'coach') bool isCoach, DateTime? createdAt, DateTime? updatedAt, List<LinkDTO>? links
});




}
/// @nodoc
class _$AthleteDetailsDTOCopyWithImpl<$Res>
    implements $AthleteDetailsDTOCopyWith<$Res> {
  _$AthleteDetailsDTOCopyWithImpl(this._self, this._then);

  final AthleteDetailsDTO _self;
  final $Res Function(AthleteDetailsDTO) _then;

/// Create a copy of AthleteDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? registration = null,Object? fullName = null,Object? nickname = freezed,Object? phone = freezed,Object? email = null,Object? isCoach = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? links = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isCoach: null == isCoach ? _self.isCoach : isCoach // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,links: freezed == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<LinkDTO>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AthleteDetailsDTO].
extension AthleteDetailsDTOPatterns on AthleteDetailsDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AthleteDetailsDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AthleteDetailsDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AthleteDetailsDTO value)  $default,){
final _that = this;
switch (_that) {
case _AthleteDetailsDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AthleteDetailsDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AthleteDetailsDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String registration,  String fullName,  String? nickname,  String? phone,  String email, @JsonKey(name: 'coach')  bool isCoach,  DateTime? createdAt,  DateTime? updatedAt,  List<LinkDTO>? links)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AthleteDetailsDTO() when $default != null:
return $default(_that.id,_that.registration,_that.fullName,_that.nickname,_that.phone,_that.email,_that.isCoach,_that.createdAt,_that.updatedAt,_that.links);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String registration,  String fullName,  String? nickname,  String? phone,  String email, @JsonKey(name: 'coach')  bool isCoach,  DateTime? createdAt,  DateTime? updatedAt,  List<LinkDTO>? links)  $default,) {final _that = this;
switch (_that) {
case _AthleteDetailsDTO():
return $default(_that.id,_that.registration,_that.fullName,_that.nickname,_that.phone,_that.email,_that.isCoach,_that.createdAt,_that.updatedAt,_that.links);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String registration,  String fullName,  String? nickname,  String? phone,  String email, @JsonKey(name: 'coach')  bool isCoach,  DateTime? createdAt,  DateTime? updatedAt,  List<LinkDTO>? links)?  $default,) {final _that = this;
switch (_that) {
case _AthleteDetailsDTO() when $default != null:
return $default(_that.id,_that.registration,_that.fullName,_that.nickname,_that.phone,_that.email,_that.isCoach,_that.createdAt,_that.updatedAt,_that.links);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AthleteDetailsDTO implements AthleteDetailsDTO {
  const _AthleteDetailsDTO({required this.id, required this.registration, required this.fullName, this.nickname, this.phone, required this.email, @JsonKey(name: 'coach') required this.isCoach, this.createdAt, this.updatedAt, final  List<LinkDTO>? links}): _links = links;
  factory _AthleteDetailsDTO.fromJson(Map<String, dynamic> json) => _$AthleteDetailsDTOFromJson(json);

@override final  int id;
@override final  String registration;
@override final  String fullName;
@override final  String? nickname;
@override final  String? phone;
@override final  String email;
// CORREÇÃO APLICADA AQUI:
// Usamos @JsonKey(name: '...') para dizer ao gerador que, no JSON,
// este campo se chama 'coach'.
@override@JsonKey(name: 'coach') final  bool isCoach;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
 final  List<LinkDTO>? _links;
@override List<LinkDTO>? get links {
  final value = _links;
  if (value == null) return null;
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AthleteDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AthleteDetailsDTOCopyWith<_AthleteDetailsDTO> get copyWith => __$AthleteDetailsDTOCopyWithImpl<_AthleteDetailsDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AthleteDetailsDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AthleteDetailsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.isCoach, isCoach) || other.isCoach == isCoach)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._links, _links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,registration,fullName,nickname,phone,email,isCoach,createdAt,updatedAt,const DeepCollectionEquality().hash(_links));

@override
String toString() {
  return 'AthleteDetailsDTO(id: $id, registration: $registration, fullName: $fullName, nickname: $nickname, phone: $phone, email: $email, isCoach: $isCoach, createdAt: $createdAt, updatedAt: $updatedAt, links: $links)';
}


}

/// @nodoc
abstract mixin class _$AthleteDetailsDTOCopyWith<$Res> implements $AthleteDetailsDTOCopyWith<$Res> {
  factory _$AthleteDetailsDTOCopyWith(_AthleteDetailsDTO value, $Res Function(_AthleteDetailsDTO) _then) = __$AthleteDetailsDTOCopyWithImpl;
@override @useResult
$Res call({
 int id, String registration, String fullName, String? nickname, String? phone, String email,@JsonKey(name: 'coach') bool isCoach, DateTime? createdAt, DateTime? updatedAt, List<LinkDTO>? links
});




}
/// @nodoc
class __$AthleteDetailsDTOCopyWithImpl<$Res>
    implements _$AthleteDetailsDTOCopyWith<$Res> {
  __$AthleteDetailsDTOCopyWithImpl(this._self, this._then);

  final _AthleteDetailsDTO _self;
  final $Res Function(_AthleteDetailsDTO) _then;

/// Create a copy of AthleteDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? registration = null,Object? fullName = null,Object? nickname = freezed,Object? phone = freezed,Object? email = null,Object? isCoach = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? links = freezed,}) {
  return _then(_AthleteDetailsDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isCoach: null == isCoach ? _self.isCoach : isCoach // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,links: freezed == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<LinkDTO>?,
  ));
}


}

// dart format on
