// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_standing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TeamStanding {

 int get teamId; String get teamName; int get points; int get wins; int get goalsFor; int get goalsAgainst; int get goalDifference;// CORREÇÃO: Campos que podem não vir da API agora são nuláveis.
 int? get gamesPlayed; int? get draws; int? get losses;
/// Create a copy of TeamStanding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamStandingCopyWith<TeamStanding> get copyWith => _$TeamStandingCopyWithImpl<TeamStanding>(this as TeamStanding, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamStanding&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.teamName, teamName) || other.teamName == teamName)&&(identical(other.points, points) || other.points == points)&&(identical(other.wins, wins) || other.wins == wins)&&(identical(other.goalsFor, goalsFor) || other.goalsFor == goalsFor)&&(identical(other.goalsAgainst, goalsAgainst) || other.goalsAgainst == goalsAgainst)&&(identical(other.goalDifference, goalDifference) || other.goalDifference == goalDifference)&&(identical(other.gamesPlayed, gamesPlayed) || other.gamesPlayed == gamesPlayed)&&(identical(other.draws, draws) || other.draws == draws)&&(identical(other.losses, losses) || other.losses == losses));
}


@override
int get hashCode => Object.hash(runtimeType,teamId,teamName,points,wins,goalsFor,goalsAgainst,goalDifference,gamesPlayed,draws,losses);

@override
String toString() {
  return 'TeamStanding(teamId: $teamId, teamName: $teamName, points: $points, wins: $wins, goalsFor: $goalsFor, goalsAgainst: $goalsAgainst, goalDifference: $goalDifference, gamesPlayed: $gamesPlayed, draws: $draws, losses: $losses)';
}


}

/// @nodoc
abstract mixin class $TeamStandingCopyWith<$Res>  {
  factory $TeamStandingCopyWith(TeamStanding value, $Res Function(TeamStanding) _then) = _$TeamStandingCopyWithImpl;
@useResult
$Res call({
 int teamId, String teamName, int points, int wins, int goalsFor, int goalsAgainst, int goalDifference, int? gamesPlayed, int? draws, int? losses
});




}
/// @nodoc
class _$TeamStandingCopyWithImpl<$Res>
    implements $TeamStandingCopyWith<$Res> {
  _$TeamStandingCopyWithImpl(this._self, this._then);

  final TeamStanding _self;
  final $Res Function(TeamStanding) _then;

/// Create a copy of TeamStanding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? teamId = null,Object? teamName = null,Object? points = null,Object? wins = null,Object? goalsFor = null,Object? goalsAgainst = null,Object? goalDifference = null,Object? gamesPlayed = freezed,Object? draws = freezed,Object? losses = freezed,}) {
  return _then(_self.copyWith(
teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as int,teamName: null == teamName ? _self.teamName : teamName // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,goalsFor: null == goalsFor ? _self.goalsFor : goalsFor // ignore: cast_nullable_to_non_nullable
as int,goalsAgainst: null == goalsAgainst ? _self.goalsAgainst : goalsAgainst // ignore: cast_nullable_to_non_nullable
as int,goalDifference: null == goalDifference ? _self.goalDifference : goalDifference // ignore: cast_nullable_to_non_nullable
as int,gamesPlayed: freezed == gamesPlayed ? _self.gamesPlayed : gamesPlayed // ignore: cast_nullable_to_non_nullable
as int?,draws: freezed == draws ? _self.draws : draws // ignore: cast_nullable_to_non_nullable
as int?,losses: freezed == losses ? _self.losses : losses // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamStanding].
extension TeamStandingPatterns on TeamStanding {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamStanding value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamStanding() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamStanding value)  $default,){
final _that = this;
switch (_that) {
case _TeamStanding():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamStanding value)?  $default,){
final _that = this;
switch (_that) {
case _TeamStanding() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int teamId,  String teamName,  int points,  int wins,  int goalsFor,  int goalsAgainst,  int goalDifference,  int? gamesPlayed,  int? draws,  int? losses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamStanding() when $default != null:
return $default(_that.teamId,_that.teamName,_that.points,_that.wins,_that.goalsFor,_that.goalsAgainst,_that.goalDifference,_that.gamesPlayed,_that.draws,_that.losses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int teamId,  String teamName,  int points,  int wins,  int goalsFor,  int goalsAgainst,  int goalDifference,  int? gamesPlayed,  int? draws,  int? losses)  $default,) {final _that = this;
switch (_that) {
case _TeamStanding():
return $default(_that.teamId,_that.teamName,_that.points,_that.wins,_that.goalsFor,_that.goalsAgainst,_that.goalDifference,_that.gamesPlayed,_that.draws,_that.losses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int teamId,  String teamName,  int points,  int wins,  int goalsFor,  int goalsAgainst,  int goalDifference,  int? gamesPlayed,  int? draws,  int? losses)?  $default,) {final _that = this;
switch (_that) {
case _TeamStanding() when $default != null:
return $default(_that.teamId,_that.teamName,_that.points,_that.wins,_that.goalsFor,_that.goalsAgainst,_that.goalDifference,_that.gamesPlayed,_that.draws,_that.losses);case _:
  return null;

}
}

}

/// @nodoc


class _TeamStanding implements TeamStanding {
  const _TeamStanding({required this.teamId, required this.teamName, required this.points, required this.wins, required this.goalsFor, required this.goalsAgainst, required this.goalDifference, this.gamesPlayed, this.draws, this.losses});
  

@override final  int teamId;
@override final  String teamName;
@override final  int points;
@override final  int wins;
@override final  int goalsFor;
@override final  int goalsAgainst;
@override final  int goalDifference;
// CORREÇÃO: Campos que podem não vir da API agora são nuláveis.
@override final  int? gamesPlayed;
@override final  int? draws;
@override final  int? losses;

/// Create a copy of TeamStanding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamStandingCopyWith<_TeamStanding> get copyWith => __$TeamStandingCopyWithImpl<_TeamStanding>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamStanding&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.teamName, teamName) || other.teamName == teamName)&&(identical(other.points, points) || other.points == points)&&(identical(other.wins, wins) || other.wins == wins)&&(identical(other.goalsFor, goalsFor) || other.goalsFor == goalsFor)&&(identical(other.goalsAgainst, goalsAgainst) || other.goalsAgainst == goalsAgainst)&&(identical(other.goalDifference, goalDifference) || other.goalDifference == goalDifference)&&(identical(other.gamesPlayed, gamesPlayed) || other.gamesPlayed == gamesPlayed)&&(identical(other.draws, draws) || other.draws == draws)&&(identical(other.losses, losses) || other.losses == losses));
}


@override
int get hashCode => Object.hash(runtimeType,teamId,teamName,points,wins,goalsFor,goalsAgainst,goalDifference,gamesPlayed,draws,losses);

@override
String toString() {
  return 'TeamStanding(teamId: $teamId, teamName: $teamName, points: $points, wins: $wins, goalsFor: $goalsFor, goalsAgainst: $goalsAgainst, goalDifference: $goalDifference, gamesPlayed: $gamesPlayed, draws: $draws, losses: $losses)';
}


}

/// @nodoc
abstract mixin class _$TeamStandingCopyWith<$Res> implements $TeamStandingCopyWith<$Res> {
  factory _$TeamStandingCopyWith(_TeamStanding value, $Res Function(_TeamStanding) _then) = __$TeamStandingCopyWithImpl;
@override @useResult
$Res call({
 int teamId, String teamName, int points, int wins, int goalsFor, int goalsAgainst, int goalDifference, int? gamesPlayed, int? draws, int? losses
});




}
/// @nodoc
class __$TeamStandingCopyWithImpl<$Res>
    implements _$TeamStandingCopyWith<$Res> {
  __$TeamStandingCopyWithImpl(this._self, this._then);

  final _TeamStanding _self;
  final $Res Function(_TeamStanding) _then;

/// Create a copy of TeamStanding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? teamId = null,Object? teamName = null,Object? points = null,Object? wins = null,Object? goalsFor = null,Object? goalsAgainst = null,Object? goalDifference = null,Object? gamesPlayed = freezed,Object? draws = freezed,Object? losses = freezed,}) {
  return _then(_TeamStanding(
teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as int,teamName: null == teamName ? _self.teamName : teamName // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,goalsFor: null == goalsFor ? _self.goalsFor : goalsFor // ignore: cast_nullable_to_non_nullable
as int,goalsAgainst: null == goalsAgainst ? _self.goalsAgainst : goalsAgainst // ignore: cast_nullable_to_non_nullable
as int,goalDifference: null == goalDifference ? _self.goalDifference : goalDifference // ignore: cast_nullable_to_non_nullable
as int,gamesPlayed: freezed == gamesPlayed ? _self.gamesPlayed : gamesPlayed // ignore: cast_nullable_to_non_nullable
as int?,draws: freezed == draws ? _self.draws : draws // ignore: cast_nullable_to_non_nullable
as int?,losses: freezed == losses ? _self.losses : losses // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
