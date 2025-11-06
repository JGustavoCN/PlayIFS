// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_summary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameSummaryDTO {

 int get id; String? get dateTime; String get status; String get phase; String? get teamAName; String? get teamBName; String? get createdAt; String? get updatedAt;
/// Create a copy of GameSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameSummaryDTOCopyWith<GameSummaryDTO> get copyWith => _$GameSummaryDTOCopyWithImpl<GameSummaryDTO>(this as GameSummaryDTO, _$identity);

  /// Serializes this GameSummaryDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameSummaryDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.teamAName, teamAName) || other.teamAName == teamAName)&&(identical(other.teamBName, teamBName) || other.teamBName == teamBName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,dateTime,status,phase,teamAName,teamBName,createdAt,updatedAt);

@override
String toString() {
  return 'GameSummaryDTO(id: $id, dateTime: $dateTime, status: $status, phase: $phase, teamAName: $teamAName, teamBName: $teamBName, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $GameSummaryDTOCopyWith<$Res>  {
  factory $GameSummaryDTOCopyWith(GameSummaryDTO value, $Res Function(GameSummaryDTO) _then) = _$GameSummaryDTOCopyWithImpl;
@useResult
$Res call({
 int id, String? dateTime, String status, String phase, String? teamAName, String? teamBName, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$GameSummaryDTOCopyWithImpl<$Res>
    implements $GameSummaryDTOCopyWith<$Res> {
  _$GameSummaryDTOCopyWithImpl(this._self, this._then);

  final GameSummaryDTO _self;
  final $Res Function(GameSummaryDTO) _then;

/// Create a copy of GameSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dateTime = freezed,Object? status = null,Object? phase = null,Object? teamAName = freezed,Object? teamBName = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dateTime: freezed == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as String,teamAName: freezed == teamAName ? _self.teamAName : teamAName // ignore: cast_nullable_to_non_nullable
as String?,teamBName: freezed == teamBName ? _self.teamBName : teamBName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GameSummaryDTO].
extension GameSummaryDTOPatterns on GameSummaryDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameSummaryDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameSummaryDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameSummaryDTO value)  $default,){
final _that = this;
switch (_that) {
case _GameSummaryDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameSummaryDTO value)?  $default,){
final _that = this;
switch (_that) {
case _GameSummaryDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? dateTime,  String status,  String phase,  String? teamAName,  String? teamBName,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameSummaryDTO() when $default != null:
return $default(_that.id,_that.dateTime,_that.status,_that.phase,_that.teamAName,_that.teamBName,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? dateTime,  String status,  String phase,  String? teamAName,  String? teamBName,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _GameSummaryDTO():
return $default(_that.id,_that.dateTime,_that.status,_that.phase,_that.teamAName,_that.teamBName,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? dateTime,  String status,  String phase,  String? teamAName,  String? teamBName,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _GameSummaryDTO() when $default != null:
return $default(_that.id,_that.dateTime,_that.status,_that.phase,_that.teamAName,_that.teamBName,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
class _GameSummaryDTO implements GameSummaryDTO {
  const _GameSummaryDTO({required this.id, this.dateTime, required this.status, required this.phase, this.teamAName, this.teamBName, this.createdAt, this.updatedAt});
  factory _GameSummaryDTO.fromJson(Map<String, dynamic> json) => _$GameSummaryDTOFromJson(json);

@override final  int id;
@override final  String? dateTime;
@override final  String status;
@override final  String phase;
@override final  String? teamAName;
@override final  String? teamBName;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of GameSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameSummaryDTOCopyWith<_GameSummaryDTO> get copyWith => __$GameSummaryDTOCopyWithImpl<_GameSummaryDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameSummaryDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameSummaryDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.teamAName, teamAName) || other.teamAName == teamAName)&&(identical(other.teamBName, teamBName) || other.teamBName == teamBName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,dateTime,status,phase,teamAName,teamBName,createdAt,updatedAt);

@override
String toString() {
  return 'GameSummaryDTO(id: $id, dateTime: $dateTime, status: $status, phase: $phase, teamAName: $teamAName, teamBName: $teamBName, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$GameSummaryDTOCopyWith<$Res> implements $GameSummaryDTOCopyWith<$Res> {
  factory _$GameSummaryDTOCopyWith(_GameSummaryDTO value, $Res Function(_GameSummaryDTO) _then) = __$GameSummaryDTOCopyWithImpl;
@override @useResult
$Res call({
 int id, String? dateTime, String status, String phase, String? teamAName, String? teamBName, String? createdAt, String? updatedAt
});




}
/// @nodoc
class __$GameSummaryDTOCopyWithImpl<$Res>
    implements _$GameSummaryDTOCopyWith<$Res> {
  __$GameSummaryDTOCopyWithImpl(this._self, this._then);

  final _GameSummaryDTO _self;
  final $Res Function(_GameSummaryDTO) _then;

/// Create a copy of GameSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dateTime = freezed,Object? status = null,Object? phase = null,Object? teamAName = freezed,Object? teamBName = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_GameSummaryDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dateTime: freezed == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as String,teamAName: freezed == teamAName ? _self.teamAName : teamAName // ignore: cast_nullable_to_non_nullable
as String?,teamBName: freezed == teamBName ? _self.teamBName : teamBName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
