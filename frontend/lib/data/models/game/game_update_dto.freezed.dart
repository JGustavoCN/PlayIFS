// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_update_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameUpdateDTO {

 String get dateTime;
/// Create a copy of GameUpdateDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameUpdateDTOCopyWith<GameUpdateDTO> get copyWith => _$GameUpdateDTOCopyWithImpl<GameUpdateDTO>(this as GameUpdateDTO, _$identity);

  /// Serializes this GameUpdateDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameUpdateDTO&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateTime);

@override
String toString() {
  return 'GameUpdateDTO(dateTime: $dateTime)';
}


}

/// @nodoc
abstract mixin class $GameUpdateDTOCopyWith<$Res>  {
  factory $GameUpdateDTOCopyWith(GameUpdateDTO value, $Res Function(GameUpdateDTO) _then) = _$GameUpdateDTOCopyWithImpl;
@useResult
$Res call({
 String dateTime
});




}
/// @nodoc
class _$GameUpdateDTOCopyWithImpl<$Res>
    implements $GameUpdateDTOCopyWith<$Res> {
  _$GameUpdateDTOCopyWithImpl(this._self, this._then);

  final GameUpdateDTO _self;
  final $Res Function(GameUpdateDTO) _then;

/// Create a copy of GameUpdateDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateTime = null,}) {
  return _then(_self.copyWith(
dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GameUpdateDTO].
extension GameUpdateDTOPatterns on GameUpdateDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameUpdateDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameUpdateDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameUpdateDTO value)  $default,){
final _that = this;
switch (_that) {
case _GameUpdateDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameUpdateDTO value)?  $default,){
final _that = this;
switch (_that) {
case _GameUpdateDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String dateTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameUpdateDTO() when $default != null:
return $default(_that.dateTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String dateTime)  $default,) {final _that = this;
switch (_that) {
case _GameUpdateDTO():
return $default(_that.dateTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String dateTime)?  $default,) {final _that = this;
switch (_that) {
case _GameUpdateDTO() when $default != null:
return $default(_that.dateTime);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
class _GameUpdateDTO implements GameUpdateDTO {
  const _GameUpdateDTO({required this.dateTime});
  factory _GameUpdateDTO.fromJson(Map<String, dynamic> json) => _$GameUpdateDTOFromJson(json);

@override final  String dateTime;

/// Create a copy of GameUpdateDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameUpdateDTOCopyWith<_GameUpdateDTO> get copyWith => __$GameUpdateDTOCopyWithImpl<_GameUpdateDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameUpdateDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameUpdateDTO&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateTime);

@override
String toString() {
  return 'GameUpdateDTO(dateTime: $dateTime)';
}


}

/// @nodoc
abstract mixin class _$GameUpdateDTOCopyWith<$Res> implements $GameUpdateDTOCopyWith<$Res> {
  factory _$GameUpdateDTOCopyWith(_GameUpdateDTO value, $Res Function(_GameUpdateDTO) _then) = __$GameUpdateDTOCopyWithImpl;
@override @useResult
$Res call({
 String dateTime
});




}
/// @nodoc
class __$GameUpdateDTOCopyWithImpl<$Res>
    implements _$GameUpdateDTOCopyWith<$Res> {
  __$GameUpdateDTOCopyWithImpl(this._self, this._then);

  final _GameUpdateDTO _self;
  final $Res Function(_GameUpdateDTO) _then;

/// Create a copy of GameUpdateDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateTime = null,}) {
  return _then(_GameUpdateDTO(
dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
