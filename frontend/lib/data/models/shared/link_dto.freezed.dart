// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'link_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LinkDTO {

 String get rel; String get href;
/// Create a copy of LinkDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LinkDTOCopyWith<LinkDTO> get copyWith => _$LinkDTOCopyWithImpl<LinkDTO>(this as LinkDTO, _$identity);

  /// Serializes this LinkDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LinkDTO&&(identical(other.rel, rel) || other.rel == rel)&&(identical(other.href, href) || other.href == href));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rel,href);

@override
String toString() {
  return 'LinkDTO(rel: $rel, href: $href)';
}


}

/// @nodoc
abstract mixin class $LinkDTOCopyWith<$Res>  {
  factory $LinkDTOCopyWith(LinkDTO value, $Res Function(LinkDTO) _then) = _$LinkDTOCopyWithImpl;
@useResult
$Res call({
 String rel, String href
});




}
/// @nodoc
class _$LinkDTOCopyWithImpl<$Res>
    implements $LinkDTOCopyWith<$Res> {
  _$LinkDTOCopyWithImpl(this._self, this._then);

  final LinkDTO _self;
  final $Res Function(LinkDTO) _then;

/// Create a copy of LinkDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rel = null,Object? href = null,}) {
  return _then(_self.copyWith(
rel: null == rel ? _self.rel : rel // ignore: cast_nullable_to_non_nullable
as String,href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LinkDTO].
extension LinkDTOPatterns on LinkDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LinkDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LinkDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LinkDTO value)  $default,){
final _that = this;
switch (_that) {
case _LinkDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LinkDTO value)?  $default,){
final _that = this;
switch (_that) {
case _LinkDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String rel,  String href)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LinkDTO() when $default != null:
return $default(_that.rel,_that.href);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String rel,  String href)  $default,) {final _that = this;
switch (_that) {
case _LinkDTO():
return $default(_that.rel,_that.href);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String rel,  String href)?  $default,) {final _that = this;
switch (_that) {
case _LinkDTO() when $default != null:
return $default(_that.rel,_that.href);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LinkDTO implements LinkDTO {
  const _LinkDTO({required this.rel, required this.href});
  factory _LinkDTO.fromJson(Map<String, dynamic> json) => _$LinkDTOFromJson(json);

@override final  String rel;
@override final  String href;

/// Create a copy of LinkDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LinkDTOCopyWith<_LinkDTO> get copyWith => __$LinkDTOCopyWithImpl<_LinkDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LinkDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LinkDTO&&(identical(other.rel, rel) || other.rel == rel)&&(identical(other.href, href) || other.href == href));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rel,href);

@override
String toString() {
  return 'LinkDTO(rel: $rel, href: $href)';
}


}

/// @nodoc
abstract mixin class _$LinkDTOCopyWith<$Res> implements $LinkDTOCopyWith<$Res> {
  factory _$LinkDTOCopyWith(_LinkDTO value, $Res Function(_LinkDTO) _then) = __$LinkDTOCopyWithImpl;
@override @useResult
$Res call({
 String rel, String href
});




}
/// @nodoc
class __$LinkDTOCopyWithImpl<$Res>
    implements _$LinkDTOCopyWith<$Res> {
  __$LinkDTOCopyWithImpl(this._self, this._then);

  final _LinkDTO _self;
  final $Res Function(_LinkDTO) _then;

/// Create a copy of LinkDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rel = null,Object? href = null,}) {
  return _then(_LinkDTO(
rel: null == rel ? _self.rel : rel // ignore: cast_nullable_to_non_nullable
as String,href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
