// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coordinator_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoordinatorDetailsDTO {

 int get id; String get registration; String get name; String get email; DateTime? get createdAt; DateTime? get updatedAt;// ADICIONE ESTE CAMPO
 List<LinkDTO>? get links;
/// Create a copy of CoordinatorDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoordinatorDetailsDTOCopyWith<CoordinatorDetailsDTO> get copyWith => _$CoordinatorDetailsDTOCopyWithImpl<CoordinatorDetailsDTO>(this as CoordinatorDetailsDTO, _$identity);

  /// Serializes this CoordinatorDetailsDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoordinatorDetailsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.links, links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,registration,name,email,createdAt,updatedAt,const DeepCollectionEquality().hash(links));

@override
String toString() {
  return 'CoordinatorDetailsDTO(id: $id, registration: $registration, name: $name, email: $email, createdAt: $createdAt, updatedAt: $updatedAt, links: $links)';
}


}

/// @nodoc
abstract mixin class $CoordinatorDetailsDTOCopyWith<$Res>  {
  factory $CoordinatorDetailsDTOCopyWith(CoordinatorDetailsDTO value, $Res Function(CoordinatorDetailsDTO) _then) = _$CoordinatorDetailsDTOCopyWithImpl;
@useResult
$Res call({
 int id, String registration, String name, String email, DateTime? createdAt, DateTime? updatedAt, List<LinkDTO>? links
});




}
/// @nodoc
class _$CoordinatorDetailsDTOCopyWithImpl<$Res>
    implements $CoordinatorDetailsDTOCopyWith<$Res> {
  _$CoordinatorDetailsDTOCopyWithImpl(this._self, this._then);

  final CoordinatorDetailsDTO _self;
  final $Res Function(CoordinatorDetailsDTO) _then;

/// Create a copy of CoordinatorDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? registration = null,Object? name = null,Object? email = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? links = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,links: freezed == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<LinkDTO>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CoordinatorDetailsDTO].
extension CoordinatorDetailsDTOPatterns on CoordinatorDetailsDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoordinatorDetailsDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoordinatorDetailsDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoordinatorDetailsDTO value)  $default,){
final _that = this;
switch (_that) {
case _CoordinatorDetailsDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoordinatorDetailsDTO value)?  $default,){
final _that = this;
switch (_that) {
case _CoordinatorDetailsDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String registration,  String name,  String email,  DateTime? createdAt,  DateTime? updatedAt,  List<LinkDTO>? links)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoordinatorDetailsDTO() when $default != null:
return $default(_that.id,_that.registration,_that.name,_that.email,_that.createdAt,_that.updatedAt,_that.links);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String registration,  String name,  String email,  DateTime? createdAt,  DateTime? updatedAt,  List<LinkDTO>? links)  $default,) {final _that = this;
switch (_that) {
case _CoordinatorDetailsDTO():
return $default(_that.id,_that.registration,_that.name,_that.email,_that.createdAt,_that.updatedAt,_that.links);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String registration,  String name,  String email,  DateTime? createdAt,  DateTime? updatedAt,  List<LinkDTO>? links)?  $default,) {final _that = this;
switch (_that) {
case _CoordinatorDetailsDTO() when $default != null:
return $default(_that.id,_that.registration,_that.name,_that.email,_that.createdAt,_that.updatedAt,_that.links);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoordinatorDetailsDTO implements CoordinatorDetailsDTO {
  const _CoordinatorDetailsDTO({required this.id, required this.registration, required this.name, required this.email, this.createdAt, this.updatedAt, final  List<LinkDTO>? links}): _links = links;
  factory _CoordinatorDetailsDTO.fromJson(Map<String, dynamic> json) => _$CoordinatorDetailsDTOFromJson(json);

@override final  int id;
@override final  String registration;
@override final  String name;
@override final  String email;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
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


/// Create a copy of CoordinatorDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoordinatorDetailsDTOCopyWith<_CoordinatorDetailsDTO> get copyWith => __$CoordinatorDetailsDTOCopyWithImpl<_CoordinatorDetailsDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoordinatorDetailsDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoordinatorDetailsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._links, _links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,registration,name,email,createdAt,updatedAt,const DeepCollectionEquality().hash(_links));

@override
String toString() {
  return 'CoordinatorDetailsDTO(id: $id, registration: $registration, name: $name, email: $email, createdAt: $createdAt, updatedAt: $updatedAt, links: $links)';
}


}

/// @nodoc
abstract mixin class _$CoordinatorDetailsDTOCopyWith<$Res> implements $CoordinatorDetailsDTOCopyWith<$Res> {
  factory _$CoordinatorDetailsDTOCopyWith(_CoordinatorDetailsDTO value, $Res Function(_CoordinatorDetailsDTO) _then) = __$CoordinatorDetailsDTOCopyWithImpl;
@override @useResult
$Res call({
 int id, String registration, String name, String email, DateTime? createdAt, DateTime? updatedAt, List<LinkDTO>? links
});




}
/// @nodoc
class __$CoordinatorDetailsDTOCopyWithImpl<$Res>
    implements _$CoordinatorDetailsDTOCopyWith<$Res> {
  __$CoordinatorDetailsDTOCopyWithImpl(this._self, this._then);

  final _CoordinatorDetailsDTO _self;
  final $Res Function(_CoordinatorDetailsDTO) _then;

/// Create a copy of CoordinatorDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? registration = null,Object? name = null,Object? email = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? links = freezed,}) {
  return _then(_CoordinatorDetailsDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,links: freezed == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<LinkDTO>?,
  ));
}


}

// dart format on
