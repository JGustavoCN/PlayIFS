// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'competition_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompetitionDetailsDTO {

 int get id; String get name; String get level;// CORREÇÃO: O status pode vir nulo da API.
 String? get status; List<SportSummaryDTO> get associatedSports;
/// Create a copy of CompetitionDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompetitionDetailsDTOCopyWith<CompetitionDetailsDTO> get copyWith => _$CompetitionDetailsDTOCopyWithImpl<CompetitionDetailsDTO>(this as CompetitionDetailsDTO, _$identity);

  /// Serializes this CompetitionDetailsDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompetitionDetailsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.associatedSports, associatedSports));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,level,status,const DeepCollectionEquality().hash(associatedSports));

@override
String toString() {
  return 'CompetitionDetailsDTO(id: $id, name: $name, level: $level, status: $status, associatedSports: $associatedSports)';
}


}

/// @nodoc
abstract mixin class $CompetitionDetailsDTOCopyWith<$Res>  {
  factory $CompetitionDetailsDTOCopyWith(CompetitionDetailsDTO value, $Res Function(CompetitionDetailsDTO) _then) = _$CompetitionDetailsDTOCopyWithImpl;
@useResult
$Res call({
 int id, String name, String level, String? status, List<SportSummaryDTO> associatedSports
});




}
/// @nodoc
class _$CompetitionDetailsDTOCopyWithImpl<$Res>
    implements $CompetitionDetailsDTOCopyWith<$Res> {
  _$CompetitionDetailsDTOCopyWithImpl(this._self, this._then);

  final CompetitionDetailsDTO _self;
  final $Res Function(CompetitionDetailsDTO) _then;

/// Create a copy of CompetitionDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? level = null,Object? status = freezed,Object? associatedSports = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,associatedSports: null == associatedSports ? _self.associatedSports : associatedSports // ignore: cast_nullable_to_non_nullable
as List<SportSummaryDTO>,
  ));
}

}


/// Adds pattern-matching-related methods to [CompetitionDetailsDTO].
extension CompetitionDetailsDTOPatterns on CompetitionDetailsDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompetitionDetailsDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompetitionDetailsDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompetitionDetailsDTO value)  $default,){
final _that = this;
switch (_that) {
case _CompetitionDetailsDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompetitionDetailsDTO value)?  $default,){
final _that = this;
switch (_that) {
case _CompetitionDetailsDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String level,  String? status,  List<SportSummaryDTO> associatedSports)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompetitionDetailsDTO() when $default != null:
return $default(_that.id,_that.name,_that.level,_that.status,_that.associatedSports);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String level,  String? status,  List<SportSummaryDTO> associatedSports)  $default,) {final _that = this;
switch (_that) {
case _CompetitionDetailsDTO():
return $default(_that.id,_that.name,_that.level,_that.status,_that.associatedSports);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String level,  String? status,  List<SportSummaryDTO> associatedSports)?  $default,) {final _that = this;
switch (_that) {
case _CompetitionDetailsDTO() when $default != null:
return $default(_that.id,_that.name,_that.level,_that.status,_that.associatedSports);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompetitionDetailsDTO implements CompetitionDetailsDTO {
  const _CompetitionDetailsDTO({required this.id, required this.name, required this.level, required this.status, required final  List<SportSummaryDTO> associatedSports}): _associatedSports = associatedSports;
  factory _CompetitionDetailsDTO.fromJson(Map<String, dynamic> json) => _$CompetitionDetailsDTOFromJson(json);

@override final  int id;
@override final  String name;
@override final  String level;
// CORREÇÃO: O status pode vir nulo da API.
@override final  String? status;
 final  List<SportSummaryDTO> _associatedSports;
@override List<SportSummaryDTO> get associatedSports {
  if (_associatedSports is EqualUnmodifiableListView) return _associatedSports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_associatedSports);
}


/// Create a copy of CompetitionDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompetitionDetailsDTOCopyWith<_CompetitionDetailsDTO> get copyWith => __$CompetitionDetailsDTOCopyWithImpl<_CompetitionDetailsDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompetitionDetailsDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompetitionDetailsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._associatedSports, _associatedSports));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,level,status,const DeepCollectionEquality().hash(_associatedSports));

@override
String toString() {
  return 'CompetitionDetailsDTO(id: $id, name: $name, level: $level, status: $status, associatedSports: $associatedSports)';
}


}

/// @nodoc
abstract mixin class _$CompetitionDetailsDTOCopyWith<$Res> implements $CompetitionDetailsDTOCopyWith<$Res> {
  factory _$CompetitionDetailsDTOCopyWith(_CompetitionDetailsDTO value, $Res Function(_CompetitionDetailsDTO) _then) = __$CompetitionDetailsDTOCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String level, String? status, List<SportSummaryDTO> associatedSports
});




}
/// @nodoc
class __$CompetitionDetailsDTOCopyWithImpl<$Res>
    implements _$CompetitionDetailsDTOCopyWith<$Res> {
  __$CompetitionDetailsDTOCopyWithImpl(this._self, this._then);

  final _CompetitionDetailsDTO _self;
  final $Res Function(_CompetitionDetailsDTO) _then;

/// Create a copy of CompetitionDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? level = null,Object? status = freezed,Object? associatedSports = null,}) {
  return _then(_CompetitionDetailsDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,associatedSports: null == associatedSports ? _self._associatedSports : associatedSports // ignore: cast_nullable_to_non_nullable
as List<SportSummaryDTO>,
  ));
}


}

// dart format on
