// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'competition_input_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompetitionInputDTO {

 String get name; String get level;// ADICIONADO: Lista de IDs de desportos (Long no Java -> int no Dart).
 List<int> get sportIds;
/// Create a copy of CompetitionInputDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompetitionInputDTOCopyWith<CompetitionInputDTO> get copyWith => _$CompetitionInputDTOCopyWithImpl<CompetitionInputDTO>(this as CompetitionInputDTO, _$identity);

  /// Serializes this CompetitionInputDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompetitionInputDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other.sportIds, sportIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,level,const DeepCollectionEquality().hash(sportIds));

@override
String toString() {
  return 'CompetitionInputDTO(name: $name, level: $level, sportIds: $sportIds)';
}


}

/// @nodoc
abstract mixin class $CompetitionInputDTOCopyWith<$Res>  {
  factory $CompetitionInputDTOCopyWith(CompetitionInputDTO value, $Res Function(CompetitionInputDTO) _then) = _$CompetitionInputDTOCopyWithImpl;
@useResult
$Res call({
 String name, String level, List<int> sportIds
});




}
/// @nodoc
class _$CompetitionInputDTOCopyWithImpl<$Res>
    implements $CompetitionInputDTOCopyWith<$Res> {
  _$CompetitionInputDTOCopyWithImpl(this._self, this._then);

  final CompetitionInputDTO _self;
  final $Res Function(CompetitionInputDTO) _then;

/// Create a copy of CompetitionInputDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? level = null,Object? sportIds = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,sportIds: null == sportIds ? _self.sportIds : sportIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [CompetitionInputDTO].
extension CompetitionInputDTOPatterns on CompetitionInputDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompetitionInputDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompetitionInputDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompetitionInputDTO value)  $default,){
final _that = this;
switch (_that) {
case _CompetitionInputDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompetitionInputDTO value)?  $default,){
final _that = this;
switch (_that) {
case _CompetitionInputDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String level,  List<int> sportIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompetitionInputDTO() when $default != null:
return $default(_that.name,_that.level,_that.sportIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String level,  List<int> sportIds)  $default,) {final _that = this;
switch (_that) {
case _CompetitionInputDTO():
return $default(_that.name,_that.level,_that.sportIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String level,  List<int> sportIds)?  $default,) {final _that = this;
switch (_that) {
case _CompetitionInputDTO() when $default != null:
return $default(_that.name,_that.level,_that.sportIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompetitionInputDTO implements CompetitionInputDTO {
  const _CompetitionInputDTO({required this.name, required this.level, required final  List<int> sportIds}): _sportIds = sportIds;
  factory _CompetitionInputDTO.fromJson(Map<String, dynamic> json) => _$CompetitionInputDTOFromJson(json);

@override final  String name;
@override final  String level;
// ADICIONADO: Lista de IDs de desportos (Long no Java -> int no Dart).
 final  List<int> _sportIds;
// ADICIONADO: Lista de IDs de desportos (Long no Java -> int no Dart).
@override List<int> get sportIds {
  if (_sportIds is EqualUnmodifiableListView) return _sportIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sportIds);
}


/// Create a copy of CompetitionInputDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompetitionInputDTOCopyWith<_CompetitionInputDTO> get copyWith => __$CompetitionInputDTOCopyWithImpl<_CompetitionInputDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompetitionInputDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompetitionInputDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other._sportIds, _sportIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,level,const DeepCollectionEquality().hash(_sportIds));

@override
String toString() {
  return 'CompetitionInputDTO(name: $name, level: $level, sportIds: $sportIds)';
}


}

/// @nodoc
abstract mixin class _$CompetitionInputDTOCopyWith<$Res> implements $CompetitionInputDTOCopyWith<$Res> {
  factory _$CompetitionInputDTOCopyWith(_CompetitionInputDTO value, $Res Function(_CompetitionInputDTO) _then) = __$CompetitionInputDTOCopyWithImpl;
@override @useResult
$Res call({
 String name, String level, List<int> sportIds
});




}
/// @nodoc
class __$CompetitionInputDTOCopyWithImpl<$Res>
    implements _$CompetitionInputDTOCopyWith<$Res> {
  __$CompetitionInputDTOCopyWithImpl(this._self, this._then);

  final _CompetitionInputDTO _self;
  final $Res Function(_CompetitionInputDTO) _then;

/// Create a copy of CompetitionInputDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? level = null,Object? sportIds = null,}) {
  return _then(_CompetitionInputDTO(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,sportIds: null == sportIds ? _self._sportIds : sportIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
