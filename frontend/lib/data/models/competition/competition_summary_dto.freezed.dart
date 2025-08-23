// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'competition_summary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompetitionSummaryDTO {

 int get id; String get name; String get level;
/// Create a copy of CompetitionSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompetitionSummaryDTOCopyWith<CompetitionSummaryDTO> get copyWith => _$CompetitionSummaryDTOCopyWithImpl<CompetitionSummaryDTO>(this as CompetitionSummaryDTO, _$identity);

  /// Serializes this CompetitionSummaryDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompetitionSummaryDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,level);

@override
String toString() {
  return 'CompetitionSummaryDTO(id: $id, name: $name, level: $level)';
}


}

/// @nodoc
abstract mixin class $CompetitionSummaryDTOCopyWith<$Res>  {
  factory $CompetitionSummaryDTOCopyWith(CompetitionSummaryDTO value, $Res Function(CompetitionSummaryDTO) _then) = _$CompetitionSummaryDTOCopyWithImpl;
@useResult
$Res call({
 int id, String name, String level
});




}
/// @nodoc
class _$CompetitionSummaryDTOCopyWithImpl<$Res>
    implements $CompetitionSummaryDTOCopyWith<$Res> {
  _$CompetitionSummaryDTOCopyWithImpl(this._self, this._then);

  final CompetitionSummaryDTO _self;
  final $Res Function(CompetitionSummaryDTO) _then;

/// Create a copy of CompetitionSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? level = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CompetitionSummaryDTO].
extension CompetitionSummaryDTOPatterns on CompetitionSummaryDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompetitionSummaryDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompetitionSummaryDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompetitionSummaryDTO value)  $default,){
final _that = this;
switch (_that) {
case _CompetitionSummaryDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompetitionSummaryDTO value)?  $default,){
final _that = this;
switch (_that) {
case _CompetitionSummaryDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String level)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompetitionSummaryDTO() when $default != null:
return $default(_that.id,_that.name,_that.level);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String level)  $default,) {final _that = this;
switch (_that) {
case _CompetitionSummaryDTO():
return $default(_that.id,_that.name,_that.level);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String level)?  $default,) {final _that = this;
switch (_that) {
case _CompetitionSummaryDTO() when $default != null:
return $default(_that.id,_that.name,_that.level);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompetitionSummaryDTO implements CompetitionSummaryDTO {
  const _CompetitionSummaryDTO({required this.id, required this.name, required this.level});
  factory _CompetitionSummaryDTO.fromJson(Map<String, dynamic> json) => _$CompetitionSummaryDTOFromJson(json);

@override final  int id;
@override final  String name;
@override final  String level;

/// Create a copy of CompetitionSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompetitionSummaryDTOCopyWith<_CompetitionSummaryDTO> get copyWith => __$CompetitionSummaryDTOCopyWithImpl<_CompetitionSummaryDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompetitionSummaryDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompetitionSummaryDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,level);

@override
String toString() {
  return 'CompetitionSummaryDTO(id: $id, name: $name, level: $level)';
}


}

/// @nodoc
abstract mixin class _$CompetitionSummaryDTOCopyWith<$Res> implements $CompetitionSummaryDTOCopyWith<$Res> {
  factory _$CompetitionSummaryDTOCopyWith(_CompetitionSummaryDTO value, $Res Function(_CompetitionSummaryDTO) _then) = __$CompetitionSummaryDTOCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String level
});




}
/// @nodoc
class __$CompetitionSummaryDTOCopyWithImpl<$Res>
    implements _$CompetitionSummaryDTOCopyWith<$Res> {
  __$CompetitionSummaryDTOCopyWithImpl(this._self, this._then);

  final _CompetitionSummaryDTO _self;
  final $Res Function(_CompetitionSummaryDTO) _then;

/// Create a copy of CompetitionSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? level = null,}) {
  return _then(_CompetitionSummaryDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
