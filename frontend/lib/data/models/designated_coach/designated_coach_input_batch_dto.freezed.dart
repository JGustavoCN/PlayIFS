// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'designated_coach_input_batch_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DesignatedCoachInputBatchDTO {

// O nome no DTO do backend é 'coaches', vamos manter a consistência.
 List<DesignatedCoachInputDTO> get coaches;
/// Create a copy of DesignatedCoachInputBatchDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DesignatedCoachInputBatchDTOCopyWith<DesignatedCoachInputBatchDTO> get copyWith => _$DesignatedCoachInputBatchDTOCopyWithImpl<DesignatedCoachInputBatchDTO>(this as DesignatedCoachInputBatchDTO, _$identity);

  /// Serializes this DesignatedCoachInputBatchDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DesignatedCoachInputBatchDTO&&const DeepCollectionEquality().equals(other.coaches, coaches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(coaches));

@override
String toString() {
  return 'DesignatedCoachInputBatchDTO(coaches: $coaches)';
}


}

/// @nodoc
abstract mixin class $DesignatedCoachInputBatchDTOCopyWith<$Res>  {
  factory $DesignatedCoachInputBatchDTOCopyWith(DesignatedCoachInputBatchDTO value, $Res Function(DesignatedCoachInputBatchDTO) _then) = _$DesignatedCoachInputBatchDTOCopyWithImpl;
@useResult
$Res call({
 List<DesignatedCoachInputDTO> coaches
});




}
/// @nodoc
class _$DesignatedCoachInputBatchDTOCopyWithImpl<$Res>
    implements $DesignatedCoachInputBatchDTOCopyWith<$Res> {
  _$DesignatedCoachInputBatchDTOCopyWithImpl(this._self, this._then);

  final DesignatedCoachInputBatchDTO _self;
  final $Res Function(DesignatedCoachInputBatchDTO) _then;

/// Create a copy of DesignatedCoachInputBatchDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coaches = null,}) {
  return _then(_self.copyWith(
coaches: null == coaches ? _self.coaches : coaches // ignore: cast_nullable_to_non_nullable
as List<DesignatedCoachInputDTO>,
  ));
}

}


/// Adds pattern-matching-related methods to [DesignatedCoachInputBatchDTO].
extension DesignatedCoachInputBatchDTOPatterns on DesignatedCoachInputBatchDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DesignatedCoachInputBatchDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DesignatedCoachInputBatchDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DesignatedCoachInputBatchDTO value)  $default,){
final _that = this;
switch (_that) {
case _DesignatedCoachInputBatchDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DesignatedCoachInputBatchDTO value)?  $default,){
final _that = this;
switch (_that) {
case _DesignatedCoachInputBatchDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DesignatedCoachInputDTO> coaches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DesignatedCoachInputBatchDTO() when $default != null:
return $default(_that.coaches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DesignatedCoachInputDTO> coaches)  $default,) {final _that = this;
switch (_that) {
case _DesignatedCoachInputBatchDTO():
return $default(_that.coaches);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DesignatedCoachInputDTO> coaches)?  $default,) {final _that = this;
switch (_that) {
case _DesignatedCoachInputBatchDTO() when $default != null:
return $default(_that.coaches);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DesignatedCoachInputBatchDTO implements DesignatedCoachInputBatchDTO {
  const _DesignatedCoachInputBatchDTO({required final  List<DesignatedCoachInputDTO> coaches}): _coaches = coaches;
  factory _DesignatedCoachInputBatchDTO.fromJson(Map<String, dynamic> json) => _$DesignatedCoachInputBatchDTOFromJson(json);

// O nome no DTO do backend é 'coaches', vamos manter a consistência.
 final  List<DesignatedCoachInputDTO> _coaches;
// O nome no DTO do backend é 'coaches', vamos manter a consistência.
@override List<DesignatedCoachInputDTO> get coaches {
  if (_coaches is EqualUnmodifiableListView) return _coaches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coaches);
}


/// Create a copy of DesignatedCoachInputBatchDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DesignatedCoachInputBatchDTOCopyWith<_DesignatedCoachInputBatchDTO> get copyWith => __$DesignatedCoachInputBatchDTOCopyWithImpl<_DesignatedCoachInputBatchDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DesignatedCoachInputBatchDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DesignatedCoachInputBatchDTO&&const DeepCollectionEquality().equals(other._coaches, _coaches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_coaches));

@override
String toString() {
  return 'DesignatedCoachInputBatchDTO(coaches: $coaches)';
}


}

/// @nodoc
abstract mixin class _$DesignatedCoachInputBatchDTOCopyWith<$Res> implements $DesignatedCoachInputBatchDTOCopyWith<$Res> {
  factory _$DesignatedCoachInputBatchDTOCopyWith(_DesignatedCoachInputBatchDTO value, $Res Function(_DesignatedCoachInputBatchDTO) _then) = __$DesignatedCoachInputBatchDTOCopyWithImpl;
@override @useResult
$Res call({
 List<DesignatedCoachInputDTO> coaches
});




}
/// @nodoc
class __$DesignatedCoachInputBatchDTOCopyWithImpl<$Res>
    implements _$DesignatedCoachInputBatchDTOCopyWith<$Res> {
  __$DesignatedCoachInputBatchDTOCopyWithImpl(this._self, this._then);

  final _DesignatedCoachInputBatchDTO _self;
  final $Res Function(_DesignatedCoachInputBatchDTO) _then;

/// Create a copy of DesignatedCoachInputBatchDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coaches = null,}) {
  return _then(_DesignatedCoachInputBatchDTO(
coaches: null == coaches ? _self._coaches : coaches // ignore: cast_nullable_to_non_nullable
as List<DesignatedCoachInputDTO>,
  ));
}


}

// dart format on
