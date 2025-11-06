// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameDetailsDTO {

 int get id; String? get dateTime; String get status; String get phase; TeamSummaryDTO? get teamA; TeamSummaryDTO? get teamB; int? get scoreTeamA; int? get scoreTeamB; String? get createdAt; String? get updatedAt;
/// Create a copy of GameDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameDetailsDTOCopyWith<GameDetailsDTO> get copyWith => _$GameDetailsDTOCopyWithImpl<GameDetailsDTO>(this as GameDetailsDTO, _$identity);

  /// Serializes this GameDetailsDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameDetailsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.teamA, teamA) || other.teamA == teamA)&&(identical(other.teamB, teamB) || other.teamB == teamB)&&(identical(other.scoreTeamA, scoreTeamA) || other.scoreTeamA == scoreTeamA)&&(identical(other.scoreTeamB, scoreTeamB) || other.scoreTeamB == scoreTeamB)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,dateTime,status,phase,teamA,teamB,scoreTeamA,scoreTeamB,createdAt,updatedAt);

@override
String toString() {
  return 'GameDetailsDTO(id: $id, dateTime: $dateTime, status: $status, phase: $phase, teamA: $teamA, teamB: $teamB, scoreTeamA: $scoreTeamA, scoreTeamB: $scoreTeamB, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $GameDetailsDTOCopyWith<$Res>  {
  factory $GameDetailsDTOCopyWith(GameDetailsDTO value, $Res Function(GameDetailsDTO) _then) = _$GameDetailsDTOCopyWithImpl;
@useResult
$Res call({
 int id, String? dateTime, String status, String phase, TeamSummaryDTO? teamA, TeamSummaryDTO? teamB, int? scoreTeamA, int? scoreTeamB, String? createdAt, String? updatedAt
});


$TeamSummaryDTOCopyWith<$Res>? get teamA;$TeamSummaryDTOCopyWith<$Res>? get teamB;

}
/// @nodoc
class _$GameDetailsDTOCopyWithImpl<$Res>
    implements $GameDetailsDTOCopyWith<$Res> {
  _$GameDetailsDTOCopyWithImpl(this._self, this._then);

  final GameDetailsDTO _self;
  final $Res Function(GameDetailsDTO) _then;

/// Create a copy of GameDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dateTime = freezed,Object? status = null,Object? phase = null,Object? teamA = freezed,Object? teamB = freezed,Object? scoreTeamA = freezed,Object? scoreTeamB = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dateTime: freezed == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as String,teamA: freezed == teamA ? _self.teamA : teamA // ignore: cast_nullable_to_non_nullable
as TeamSummaryDTO?,teamB: freezed == teamB ? _self.teamB : teamB // ignore: cast_nullable_to_non_nullable
as TeamSummaryDTO?,scoreTeamA: freezed == scoreTeamA ? _self.scoreTeamA : scoreTeamA // ignore: cast_nullable_to_non_nullable
as int?,scoreTeamB: freezed == scoreTeamB ? _self.scoreTeamB : scoreTeamB // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of GameDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamSummaryDTOCopyWith<$Res>? get teamA {
    if (_self.teamA == null) {
    return null;
  }

  return $TeamSummaryDTOCopyWith<$Res>(_self.teamA!, (value) {
    return _then(_self.copyWith(teamA: value));
  });
}/// Create a copy of GameDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamSummaryDTOCopyWith<$Res>? get teamB {
    if (_self.teamB == null) {
    return null;
  }

  return $TeamSummaryDTOCopyWith<$Res>(_self.teamB!, (value) {
    return _then(_self.copyWith(teamB: value));
  });
}
}


/// Adds pattern-matching-related methods to [GameDetailsDTO].
extension GameDetailsDTOPatterns on GameDetailsDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameDetailsDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameDetailsDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameDetailsDTO value)  $default,){
final _that = this;
switch (_that) {
case _GameDetailsDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameDetailsDTO value)?  $default,){
final _that = this;
switch (_that) {
case _GameDetailsDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? dateTime,  String status,  String phase,  TeamSummaryDTO? teamA,  TeamSummaryDTO? teamB,  int? scoreTeamA,  int? scoreTeamB,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameDetailsDTO() when $default != null:
return $default(_that.id,_that.dateTime,_that.status,_that.phase,_that.teamA,_that.teamB,_that.scoreTeamA,_that.scoreTeamB,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? dateTime,  String status,  String phase,  TeamSummaryDTO? teamA,  TeamSummaryDTO? teamB,  int? scoreTeamA,  int? scoreTeamB,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _GameDetailsDTO():
return $default(_that.id,_that.dateTime,_that.status,_that.phase,_that.teamA,_that.teamB,_that.scoreTeamA,_that.scoreTeamB,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? dateTime,  String status,  String phase,  TeamSummaryDTO? teamA,  TeamSummaryDTO? teamB,  int? scoreTeamA,  int? scoreTeamB,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _GameDetailsDTO() when $default != null:
return $default(_that.id,_that.dateTime,_that.status,_that.phase,_that.teamA,_that.teamB,_that.scoreTeamA,_that.scoreTeamB,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
class _GameDetailsDTO implements GameDetailsDTO {
  const _GameDetailsDTO({required this.id, this.dateTime, required this.status, required this.phase, this.teamA, this.teamB, this.scoreTeamA, this.scoreTeamB, this.createdAt, this.updatedAt});
  factory _GameDetailsDTO.fromJson(Map<String, dynamic> json) => _$GameDetailsDTOFromJson(json);

@override final  int id;
@override final  String? dateTime;
@override final  String status;
@override final  String phase;
@override final  TeamSummaryDTO? teamA;
@override final  TeamSummaryDTO? teamB;
@override final  int? scoreTeamA;
@override final  int? scoreTeamB;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of GameDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameDetailsDTOCopyWith<_GameDetailsDTO> get copyWith => __$GameDetailsDTOCopyWithImpl<_GameDetailsDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameDetailsDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameDetailsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.teamA, teamA) || other.teamA == teamA)&&(identical(other.teamB, teamB) || other.teamB == teamB)&&(identical(other.scoreTeamA, scoreTeamA) || other.scoreTeamA == scoreTeamA)&&(identical(other.scoreTeamB, scoreTeamB) || other.scoreTeamB == scoreTeamB)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,dateTime,status,phase,teamA,teamB,scoreTeamA,scoreTeamB,createdAt,updatedAt);

@override
String toString() {
  return 'GameDetailsDTO(id: $id, dateTime: $dateTime, status: $status, phase: $phase, teamA: $teamA, teamB: $teamB, scoreTeamA: $scoreTeamA, scoreTeamB: $scoreTeamB, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$GameDetailsDTOCopyWith<$Res> implements $GameDetailsDTOCopyWith<$Res> {
  factory _$GameDetailsDTOCopyWith(_GameDetailsDTO value, $Res Function(_GameDetailsDTO) _then) = __$GameDetailsDTOCopyWithImpl;
@override @useResult
$Res call({
 int id, String? dateTime, String status, String phase, TeamSummaryDTO? teamA, TeamSummaryDTO? teamB, int? scoreTeamA, int? scoreTeamB, String? createdAt, String? updatedAt
});


@override $TeamSummaryDTOCopyWith<$Res>? get teamA;@override $TeamSummaryDTOCopyWith<$Res>? get teamB;

}
/// @nodoc
class __$GameDetailsDTOCopyWithImpl<$Res>
    implements _$GameDetailsDTOCopyWith<$Res> {
  __$GameDetailsDTOCopyWithImpl(this._self, this._then);

  final _GameDetailsDTO _self;
  final $Res Function(_GameDetailsDTO) _then;

/// Create a copy of GameDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dateTime = freezed,Object? status = null,Object? phase = null,Object? teamA = freezed,Object? teamB = freezed,Object? scoreTeamA = freezed,Object? scoreTeamB = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_GameDetailsDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dateTime: freezed == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as String,teamA: freezed == teamA ? _self.teamA : teamA // ignore: cast_nullable_to_non_nullable
as TeamSummaryDTO?,teamB: freezed == teamB ? _self.teamB : teamB // ignore: cast_nullable_to_non_nullable
as TeamSummaryDTO?,scoreTeamA: freezed == scoreTeamA ? _self.scoreTeamA : scoreTeamA // ignore: cast_nullable_to_non_nullable
as int?,scoreTeamB: freezed == scoreTeamB ? _self.scoreTeamB : scoreTeamB // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of GameDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamSummaryDTOCopyWith<$Res>? get teamA {
    if (_self.teamA == null) {
    return null;
  }

  return $TeamSummaryDTOCopyWith<$Res>(_self.teamA!, (value) {
    return _then(_self.copyWith(teamA: value));
  });
}/// Create a copy of GameDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamSummaryDTOCopyWith<$Res>? get teamB {
    if (_self.teamB == null) {
    return null;
  }

  return $TeamSummaryDTOCopyWith<$Res>(_self.teamB!, (value) {
    return _then(_self.copyWith(teamB: value));
  });
}
}

// dart format on
