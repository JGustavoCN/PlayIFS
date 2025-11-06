// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_reschedule_batch_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameRescheduleBatchDTO {

 List<GameRescheduleItemDTO> get schedules;
/// Create a copy of GameRescheduleBatchDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameRescheduleBatchDTOCopyWith<GameRescheduleBatchDTO> get copyWith => _$GameRescheduleBatchDTOCopyWithImpl<GameRescheduleBatchDTO>(this as GameRescheduleBatchDTO, _$identity);

  /// Serializes this GameRescheduleBatchDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameRescheduleBatchDTO&&const DeepCollectionEquality().equals(other.schedules, schedules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(schedules));

@override
String toString() {
  return 'GameRescheduleBatchDTO(schedules: $schedules)';
}


}

/// @nodoc
abstract mixin class $GameRescheduleBatchDTOCopyWith<$Res>  {
  factory $GameRescheduleBatchDTOCopyWith(GameRescheduleBatchDTO value, $Res Function(GameRescheduleBatchDTO) _then) = _$GameRescheduleBatchDTOCopyWithImpl;
@useResult
$Res call({
 List<GameRescheduleItemDTO> schedules
});




}
/// @nodoc
class _$GameRescheduleBatchDTOCopyWithImpl<$Res>
    implements $GameRescheduleBatchDTOCopyWith<$Res> {
  _$GameRescheduleBatchDTOCopyWithImpl(this._self, this._then);

  final GameRescheduleBatchDTO _self;
  final $Res Function(GameRescheduleBatchDTO) _then;

/// Create a copy of GameRescheduleBatchDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schedules = null,}) {
  return _then(_self.copyWith(
schedules: null == schedules ? _self.schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<GameRescheduleItemDTO>,
  ));
}

}


/// Adds pattern-matching-related methods to [GameRescheduleBatchDTO].
extension GameRescheduleBatchDTOPatterns on GameRescheduleBatchDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameRescheduleBatchDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameRescheduleBatchDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameRescheduleBatchDTO value)  $default,){
final _that = this;
switch (_that) {
case _GameRescheduleBatchDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameRescheduleBatchDTO value)?  $default,){
final _that = this;
switch (_that) {
case _GameRescheduleBatchDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GameRescheduleItemDTO> schedules)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameRescheduleBatchDTO() when $default != null:
return $default(_that.schedules);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GameRescheduleItemDTO> schedules)  $default,) {final _that = this;
switch (_that) {
case _GameRescheduleBatchDTO():
return $default(_that.schedules);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GameRescheduleItemDTO> schedules)?  $default,) {final _that = this;
switch (_that) {
case _GameRescheduleBatchDTO() when $default != null:
return $default(_that.schedules);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
class _GameRescheduleBatchDTO implements GameRescheduleBatchDTO {
  const _GameRescheduleBatchDTO({required final  List<GameRescheduleItemDTO> schedules}): _schedules = schedules;
  factory _GameRescheduleBatchDTO.fromJson(Map<String, dynamic> json) => _$GameRescheduleBatchDTOFromJson(json);

 final  List<GameRescheduleItemDTO> _schedules;
@override List<GameRescheduleItemDTO> get schedules {
  if (_schedules is EqualUnmodifiableListView) return _schedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_schedules);
}


/// Create a copy of GameRescheduleBatchDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameRescheduleBatchDTOCopyWith<_GameRescheduleBatchDTO> get copyWith => __$GameRescheduleBatchDTOCopyWithImpl<_GameRescheduleBatchDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameRescheduleBatchDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameRescheduleBatchDTO&&const DeepCollectionEquality().equals(other._schedules, _schedules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_schedules));

@override
String toString() {
  return 'GameRescheduleBatchDTO(schedules: $schedules)';
}


}

/// @nodoc
abstract mixin class _$GameRescheduleBatchDTOCopyWith<$Res> implements $GameRescheduleBatchDTOCopyWith<$Res> {
  factory _$GameRescheduleBatchDTOCopyWith(_GameRescheduleBatchDTO value, $Res Function(_GameRescheduleBatchDTO) _then) = __$GameRescheduleBatchDTOCopyWithImpl;
@override @useResult
$Res call({
 List<GameRescheduleItemDTO> schedules
});




}
/// @nodoc
class __$GameRescheduleBatchDTOCopyWithImpl<$Res>
    implements _$GameRescheduleBatchDTOCopyWith<$Res> {
  __$GameRescheduleBatchDTOCopyWithImpl(this._self, this._then);

  final _GameRescheduleBatchDTO _self;
  final $Res Function(_GameRescheduleBatchDTO) _then;

/// Create a copy of GameRescheduleBatchDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schedules = null,}) {
  return _then(_GameRescheduleBatchDTO(
schedules: null == schedules ? _self._schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<GameRescheduleItemDTO>,
  ));
}


}

// dart format on
