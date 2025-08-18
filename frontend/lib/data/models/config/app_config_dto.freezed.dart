// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppConfigDTO {

 Map<String, List<EnumValueDTO>> get enums;
/// Create a copy of AppConfigDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigDTOCopyWith<AppConfigDTO> get copyWith => _$AppConfigDTOCopyWithImpl<AppConfigDTO>(this as AppConfigDTO, _$identity);

  /// Serializes this AppConfigDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfigDTO&&const DeepCollectionEquality().equals(other.enums, enums));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(enums));

@override
String toString() {
  return 'AppConfigDTO(enums: $enums)';
}


}

/// @nodoc
abstract mixin class $AppConfigDTOCopyWith<$Res>  {
  factory $AppConfigDTOCopyWith(AppConfigDTO value, $Res Function(AppConfigDTO) _then) = _$AppConfigDTOCopyWithImpl;
@useResult
$Res call({
 Map<String, List<EnumValueDTO>> enums
});




}
/// @nodoc
class _$AppConfigDTOCopyWithImpl<$Res>
    implements $AppConfigDTOCopyWith<$Res> {
  _$AppConfigDTOCopyWithImpl(this._self, this._then);

  final AppConfigDTO _self;
  final $Res Function(AppConfigDTO) _then;

/// Create a copy of AppConfigDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enums = null,}) {
  return _then(_self.copyWith(
enums: null == enums ? _self.enums : enums // ignore: cast_nullable_to_non_nullable
as Map<String, List<EnumValueDTO>>,
  ));
}

}


/// Adds pattern-matching-related methods to [AppConfigDTO].
extension AppConfigDTOPatterns on AppConfigDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppConfigDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppConfigDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppConfigDTO value)  $default,){
final _that = this;
switch (_that) {
case _AppConfigDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppConfigDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AppConfigDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, List<EnumValueDTO>> enums)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfigDTO() when $default != null:
return $default(_that.enums);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, List<EnumValueDTO>> enums)  $default,) {final _that = this;
switch (_that) {
case _AppConfigDTO():
return $default(_that.enums);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, List<EnumValueDTO>> enums)?  $default,) {final _that = this;
switch (_that) {
case _AppConfigDTO() when $default != null:
return $default(_that.enums);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppConfigDTO implements AppConfigDTO {
  const _AppConfigDTO({required final  Map<String, List<EnumValueDTO>> enums}): _enums = enums;
  factory _AppConfigDTO.fromJson(Map<String, dynamic> json) => _$AppConfigDTOFromJson(json);

 final  Map<String, List<EnumValueDTO>> _enums;
@override Map<String, List<EnumValueDTO>> get enums {
  if (_enums is EqualUnmodifiableMapView) return _enums;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_enums);
}


/// Create a copy of AppConfigDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigDTOCopyWith<_AppConfigDTO> get copyWith => __$AppConfigDTOCopyWithImpl<_AppConfigDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppConfigDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfigDTO&&const DeepCollectionEquality().equals(other._enums, _enums));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_enums));

@override
String toString() {
  return 'AppConfigDTO(enums: $enums)';
}


}

/// @nodoc
abstract mixin class _$AppConfigDTOCopyWith<$Res> implements $AppConfigDTOCopyWith<$Res> {
  factory _$AppConfigDTOCopyWith(_AppConfigDTO value, $Res Function(_AppConfigDTO) _then) = __$AppConfigDTOCopyWithImpl;
@override @useResult
$Res call({
 Map<String, List<EnumValueDTO>> enums
});




}
/// @nodoc
class __$AppConfigDTOCopyWithImpl<$Res>
    implements _$AppConfigDTOCopyWith<$Res> {
  __$AppConfigDTOCopyWithImpl(this._self, this._then);

  final _AppConfigDTO _self;
  final $Res Function(_AppConfigDTO) _then;

/// Create a copy of AppConfigDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enums = null,}) {
  return _then(_AppConfigDTO(
enums: null == enums ? _self._enums : enums // ignore: cast_nullable_to_non_nullable
as Map<String, List<EnumValueDTO>>,
  ));
}


}

// dart format on
