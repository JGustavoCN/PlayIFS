// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'athlete_summary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AthleteSummaryDTO {

 int get id; String get registration; String get fullName;// Estes campos vêm da API, mas não são necessários no domínio.
 DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of AthleteSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AthleteSummaryDTOCopyWith<AthleteSummaryDTO> get copyWith => _$AthleteSummaryDTOCopyWithImpl<AthleteSummaryDTO>(this as AthleteSummaryDTO, _$identity);

  /// Serializes this AthleteSummaryDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AthleteSummaryDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,registration,fullName,createdAt,updatedAt);

@override
String toString() {
  return 'AthleteSummaryDTO(id: $id, registration: $registration, fullName: $fullName, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AthleteSummaryDTOCopyWith<$Res>  {
  factory $AthleteSummaryDTOCopyWith(AthleteSummaryDTO value, $Res Function(AthleteSummaryDTO) _then) = _$AthleteSummaryDTOCopyWithImpl;
@useResult
$Res call({
 int id, String registration, String fullName, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$AthleteSummaryDTOCopyWithImpl<$Res>
    implements $AthleteSummaryDTOCopyWith<$Res> {
  _$AthleteSummaryDTOCopyWithImpl(this._self, this._then);

  final AthleteSummaryDTO _self;
  final $Res Function(AthleteSummaryDTO) _then;

/// Create a copy of AthleteSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? registration = null,Object? fullName = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AthleteSummaryDTO].
extension AthleteSummaryDTOPatterns on AthleteSummaryDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AthleteSummaryDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AthleteSummaryDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AthleteSummaryDTO value)  $default,){
final _that = this;
switch (_that) {
case _AthleteSummaryDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AthleteSummaryDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AthleteSummaryDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String registration,  String fullName,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AthleteSummaryDTO() when $default != null:
return $default(_that.id,_that.registration,_that.fullName,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String registration,  String fullName,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AthleteSummaryDTO():
return $default(_that.id,_that.registration,_that.fullName,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String registration,  String fullName,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AthleteSummaryDTO() when $default != null:
return $default(_that.id,_that.registration,_that.fullName,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AthleteSummaryDTO implements AthleteSummaryDTO {
  const _AthleteSummaryDTO({required this.id, required this.registration, required this.fullName, this.createdAt, this.updatedAt});
  factory _AthleteSummaryDTO.fromJson(Map<String, dynamic> json) => _$AthleteSummaryDTOFromJson(json);

@override final  int id;
@override final  String registration;
@override final  String fullName;
// Estes campos vêm da API, mas não são necessários no domínio.
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of AthleteSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AthleteSummaryDTOCopyWith<_AthleteSummaryDTO> get copyWith => __$AthleteSummaryDTOCopyWithImpl<_AthleteSummaryDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AthleteSummaryDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AthleteSummaryDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,registration,fullName,createdAt,updatedAt);

@override
String toString() {
  return 'AthleteSummaryDTO(id: $id, registration: $registration, fullName: $fullName, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AthleteSummaryDTOCopyWith<$Res> implements $AthleteSummaryDTOCopyWith<$Res> {
  factory _$AthleteSummaryDTOCopyWith(_AthleteSummaryDTO value, $Res Function(_AthleteSummaryDTO) _then) = __$AthleteSummaryDTOCopyWithImpl;
@override @useResult
$Res call({
 int id, String registration, String fullName, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$AthleteSummaryDTOCopyWithImpl<$Res>
    implements _$AthleteSummaryDTOCopyWith<$Res> {
  __$AthleteSummaryDTOCopyWithImpl(this._self, this._then);

  final _AthleteSummaryDTO _self;
  final $Res Function(_AthleteSummaryDTO) _then;

/// Create a copy of AthleteSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? registration = null,Object? fullName = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_AthleteSummaryDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
