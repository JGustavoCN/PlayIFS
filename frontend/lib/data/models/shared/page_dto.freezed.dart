// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PageDTO<T> {

 List<T> get content; int get pageNumber; int get totalPages; int get totalElements;
/// Create a copy of PageDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageDTOCopyWith<T, PageDTO<T>> get copyWith => _$PageDTOCopyWithImpl<T, PageDTO<T>>(this as PageDTO<T>, _$identity);

  /// Serializes this PageDTO to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageDTO<T>&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),pageNumber,totalPages,totalElements);

@override
String toString() {
  return 'PageDTO<$T>(content: $content, pageNumber: $pageNumber, totalPages: $totalPages, totalElements: $totalElements)';
}


}

/// @nodoc
abstract mixin class $PageDTOCopyWith<T,$Res>  {
  factory $PageDTOCopyWith(PageDTO<T> value, $Res Function(PageDTO<T>) _then) = _$PageDTOCopyWithImpl;
@useResult
$Res call({
 List<T> content, int pageNumber, int totalPages, int totalElements
});




}
/// @nodoc
class _$PageDTOCopyWithImpl<T,$Res>
    implements $PageDTOCopyWith<T, $Res> {
  _$PageDTOCopyWithImpl(this._self, this._then);

  final PageDTO<T> _self;
  final $Res Function(PageDTO<T>) _then;

/// Create a copy of PageDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? pageNumber = null,Object? totalPages = null,Object? totalElements = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<T>,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PageDTO].
extension PageDTOPatterns<T> on PageDTO<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PageDTO<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PageDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PageDTO<T> value)  $default,){
final _that = this;
switch (_that) {
case _PageDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PageDTO<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PageDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> content,  int pageNumber,  int totalPages,  int totalElements)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PageDTO() when $default != null:
return $default(_that.content,_that.pageNumber,_that.totalPages,_that.totalElements);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> content,  int pageNumber,  int totalPages,  int totalElements)  $default,) {final _that = this;
switch (_that) {
case _PageDTO():
return $default(_that.content,_that.pageNumber,_that.totalPages,_that.totalElements);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> content,  int pageNumber,  int totalPages,  int totalElements)?  $default,) {final _that = this;
switch (_that) {
case _PageDTO() when $default != null:
return $default(_that.content,_that.pageNumber,_that.totalPages,_that.totalElements);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _PageDTO<T> implements PageDTO<T> {
  const _PageDTO({required final  List<T> content, required this.pageNumber, required this.totalPages, required this.totalElements}): _content = content;
  factory _PageDTO.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$PageDTOFromJson(json,fromJsonT);

 final  List<T> _content;
@override List<T> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override final  int pageNumber;
@override final  int totalPages;
@override final  int totalElements;

/// Create a copy of PageDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageDTOCopyWith<T, _PageDTO<T>> get copyWith => __$PageDTOCopyWithImpl<T, _PageDTO<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$PageDTOToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageDTO<T>&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),pageNumber,totalPages,totalElements);

@override
String toString() {
  return 'PageDTO<$T>(content: $content, pageNumber: $pageNumber, totalPages: $totalPages, totalElements: $totalElements)';
}


}

/// @nodoc
abstract mixin class _$PageDTOCopyWith<T,$Res> implements $PageDTOCopyWith<T, $Res> {
  factory _$PageDTOCopyWith(_PageDTO<T> value, $Res Function(_PageDTO<T>) _then) = __$PageDTOCopyWithImpl;
@override @useResult
$Res call({
 List<T> content, int pageNumber, int totalPages, int totalElements
});




}
/// @nodoc
class __$PageDTOCopyWithImpl<T,$Res>
    implements _$PageDTOCopyWith<T, $Res> {
  __$PageDTOCopyWithImpl(this._self, this._then);

  final _PageDTO<T> _self;
  final $Res Function(_PageDTO<T>) _then;

/// Create a copy of PageDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? pageNumber = null,Object? totalPages = null,Object? totalElements = null,}) {
  return _then(_PageDTO<T>(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<T>,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
