// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameDetails {

 int get id; TeamSummary? get teamA; TeamSummary? get teamB; int? get scoreTeamA; int? get scoreTeamB; DateTime? get dateTime; String get status; GamePhase get phase; String? get location; int? get teamAId; int? get teamBId; String? get nextGameAs;// 'TEAM_A' or 'TEAM_B'
 int? get nextGameId;
/// Create a copy of GameDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameDetailsCopyWith<GameDetails> get copyWith => _$GameDetailsCopyWithImpl<GameDetails>(this as GameDetails, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.teamA, teamA) || other.teamA == teamA)&&(identical(other.teamB, teamB) || other.teamB == teamB)&&(identical(other.scoreTeamA, scoreTeamA) || other.scoreTeamA == scoreTeamA)&&(identical(other.scoreTeamB, scoreTeamB) || other.scoreTeamB == scoreTeamB)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.location, location) || other.location == location)&&(identical(other.teamAId, teamAId) || other.teamAId == teamAId)&&(identical(other.teamBId, teamBId) || other.teamBId == teamBId)&&(identical(other.nextGameAs, nextGameAs) || other.nextGameAs == nextGameAs)&&(identical(other.nextGameId, nextGameId) || other.nextGameId == nextGameId));
}


@override
int get hashCode => Object.hash(runtimeType,id,teamA,teamB,scoreTeamA,scoreTeamB,dateTime,status,phase,location,teamAId,teamBId,nextGameAs,nextGameId);

@override
String toString() {
  return 'GameDetails(id: $id, teamA: $teamA, teamB: $teamB, scoreTeamA: $scoreTeamA, scoreTeamB: $scoreTeamB, dateTime: $dateTime, status: $status, phase: $phase, location: $location, teamAId: $teamAId, teamBId: $teamBId, nextGameAs: $nextGameAs, nextGameId: $nextGameId)';
}


}

/// @nodoc
abstract mixin class $GameDetailsCopyWith<$Res>  {
  factory $GameDetailsCopyWith(GameDetails value, $Res Function(GameDetails) _then) = _$GameDetailsCopyWithImpl;
@useResult
$Res call({
 int id, TeamSummary? teamA, TeamSummary? teamB, int? scoreTeamA, int? scoreTeamB, DateTime? dateTime, String status, GamePhase phase, String? location, int? teamAId, int? teamBId, String? nextGameAs, int? nextGameId
});


$TeamSummaryCopyWith<$Res>? get teamA;$TeamSummaryCopyWith<$Res>? get teamB;

}
/// @nodoc
class _$GameDetailsCopyWithImpl<$Res>
    implements $GameDetailsCopyWith<$Res> {
  _$GameDetailsCopyWithImpl(this._self, this._then);

  final GameDetails _self;
  final $Res Function(GameDetails) _then;

/// Create a copy of GameDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? teamA = freezed,Object? teamB = freezed,Object? scoreTeamA = freezed,Object? scoreTeamB = freezed,Object? dateTime = freezed,Object? status = null,Object? phase = null,Object? location = freezed,Object? teamAId = freezed,Object? teamBId = freezed,Object? nextGameAs = freezed,Object? nextGameId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,teamA: freezed == teamA ? _self.teamA : teamA // ignore: cast_nullable_to_non_nullable
as TeamSummary?,teamB: freezed == teamB ? _self.teamB : teamB // ignore: cast_nullable_to_non_nullable
as TeamSummary?,scoreTeamA: freezed == scoreTeamA ? _self.scoreTeamA : scoreTeamA // ignore: cast_nullable_to_non_nullable
as int?,scoreTeamB: freezed == scoreTeamB ? _self.scoreTeamB : scoreTeamB // ignore: cast_nullable_to_non_nullable
as int?,dateTime: freezed == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as GamePhase,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,teamAId: freezed == teamAId ? _self.teamAId : teamAId // ignore: cast_nullable_to_non_nullable
as int?,teamBId: freezed == teamBId ? _self.teamBId : teamBId // ignore: cast_nullable_to_non_nullable
as int?,nextGameAs: freezed == nextGameAs ? _self.nextGameAs : nextGameAs // ignore: cast_nullable_to_non_nullable
as String?,nextGameId: freezed == nextGameId ? _self.nextGameId : nextGameId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of GameDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamSummaryCopyWith<$Res>? get teamA {
    if (_self.teamA == null) {
    return null;
  }

  return $TeamSummaryCopyWith<$Res>(_self.teamA!, (value) {
    return _then(_self.copyWith(teamA: value));
  });
}/// Create a copy of GameDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamSummaryCopyWith<$Res>? get teamB {
    if (_self.teamB == null) {
    return null;
  }

  return $TeamSummaryCopyWith<$Res>(_self.teamB!, (value) {
    return _then(_self.copyWith(teamB: value));
  });
}
}


/// Adds pattern-matching-related methods to [GameDetails].
extension GameDetailsPatterns on GameDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameDetails value)  $default,){
final _that = this;
switch (_that) {
case _GameDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameDetails value)?  $default,){
final _that = this;
switch (_that) {
case _GameDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  TeamSummary? teamA,  TeamSummary? teamB,  int? scoreTeamA,  int? scoreTeamB,  DateTime? dateTime,  String status,  GamePhase phase,  String? location,  int? teamAId,  int? teamBId,  String? nextGameAs,  int? nextGameId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameDetails() when $default != null:
return $default(_that.id,_that.teamA,_that.teamB,_that.scoreTeamA,_that.scoreTeamB,_that.dateTime,_that.status,_that.phase,_that.location,_that.teamAId,_that.teamBId,_that.nextGameAs,_that.nextGameId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  TeamSummary? teamA,  TeamSummary? teamB,  int? scoreTeamA,  int? scoreTeamB,  DateTime? dateTime,  String status,  GamePhase phase,  String? location,  int? teamAId,  int? teamBId,  String? nextGameAs,  int? nextGameId)  $default,) {final _that = this;
switch (_that) {
case _GameDetails():
return $default(_that.id,_that.teamA,_that.teamB,_that.scoreTeamA,_that.scoreTeamB,_that.dateTime,_that.status,_that.phase,_that.location,_that.teamAId,_that.teamBId,_that.nextGameAs,_that.nextGameId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  TeamSummary? teamA,  TeamSummary? teamB,  int? scoreTeamA,  int? scoreTeamB,  DateTime? dateTime,  String status,  GamePhase phase,  String? location,  int? teamAId,  int? teamBId,  String? nextGameAs,  int? nextGameId)?  $default,) {final _that = this;
switch (_that) {
case _GameDetails() when $default != null:
return $default(_that.id,_that.teamA,_that.teamB,_that.scoreTeamA,_that.scoreTeamB,_that.dateTime,_that.status,_that.phase,_that.location,_that.teamAId,_that.teamBId,_that.nextGameAs,_that.nextGameId);case _:
  return null;

}
}

}

/// @nodoc


class _GameDetails implements GameDetails {
  const _GameDetails({required this.id, this.teamA, this.teamB, this.scoreTeamA, this.scoreTeamB, required this.dateTime, required this.status, required this.phase, this.location, this.teamAId, this.teamBId, this.nextGameAs, this.nextGameId});
  

@override final  int id;
@override final  TeamSummary? teamA;
@override final  TeamSummary? teamB;
@override final  int? scoreTeamA;
@override final  int? scoreTeamB;
@override final  DateTime? dateTime;
@override final  String status;
@override final  GamePhase phase;
@override final  String? location;
@override final  int? teamAId;
@override final  int? teamBId;
@override final  String? nextGameAs;
// 'TEAM_A' or 'TEAM_B'
@override final  int? nextGameId;

/// Create a copy of GameDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameDetailsCopyWith<_GameDetails> get copyWith => __$GameDetailsCopyWithImpl<_GameDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.teamA, teamA) || other.teamA == teamA)&&(identical(other.teamB, teamB) || other.teamB == teamB)&&(identical(other.scoreTeamA, scoreTeamA) || other.scoreTeamA == scoreTeamA)&&(identical(other.scoreTeamB, scoreTeamB) || other.scoreTeamB == scoreTeamB)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.location, location) || other.location == location)&&(identical(other.teamAId, teamAId) || other.teamAId == teamAId)&&(identical(other.teamBId, teamBId) || other.teamBId == teamBId)&&(identical(other.nextGameAs, nextGameAs) || other.nextGameAs == nextGameAs)&&(identical(other.nextGameId, nextGameId) || other.nextGameId == nextGameId));
}


@override
int get hashCode => Object.hash(runtimeType,id,teamA,teamB,scoreTeamA,scoreTeamB,dateTime,status,phase,location,teamAId,teamBId,nextGameAs,nextGameId);

@override
String toString() {
  return 'GameDetails(id: $id, teamA: $teamA, teamB: $teamB, scoreTeamA: $scoreTeamA, scoreTeamB: $scoreTeamB, dateTime: $dateTime, status: $status, phase: $phase, location: $location, teamAId: $teamAId, teamBId: $teamBId, nextGameAs: $nextGameAs, nextGameId: $nextGameId)';
}


}

/// @nodoc
abstract mixin class _$GameDetailsCopyWith<$Res> implements $GameDetailsCopyWith<$Res> {
  factory _$GameDetailsCopyWith(_GameDetails value, $Res Function(_GameDetails) _then) = __$GameDetailsCopyWithImpl;
@override @useResult
$Res call({
 int id, TeamSummary? teamA, TeamSummary? teamB, int? scoreTeamA, int? scoreTeamB, DateTime? dateTime, String status, GamePhase phase, String? location, int? teamAId, int? teamBId, String? nextGameAs, int? nextGameId
});


@override $TeamSummaryCopyWith<$Res>? get teamA;@override $TeamSummaryCopyWith<$Res>? get teamB;

}
/// @nodoc
class __$GameDetailsCopyWithImpl<$Res>
    implements _$GameDetailsCopyWith<$Res> {
  __$GameDetailsCopyWithImpl(this._self, this._then);

  final _GameDetails _self;
  final $Res Function(_GameDetails) _then;

/// Create a copy of GameDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? teamA = freezed,Object? teamB = freezed,Object? scoreTeamA = freezed,Object? scoreTeamB = freezed,Object? dateTime = freezed,Object? status = null,Object? phase = null,Object? location = freezed,Object? teamAId = freezed,Object? teamBId = freezed,Object? nextGameAs = freezed,Object? nextGameId = freezed,}) {
  return _then(_GameDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,teamA: freezed == teamA ? _self.teamA : teamA // ignore: cast_nullable_to_non_nullable
as TeamSummary?,teamB: freezed == teamB ? _self.teamB : teamB // ignore: cast_nullable_to_non_nullable
as TeamSummary?,scoreTeamA: freezed == scoreTeamA ? _self.scoreTeamA : scoreTeamA // ignore: cast_nullable_to_non_nullable
as int?,scoreTeamB: freezed == scoreTeamB ? _self.scoreTeamB : scoreTeamB // ignore: cast_nullable_to_non_nullable
as int?,dateTime: freezed == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as GamePhase,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,teamAId: freezed == teamAId ? _self.teamAId : teamAId // ignore: cast_nullable_to_non_nullable
as int?,teamBId: freezed == teamBId ? _self.teamBId : teamBId // ignore: cast_nullable_to_non_nullable
as int?,nextGameAs: freezed == nextGameAs ? _self.nextGameAs : nextGameAs // ignore: cast_nullable_to_non_nullable
as String?,nextGameId: freezed == nextGameId ? _self.nextGameId : nextGameId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of GameDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamSummaryCopyWith<$Res>? get teamA {
    if (_self.teamA == null) {
    return null;
  }

  return $TeamSummaryCopyWith<$Res>(_self.teamA!, (value) {
    return _then(_self.copyWith(teamA: value));
  });
}/// Create a copy of GameDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamSummaryCopyWith<$Res>? get teamB {
    if (_self.teamB == null) {
    return null;
  }

  return $TeamSummaryCopyWith<$Res>(_self.teamB!, (value) {
    return _then(_self.copyWith(teamB: value));
  });
}
}

// dart format on
