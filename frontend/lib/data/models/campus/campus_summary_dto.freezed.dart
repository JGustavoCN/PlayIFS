// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campus_summary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CampusSummaryDTO {

 int get id; String get name;
/// Create a copy of CampusSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CampusSummaryDTOCopyWith<CampusSummaryDTO> get copyWith => _$CampusSummaryDTOCopyWithImpl<CampusSummaryDTO>(this as CampusSummaryDTO, _$identity);

  /// Serializes this CampusSummaryDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CampusSummaryDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'CampusSummaryDTO(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $CampusSummaryDTOCopyWith<$Res>  {
  factory $CampusSummaryDTOCopyWith(CampusSummaryDTO value, $Res Function(CampusSummaryDTO) _then) = _$CampusSummaryDTOCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$CampusSummaryDTOCopyWithImpl<$Res>
    implements $CampusSummaryDTOCopyWith<$Res> {
  _$CampusSummaryDTOCopyWithImpl(this._self, this._then);

  final CampusSummaryDTO _self;
  final $Res Function(CampusSummaryDTO) _then;

/// Create a copy of CampusSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CampusSummaryDTO].
extension CampusSummaryDTOPatterns on CampusSummaryDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CampusSummaryDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CampusSummaryDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CampusSummaryDTO value)  $default,){
final _that = this;
switch (_that) {
case _CampusSummaryDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CampusSummaryDTO value)?  $default,){
final _that = this;
switch (_that) {
case _CampusSummaryDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CampusSummaryDTO() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _CampusSummaryDTO():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _CampusSummaryDTO() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CampusSummaryDTO implements CampusSummaryDTO {
  const _CampusSummaryDTO({required this.id, required this.name});
  factory _CampusSummaryDTO.fromJson(Map<String, dynamic> json) => _$CampusSummaryDTOFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of CampusSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CampusSummaryDTOCopyWith<_CampusSummaryDTO> get copyWith => __$CampusSummaryDTOCopyWithImpl<_CampusSummaryDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CampusSummaryDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CampusSummaryDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'CampusSummaryDTO(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$CampusSummaryDTOCopyWith<$Res> implements $CampusSummaryDTOCopyWith<$Res> {
  factory _$CampusSummaryDTOCopyWith(_CampusSummaryDTO value, $Res Function(_CampusSummaryDTO) _then) = __$CampusSummaryDTOCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$CampusSummaryDTOCopyWithImpl<$Res>
    implements _$CampusSummaryDTOCopyWith<$Res> {
  __$CampusSummaryDTOCopyWithImpl(this._self, this._then);

  final _CampusSummaryDTO _self;
  final $Res Function(_CampusSummaryDTO) _then;

/// Create a copy of CampusSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_CampusSummaryDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
