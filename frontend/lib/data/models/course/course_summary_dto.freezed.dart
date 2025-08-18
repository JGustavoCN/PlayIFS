// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_summary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CourseSummaryDTO {

 int get id; String get name; String get level; String get campusName;
/// Create a copy of CourseSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseSummaryDTOCopyWith<CourseSummaryDTO> get copyWith => _$CourseSummaryDTOCopyWithImpl<CourseSummaryDTO>(this as CourseSummaryDTO, _$identity);

  /// Serializes this CourseSummaryDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseSummaryDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level)&&(identical(other.campusName, campusName) || other.campusName == campusName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,level,campusName);

@override
String toString() {
  return 'CourseSummaryDTO(id: $id, name: $name, level: $level, campusName: $campusName)';
}


}

/// @nodoc
abstract mixin class $CourseSummaryDTOCopyWith<$Res>  {
  factory $CourseSummaryDTOCopyWith(CourseSummaryDTO value, $Res Function(CourseSummaryDTO) _then) = _$CourseSummaryDTOCopyWithImpl;
@useResult
$Res call({
 int id, String name, String level, String campusName
});




}
/// @nodoc
class _$CourseSummaryDTOCopyWithImpl<$Res>
    implements $CourseSummaryDTOCopyWith<$Res> {
  _$CourseSummaryDTOCopyWithImpl(this._self, this._then);

  final CourseSummaryDTO _self;
  final $Res Function(CourseSummaryDTO) _then;

/// Create a copy of CourseSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? level = null,Object? campusName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,campusName: null == campusName ? _self.campusName : campusName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseSummaryDTO].
extension CourseSummaryDTOPatterns on CourseSummaryDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourseSummaryDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourseSummaryDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourseSummaryDTO value)  $default,){
final _that = this;
switch (_that) {
case _CourseSummaryDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourseSummaryDTO value)?  $default,){
final _that = this;
switch (_that) {
case _CourseSummaryDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String level,  String campusName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseSummaryDTO() when $default != null:
return $default(_that.id,_that.name,_that.level,_that.campusName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String level,  String campusName)  $default,) {final _that = this;
switch (_that) {
case _CourseSummaryDTO():
return $default(_that.id,_that.name,_that.level,_that.campusName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String level,  String campusName)?  $default,) {final _that = this;
switch (_that) {
case _CourseSummaryDTO() when $default != null:
return $default(_that.id,_that.name,_that.level,_that.campusName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CourseSummaryDTO implements CourseSummaryDTO {
  const _CourseSummaryDTO({required this.id, required this.name, required this.level, required this.campusName});
  factory _CourseSummaryDTO.fromJson(Map<String, dynamic> json) => _$CourseSummaryDTOFromJson(json);

@override final  int id;
@override final  String name;
@override final  String level;
@override final  String campusName;

/// Create a copy of CourseSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseSummaryDTOCopyWith<_CourseSummaryDTO> get copyWith => __$CourseSummaryDTOCopyWithImpl<_CourseSummaryDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourseSummaryDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseSummaryDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level)&&(identical(other.campusName, campusName) || other.campusName == campusName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,level,campusName);

@override
String toString() {
  return 'CourseSummaryDTO(id: $id, name: $name, level: $level, campusName: $campusName)';
}


}

/// @nodoc
abstract mixin class _$CourseSummaryDTOCopyWith<$Res> implements $CourseSummaryDTOCopyWith<$Res> {
  factory _$CourseSummaryDTOCopyWith(_CourseSummaryDTO value, $Res Function(_CourseSummaryDTO) _then) = __$CourseSummaryDTOCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String level, String campusName
});




}
/// @nodoc
class __$CourseSummaryDTOCopyWithImpl<$Res>
    implements _$CourseSummaryDTOCopyWith<$Res> {
  __$CourseSummaryDTOCopyWithImpl(this._self, this._then);

  final _CourseSummaryDTO _self;
  final $Res Function(_CourseSummaryDTO) _then;

/// Create a copy of CourseSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? level = null,Object? campusName = null,}) {
  return _then(_CourseSummaryDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,campusName: null == campusName ? _self.campusName : campusName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
