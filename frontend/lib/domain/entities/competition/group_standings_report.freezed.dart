// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_standings_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GroupStandingsReport {

 int get groupId; String get groupName; List<TeamStanding> get standings;
/// Create a copy of GroupStandingsReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupStandingsReportCopyWith<GroupStandingsReport> get copyWith => _$GroupStandingsReportCopyWithImpl<GroupStandingsReport>(this as GroupStandingsReport, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupStandingsReport&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&const DeepCollectionEquality().equals(other.standings, standings));
}


@override
int get hashCode => Object.hash(runtimeType,groupId,groupName,const DeepCollectionEquality().hash(standings));

@override
String toString() {
  return 'GroupStandingsReport(groupId: $groupId, groupName: $groupName, standings: $standings)';
}


}

/// @nodoc
abstract mixin class $GroupStandingsReportCopyWith<$Res>  {
  factory $GroupStandingsReportCopyWith(GroupStandingsReport value, $Res Function(GroupStandingsReport) _then) = _$GroupStandingsReportCopyWithImpl;
@useResult
$Res call({
 int groupId, String groupName, List<TeamStanding> standings
});




}
/// @nodoc
class _$GroupStandingsReportCopyWithImpl<$Res>
    implements $GroupStandingsReportCopyWith<$Res> {
  _$GroupStandingsReportCopyWithImpl(this._self, this._then);

  final GroupStandingsReport _self;
  final $Res Function(GroupStandingsReport) _then;

/// Create a copy of GroupStandingsReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupId = null,Object? groupName = null,Object? standings = null,}) {
  return _then(_self.copyWith(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,standings: null == standings ? _self.standings : standings // ignore: cast_nullable_to_non_nullable
as List<TeamStanding>,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupStandingsReport].
extension GroupStandingsReportPatterns on GroupStandingsReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupStandingsReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupStandingsReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupStandingsReport value)  $default,){
final _that = this;
switch (_that) {
case _GroupStandingsReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupStandingsReport value)?  $default,){
final _that = this;
switch (_that) {
case _GroupStandingsReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int groupId,  String groupName,  List<TeamStanding> standings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupStandingsReport() when $default != null:
return $default(_that.groupId,_that.groupName,_that.standings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int groupId,  String groupName,  List<TeamStanding> standings)  $default,) {final _that = this;
switch (_that) {
case _GroupStandingsReport():
return $default(_that.groupId,_that.groupName,_that.standings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int groupId,  String groupName,  List<TeamStanding> standings)?  $default,) {final _that = this;
switch (_that) {
case _GroupStandingsReport() when $default != null:
return $default(_that.groupId,_that.groupName,_that.standings);case _:
  return null;

}
}

}

/// @nodoc


class _GroupStandingsReport implements GroupStandingsReport {
  const _GroupStandingsReport({required this.groupId, required this.groupName, required final  List<TeamStanding> standings}): _standings = standings;
  

@override final  int groupId;
@override final  String groupName;
 final  List<TeamStanding> _standings;
@override List<TeamStanding> get standings {
  if (_standings is EqualUnmodifiableListView) return _standings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_standings);
}


/// Create a copy of GroupStandingsReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupStandingsReportCopyWith<_GroupStandingsReport> get copyWith => __$GroupStandingsReportCopyWithImpl<_GroupStandingsReport>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupStandingsReport&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&const DeepCollectionEquality().equals(other._standings, _standings));
}


@override
int get hashCode => Object.hash(runtimeType,groupId,groupName,const DeepCollectionEquality().hash(_standings));

@override
String toString() {
  return 'GroupStandingsReport(groupId: $groupId, groupName: $groupName, standings: $standings)';
}


}

/// @nodoc
abstract mixin class _$GroupStandingsReportCopyWith<$Res> implements $GroupStandingsReportCopyWith<$Res> {
  factory _$GroupStandingsReportCopyWith(_GroupStandingsReport value, $Res Function(_GroupStandingsReport) _then) = __$GroupStandingsReportCopyWithImpl;
@override @useResult
$Res call({
 int groupId, String groupName, List<TeamStanding> standings
});




}
/// @nodoc
class __$GroupStandingsReportCopyWithImpl<$Res>
    implements _$GroupStandingsReportCopyWith<$Res> {
  __$GroupStandingsReportCopyWithImpl(this._self, this._then);

  final _GroupStandingsReport _self;
  final $Res Function(_GroupStandingsReport) _then;

/// Create a copy of GroupStandingsReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupId = null,Object? groupName = null,Object? standings = null,}) {
  return _then(_GroupStandingsReport(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,standings: null == standings ? _self._standings : standings // ignore: cast_nullable_to_non_nullable
as List<TeamStanding>,
  ));
}


}

// dart format on
