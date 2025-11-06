// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_stage_view_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroupStageViewDTO {

/// A lista de classificações de cada grupo.
 List<GroupStandingsReportDTO> get groups;/// ✅ NOVO: A lista de todos os jogos desta fase.
 List<GameSummaryDTO> get games;
/// Create a copy of GroupStageViewDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupStageViewDTOCopyWith<GroupStageViewDTO> get copyWith => _$GroupStageViewDTOCopyWithImpl<GroupStageViewDTO>(this as GroupStageViewDTO, _$identity);

  /// Serializes this GroupStageViewDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupStageViewDTO&&const DeepCollectionEquality().equals(other.groups, groups)&&const DeepCollectionEquality().equals(other.games, games));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(groups),const DeepCollectionEquality().hash(games));

@override
String toString() {
  return 'GroupStageViewDTO(groups: $groups, games: $games)';
}


}

/// @nodoc
abstract mixin class $GroupStageViewDTOCopyWith<$Res>  {
  factory $GroupStageViewDTOCopyWith(GroupStageViewDTO value, $Res Function(GroupStageViewDTO) _then) = _$GroupStageViewDTOCopyWithImpl;
@useResult
$Res call({
 List<GroupStandingsReportDTO> groups, List<GameSummaryDTO> games
});




}
/// @nodoc
class _$GroupStageViewDTOCopyWithImpl<$Res>
    implements $GroupStageViewDTOCopyWith<$Res> {
  _$GroupStageViewDTOCopyWithImpl(this._self, this._then);

  final GroupStageViewDTO _self;
  final $Res Function(GroupStageViewDTO) _then;

/// Create a copy of GroupStageViewDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groups = null,Object? games = null,}) {
  return _then(_self.copyWith(
groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<GroupStandingsReportDTO>,games: null == games ? _self.games : games // ignore: cast_nullable_to_non_nullable
as List<GameSummaryDTO>,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupStageViewDTO].
extension GroupStageViewDTOPatterns on GroupStageViewDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupStageViewDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupStageViewDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupStageViewDTO value)  $default,){
final _that = this;
switch (_that) {
case _GroupStageViewDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupStageViewDTO value)?  $default,){
final _that = this;
switch (_that) {
case _GroupStageViewDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GroupStandingsReportDTO> groups,  List<GameSummaryDTO> games)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupStageViewDTO() when $default != null:
return $default(_that.groups,_that.games);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GroupStandingsReportDTO> groups,  List<GameSummaryDTO> games)  $default,) {final _that = this;
switch (_that) {
case _GroupStageViewDTO():
return $default(_that.groups,_that.games);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GroupStandingsReportDTO> groups,  List<GameSummaryDTO> games)?  $default,) {final _that = this;
switch (_that) {
case _GroupStageViewDTO() when $default != null:
return $default(_that.groups,_that.games);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _GroupStageViewDTO implements GroupStageViewDTO {
  const _GroupStageViewDTO({required final  List<GroupStandingsReportDTO> groups, required final  List<GameSummaryDTO> games}): _groups = groups,_games = games;
  factory _GroupStageViewDTO.fromJson(Map<String, dynamic> json) => _$GroupStageViewDTOFromJson(json);

/// A lista de classificações de cada grupo.
 final  List<GroupStandingsReportDTO> _groups;
/// A lista de classificações de cada grupo.
@override List<GroupStandingsReportDTO> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}

/// ✅ NOVO: A lista de todos os jogos desta fase.
 final  List<GameSummaryDTO> _games;
/// ✅ NOVO: A lista de todos os jogos desta fase.
@override List<GameSummaryDTO> get games {
  if (_games is EqualUnmodifiableListView) return _games;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_games);
}


/// Create a copy of GroupStageViewDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupStageViewDTOCopyWith<_GroupStageViewDTO> get copyWith => __$GroupStageViewDTOCopyWithImpl<_GroupStageViewDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroupStageViewDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupStageViewDTO&&const DeepCollectionEquality().equals(other._groups, _groups)&&const DeepCollectionEquality().equals(other._games, _games));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_groups),const DeepCollectionEquality().hash(_games));

@override
String toString() {
  return 'GroupStageViewDTO(groups: $groups, games: $games)';
}


}

/// @nodoc
abstract mixin class _$GroupStageViewDTOCopyWith<$Res> implements $GroupStageViewDTOCopyWith<$Res> {
  factory _$GroupStageViewDTOCopyWith(_GroupStageViewDTO value, $Res Function(_GroupStageViewDTO) _then) = __$GroupStageViewDTOCopyWithImpl;
@override @useResult
$Res call({
 List<GroupStandingsReportDTO> groups, List<GameSummaryDTO> games
});




}
/// @nodoc
class __$GroupStageViewDTOCopyWithImpl<$Res>
    implements _$GroupStageViewDTOCopyWith<$Res> {
  __$GroupStageViewDTOCopyWithImpl(this._self, this._then);

  final _GroupStageViewDTO _self;
  final $Res Function(_GroupStageViewDTO) _then;

/// Create a copy of GroupStageViewDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groups = null,Object? games = null,}) {
  return _then(_GroupStageViewDTO(
groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<GroupStandingsReportDTO>,games: null == games ? _self._games : games // ignore: cast_nullable_to_non_nullable
as List<GameSummaryDTO>,
  ));
}


}

// dart format on
