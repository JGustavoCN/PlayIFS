// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_stage_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GroupStageView {

/// A lista de classificações de cada grupo.
 List<GroupStandingsReport> get groups;/// ✅ NOVO: A lista de todos os jogos desta fase.
 List<GameSummary> get games;
/// Create a copy of GroupStageView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupStageViewCopyWith<GroupStageView> get copyWith => _$GroupStageViewCopyWithImpl<GroupStageView>(this as GroupStageView, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupStageView&&const DeepCollectionEquality().equals(other.groups, groups)&&const DeepCollectionEquality().equals(other.games, games));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(groups),const DeepCollectionEquality().hash(games));

@override
String toString() {
  return 'GroupStageView(groups: $groups, games: $games)';
}


}

/// @nodoc
abstract mixin class $GroupStageViewCopyWith<$Res>  {
  factory $GroupStageViewCopyWith(GroupStageView value, $Res Function(GroupStageView) _then) = _$GroupStageViewCopyWithImpl;
@useResult
$Res call({
 List<GroupStandingsReport> groups, List<GameSummary> games
});




}
/// @nodoc
class _$GroupStageViewCopyWithImpl<$Res>
    implements $GroupStageViewCopyWith<$Res> {
  _$GroupStageViewCopyWithImpl(this._self, this._then);

  final GroupStageView _self;
  final $Res Function(GroupStageView) _then;

/// Create a copy of GroupStageView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groups = null,Object? games = null,}) {
  return _then(_self.copyWith(
groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<GroupStandingsReport>,games: null == games ? _self.games : games // ignore: cast_nullable_to_non_nullable
as List<GameSummary>,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupStageView].
extension GroupStageViewPatterns on GroupStageView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupStageView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupStageView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupStageView value)  $default,){
final _that = this;
switch (_that) {
case _GroupStageView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupStageView value)?  $default,){
final _that = this;
switch (_that) {
case _GroupStageView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GroupStandingsReport> groups,  List<GameSummary> games)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupStageView() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GroupStandingsReport> groups,  List<GameSummary> games)  $default,) {final _that = this;
switch (_that) {
case _GroupStageView():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GroupStandingsReport> groups,  List<GameSummary> games)?  $default,) {final _that = this;
switch (_that) {
case _GroupStageView() when $default != null:
return $default(_that.groups,_that.games);case _:
  return null;

}
}

}

/// @nodoc


class _GroupStageView implements GroupStageView {
  const _GroupStageView({required final  List<GroupStandingsReport> groups, required final  List<GameSummary> games}): _groups = groups,_games = games;
  

/// A lista de classificações de cada grupo.
 final  List<GroupStandingsReport> _groups;
/// A lista de classificações de cada grupo.
@override List<GroupStandingsReport> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}

/// ✅ NOVO: A lista de todos os jogos desta fase.
 final  List<GameSummary> _games;
/// ✅ NOVO: A lista de todos os jogos desta fase.
@override List<GameSummary> get games {
  if (_games is EqualUnmodifiableListView) return _games;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_games);
}


/// Create a copy of GroupStageView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupStageViewCopyWith<_GroupStageView> get copyWith => __$GroupStageViewCopyWithImpl<_GroupStageView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupStageView&&const DeepCollectionEquality().equals(other._groups, _groups)&&const DeepCollectionEquality().equals(other._games, _games));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_groups),const DeepCollectionEquality().hash(_games));

@override
String toString() {
  return 'GroupStageView(groups: $groups, games: $games)';
}


}

/// @nodoc
abstract mixin class _$GroupStageViewCopyWith<$Res> implements $GroupStageViewCopyWith<$Res> {
  factory _$GroupStageViewCopyWith(_GroupStageView value, $Res Function(_GroupStageView) _then) = __$GroupStageViewCopyWithImpl;
@override @useResult
$Res call({
 List<GroupStandingsReport> groups, List<GameSummary> games
});




}
/// @nodoc
class __$GroupStageViewCopyWithImpl<$Res>
    implements _$GroupStageViewCopyWith<$Res> {
  __$GroupStageViewCopyWithImpl(this._self, this._then);

  final _GroupStageView _self;
  final $Res Function(_GroupStageView) _then;

/// Create a copy of GroupStageView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groups = null,Object? games = null,}) {
  return _then(_GroupStageView(
groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<GroupStandingsReport>,games: null == games ? _self._games : games // ignore: cast_nullable_to_non_nullable
as List<GameSummary>,
  ));
}


}

// dart format on
