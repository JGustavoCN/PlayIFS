// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameSummary {

 int get id; DateTime? get dateTime; GameStatus get status; GamePhase get phase; String? get teamAName; String? get teamBName; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of GameSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameSummaryCopyWith<GameSummary> get copyWith => _$GameSummaryCopyWithImpl<GameSummary>(this as GameSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.teamAName, teamAName) || other.teamAName == teamAName)&&(identical(other.teamBName, teamBName) || other.teamBName == teamBName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,dateTime,status,phase,teamAName,teamBName,createdAt,updatedAt);

@override
String toString() {
  return 'GameSummary(id: $id, dateTime: $dateTime, status: $status, phase: $phase, teamAName: $teamAName, teamBName: $teamBName, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $GameSummaryCopyWith<$Res>  {
  factory $GameSummaryCopyWith(GameSummary value, $Res Function(GameSummary) _then) = _$GameSummaryCopyWithImpl;
@useResult
$Res call({
 int id, DateTime? dateTime, GameStatus status, GamePhase phase, String? teamAName, String? teamBName, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$GameSummaryCopyWithImpl<$Res>
    implements $GameSummaryCopyWith<$Res> {
  _$GameSummaryCopyWithImpl(this._self, this._then);

  final GameSummary _self;
  final $Res Function(GameSummary) _then;

/// Create a copy of GameSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dateTime = freezed,Object? status = null,Object? phase = null,Object? teamAName = freezed,Object? teamBName = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dateTime: freezed == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GameStatus,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as GamePhase,teamAName: freezed == teamAName ? _self.teamAName : teamAName // ignore: cast_nullable_to_non_nullable
as String?,teamBName: freezed == teamBName ? _self.teamBName : teamBName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [GameSummary].
extension GameSummaryPatterns on GameSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameSummary value)  $default,){
final _that = this;
switch (_that) {
case _GameSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameSummary value)?  $default,){
final _that = this;
switch (_that) {
case _GameSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime? dateTime,  GameStatus status,  GamePhase phase,  String? teamAName,  String? teamBName,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameSummary() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime? dateTime,  GameStatus status,  GamePhase phase,  String? teamAName,  String? teamBName,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _GameSummary():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime? dateTime,  GameStatus status,  GamePhase phase,  String? teamAName,  String? teamBName,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _GameSummary() when $default != null:
return $default(_that.id,_that.dateTime,_that.status,_that.phase,_that.teamAName,_that.teamBName,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _GameSummary implements GameSummary {
  const _GameSummary({required this.id, this.dateTime, required this.status, required this.phase, this.teamAName, this.teamBName, this.createdAt, this.updatedAt});
  

@override final  int id;
@override final  DateTime? dateTime;
@override final  GameStatus status;
@override final  GamePhase phase;
@override final  String? teamAName;
@override final  String? teamBName;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of GameSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameSummaryCopyWith<_GameSummary> get copyWith => __$GameSummaryCopyWithImpl<_GameSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.teamAName, teamAName) || other.teamAName == teamAName)&&(identical(other.teamBName, teamBName) || other.teamBName == teamBName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,dateTime,status,phase,teamAName,teamBName,createdAt,updatedAt);

@override
String toString() {
  return 'GameSummary(id: $id, dateTime: $dateTime, status: $status, phase: $phase, teamAName: $teamAName, teamBName: $teamBName, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$GameSummaryCopyWith<$Res> implements $GameSummaryCopyWith<$Res> {
  factory _$GameSummaryCopyWith(_GameSummary value, $Res Function(_GameSummary) _then) = __$GameSummaryCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime? dateTime, GameStatus status, GamePhase phase, String? teamAName, String? teamBName, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$GameSummaryCopyWithImpl<$Res>
    implements _$GameSummaryCopyWith<$Res> {
  __$GameSummaryCopyWithImpl(this._self, this._then);

  final _GameSummary _self;
  final $Res Function(_GameSummary) _then;

/// Create a copy of GameSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dateTime = freezed,Object? status = null,Object? phase = null,Object? teamAName = freezed,Object? teamBName = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_GameSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dateTime: freezed == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GameStatus,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as GamePhase,teamAName: freezed == teamAName ? _self.teamAName : teamAName // ignore: cast_nullable_to_non_nullable
as String?,teamBName: freezed == teamBName ? _self.teamBName : teamBName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
