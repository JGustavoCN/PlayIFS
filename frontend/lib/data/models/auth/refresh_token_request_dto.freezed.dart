// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_token_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RefreshTokenRequestDTO {

 String get refreshToken;
/// Create a copy of RefreshTokenRequestDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshTokenRequestDTOCopyWith<RefreshTokenRequestDTO> get copyWith => _$RefreshTokenRequestDTOCopyWithImpl<RefreshTokenRequestDTO>(this as RefreshTokenRequestDTO, _$identity);

  /// Serializes this RefreshTokenRequestDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshTokenRequestDTO&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refreshToken);

@override
String toString() {
  return 'RefreshTokenRequestDTO(refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $RefreshTokenRequestDTOCopyWith<$Res>  {
  factory $RefreshTokenRequestDTOCopyWith(RefreshTokenRequestDTO value, $Res Function(RefreshTokenRequestDTO) _then) = _$RefreshTokenRequestDTOCopyWithImpl;
@useResult
$Res call({
 String refreshToken
});




}
/// @nodoc
class _$RefreshTokenRequestDTOCopyWithImpl<$Res>
    implements $RefreshTokenRequestDTOCopyWith<$Res> {
  _$RefreshTokenRequestDTOCopyWithImpl(this._self, this._then);

  final RefreshTokenRequestDTO _self;
  final $Res Function(RefreshTokenRequestDTO) _then;

/// Create a copy of RefreshTokenRequestDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? refreshToken = null,}) {
  return _then(_self.copyWith(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RefreshTokenRequestDTO].
extension RefreshTokenRequestDTOPatterns on RefreshTokenRequestDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefreshTokenRequestDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshTokenRequestDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefreshTokenRequestDTO value)  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenRequestDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefreshTokenRequestDTO value)?  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenRequestDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshTokenRequestDTO() when $default != null:
return $default(_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenRequestDTO():
return $default(_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenRequestDTO() when $default != null:
return $default(_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefreshTokenRequestDTO implements RefreshTokenRequestDTO {
  const _RefreshTokenRequestDTO({required this.refreshToken});
  factory _RefreshTokenRequestDTO.fromJson(Map<String, dynamic> json) => _$RefreshTokenRequestDTOFromJson(json);

@override final  String refreshToken;

/// Create a copy of RefreshTokenRequestDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshTokenRequestDTOCopyWith<_RefreshTokenRequestDTO> get copyWith => __$RefreshTokenRequestDTOCopyWithImpl<_RefreshTokenRequestDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshTokenRequestDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshTokenRequestDTO&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refreshToken);

@override
String toString() {
  return 'RefreshTokenRequestDTO(refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$RefreshTokenRequestDTOCopyWith<$Res> implements $RefreshTokenRequestDTOCopyWith<$Res> {
  factory _$RefreshTokenRequestDTOCopyWith(_RefreshTokenRequestDTO value, $Res Function(_RefreshTokenRequestDTO) _then) = __$RefreshTokenRequestDTOCopyWithImpl;
@override @useResult
$Res call({
 String refreshToken
});




}
/// @nodoc
class __$RefreshTokenRequestDTOCopyWithImpl<$Res>
    implements _$RefreshTokenRequestDTOCopyWith<$Res> {
  __$RefreshTokenRequestDTOCopyWithImpl(this._self, this._then);

  final _RefreshTokenRequestDTO _self;
  final $Res Function(_RefreshTokenRequestDTO) _then;

/// Create a copy of RefreshTokenRequestDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? refreshToken = null,}) {
  return _then(_RefreshTokenRequestDTO(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
