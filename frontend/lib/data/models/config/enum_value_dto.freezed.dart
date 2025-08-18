// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enum_value_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EnumValueDTO {

 String get name; String get value;
/// Create a copy of EnumValueDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnumValueDTOCopyWith<EnumValueDTO> get copyWith => _$EnumValueDTOCopyWithImpl<EnumValueDTO>(this as EnumValueDTO, _$identity);

  /// Serializes this EnumValueDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnumValueDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,value);

@override
String toString() {
  return 'EnumValueDTO(name: $name, value: $value)';
}


}

/// @nodoc
abstract mixin class $EnumValueDTOCopyWith<$Res>  {
  factory $EnumValueDTOCopyWith(EnumValueDTO value, $Res Function(EnumValueDTO) _then) = _$EnumValueDTOCopyWithImpl;
@useResult
$Res call({
 String name, String value
});




}
/// @nodoc
class _$EnumValueDTOCopyWithImpl<$Res>
    implements $EnumValueDTOCopyWith<$Res> {
  _$EnumValueDTOCopyWithImpl(this._self, this._then);

  final EnumValueDTO _self;
  final $Res Function(EnumValueDTO) _then;

/// Create a copy of EnumValueDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? value = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EnumValueDTO].
extension EnumValueDTOPatterns on EnumValueDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EnumValueDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EnumValueDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EnumValueDTO value)  $default,){
final _that = this;
switch (_that) {
case _EnumValueDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EnumValueDTO value)?  $default,){
final _that = this;
switch (_that) {
case _EnumValueDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EnumValueDTO() when $default != null:
return $default(_that.name,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String value)  $default,) {final _that = this;
switch (_that) {
case _EnumValueDTO():
return $default(_that.name,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String value)?  $default,) {final _that = this;
switch (_that) {
case _EnumValueDTO() when $default != null:
return $default(_that.name,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EnumValueDTO implements EnumValueDTO {
  const _EnumValueDTO({required this.name, required this.value});
  factory _EnumValueDTO.fromJson(Map<String, dynamic> json) => _$EnumValueDTOFromJson(json);

@override final  String name;
@override final  String value;

/// Create a copy of EnumValueDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnumValueDTOCopyWith<_EnumValueDTO> get copyWith => __$EnumValueDTOCopyWithImpl<_EnumValueDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EnumValueDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnumValueDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,value);

@override
String toString() {
  return 'EnumValueDTO(name: $name, value: $value)';
}


}

/// @nodoc
abstract mixin class _$EnumValueDTOCopyWith<$Res> implements $EnumValueDTOCopyWith<$Res> {
  factory _$EnumValueDTOCopyWith(_EnumValueDTO value, $Res Function(_EnumValueDTO) _then) = __$EnumValueDTOCopyWithImpl;
@override @useResult
$Res call({
 String name, String value
});




}
/// @nodoc
class __$EnumValueDTOCopyWithImpl<$Res>
    implements _$EnumValueDTOCopyWith<$Res> {
  __$EnumValueDTOCopyWithImpl(this._self, this._then);

  final _EnumValueDTO _self;
  final $Res Function(_EnumValueDTO) _then;

/// Create a copy of EnumValueDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? value = null,}) {
  return _then(_EnumValueDTO(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
