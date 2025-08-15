// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'athlete_input_batch_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AthleteInputBatchDTO {

 List<AthleteInputDTO> get athletes;
/// Create a copy of AthleteInputBatchDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AthleteInputBatchDTOCopyWith<AthleteInputBatchDTO> get copyWith => _$AthleteInputBatchDTOCopyWithImpl<AthleteInputBatchDTO>(this as AthleteInputBatchDTO, _$identity);

  /// Serializes this AthleteInputBatchDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AthleteInputBatchDTO&&const DeepCollectionEquality().equals(other.athletes, athletes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(athletes));

@override
String toString() {
  return 'AthleteInputBatchDTO(athletes: $athletes)';
}


}

/// @nodoc
abstract mixin class $AthleteInputBatchDTOCopyWith<$Res>  {
  factory $AthleteInputBatchDTOCopyWith(AthleteInputBatchDTO value, $Res Function(AthleteInputBatchDTO) _then) = _$AthleteInputBatchDTOCopyWithImpl;
@useResult
$Res call({
 List<AthleteInputDTO> athletes
});




}
/// @nodoc
class _$AthleteInputBatchDTOCopyWithImpl<$Res>
    implements $AthleteInputBatchDTOCopyWith<$Res> {
  _$AthleteInputBatchDTOCopyWithImpl(this._self, this._then);

  final AthleteInputBatchDTO _self;
  final $Res Function(AthleteInputBatchDTO) _then;

/// Create a copy of AthleteInputBatchDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? athletes = null,}) {
  return _then(_self.copyWith(
athletes: null == athletes ? _self.athletes : athletes // ignore: cast_nullable_to_non_nullable
as List<AthleteInputDTO>,
  ));
}

}


/// Adds pattern-matching-related methods to [AthleteInputBatchDTO].
extension AthleteInputBatchDTOPatterns on AthleteInputBatchDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AthleteInputBatchDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AthleteInputBatchDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AthleteInputBatchDTO value)  $default,){
final _that = this;
switch (_that) {
case _AthleteInputBatchDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AthleteInputBatchDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AthleteInputBatchDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AthleteInputDTO> athletes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AthleteInputBatchDTO() when $default != null:
return $default(_that.athletes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AthleteInputDTO> athletes)  $default,) {final _that = this;
switch (_that) {
case _AthleteInputBatchDTO():
return $default(_that.athletes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AthleteInputDTO> athletes)?  $default,) {final _that = this;
switch (_that) {
case _AthleteInputBatchDTO() when $default != null:
return $default(_that.athletes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AthleteInputBatchDTO implements AthleteInputBatchDTO {
  const _AthleteInputBatchDTO({required final  List<AthleteInputDTO> athletes}): _athletes = athletes;
  factory _AthleteInputBatchDTO.fromJson(Map<String, dynamic> json) => _$AthleteInputBatchDTOFromJson(json);

 final  List<AthleteInputDTO> _athletes;
@override List<AthleteInputDTO> get athletes {
  if (_athletes is EqualUnmodifiableListView) return _athletes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_athletes);
}


/// Create a copy of AthleteInputBatchDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AthleteInputBatchDTOCopyWith<_AthleteInputBatchDTO> get copyWith => __$AthleteInputBatchDTOCopyWithImpl<_AthleteInputBatchDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AthleteInputBatchDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AthleteInputBatchDTO&&const DeepCollectionEquality().equals(other._athletes, _athletes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_athletes));

@override
String toString() {
  return 'AthleteInputBatchDTO(athletes: $athletes)';
}


}

/// @nodoc
abstract mixin class _$AthleteInputBatchDTOCopyWith<$Res> implements $AthleteInputBatchDTOCopyWith<$Res> {
  factory _$AthleteInputBatchDTOCopyWith(_AthleteInputBatchDTO value, $Res Function(_AthleteInputBatchDTO) _then) = __$AthleteInputBatchDTOCopyWithImpl;
@override @useResult
$Res call({
 List<AthleteInputDTO> athletes
});




}
/// @nodoc
class __$AthleteInputBatchDTOCopyWithImpl<$Res>
    implements _$AthleteInputBatchDTOCopyWith<$Res> {
  __$AthleteInputBatchDTOCopyWithImpl(this._self, this._then);

  final _AthleteInputBatchDTO _self;
  final $Res Function(_AthleteInputBatchDTO) _then;

/// Create a copy of AthleteInputBatchDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? athletes = null,}) {
  return _then(_AthleteInputBatchDTO(
athletes: null == athletes ? _self._athletes : athletes // ignore: cast_nullable_to_non_nullable
as List<AthleteInputDTO>,
  ));
}


}

// dart format on
