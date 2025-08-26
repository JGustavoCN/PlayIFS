// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_standings_report_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroupStandingsReportDTO {

// Java Long maps to int in Dart/JSON
 int get groupId; String get groupName; List<TeamStandingDTO> get standings;
/// Create a copy of GroupStandingsReportDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupStandingsReportDTOCopyWith<GroupStandingsReportDTO> get copyWith => _$GroupStandingsReportDTOCopyWithImpl<GroupStandingsReportDTO>(this as GroupStandingsReportDTO, _$identity);

  /// Serializes this GroupStandingsReportDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupStandingsReportDTO&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&const DeepCollectionEquality().equals(other.standings, standings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,groupName,const DeepCollectionEquality().hash(standings));

@override
String toString() {
  return 'GroupStandingsReportDTO(groupId: $groupId, groupName: $groupName, standings: $standings)';
}


}

/// @nodoc
abstract mixin class $GroupStandingsReportDTOCopyWith<$Res>  {
  factory $GroupStandingsReportDTOCopyWith(GroupStandingsReportDTO value, $Res Function(GroupStandingsReportDTO) _then) = _$GroupStandingsReportDTOCopyWithImpl;
@useResult
$Res call({
 int groupId, String groupName, List<TeamStandingDTO> standings
});




}
/// @nodoc
class _$GroupStandingsReportDTOCopyWithImpl<$Res>
    implements $GroupStandingsReportDTOCopyWith<$Res> {
  _$GroupStandingsReportDTOCopyWithImpl(this._self, this._then);

  final GroupStandingsReportDTO _self;
  final $Res Function(GroupStandingsReportDTO) _then;

/// Create a copy of GroupStandingsReportDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupId = null,Object? groupName = null,Object? standings = null,}) {
  return _then(_self.copyWith(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,standings: null == standings ? _self.standings : standings // ignore: cast_nullable_to_non_nullable
as List<TeamStandingDTO>,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupStandingsReportDTO].
extension GroupStandingsReportDTOPatterns on GroupStandingsReportDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupStandingsReportDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupStandingsReportDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupStandingsReportDTO value)  $default,){
final _that = this;
switch (_that) {
case _GroupStandingsReportDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupStandingsReportDTO value)?  $default,){
final _that = this;
switch (_that) {
case _GroupStandingsReportDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int groupId,  String groupName,  List<TeamStandingDTO> standings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupStandingsReportDTO() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int groupId,  String groupName,  List<TeamStandingDTO> standings)  $default,) {final _that = this;
switch (_that) {
case _GroupStandingsReportDTO():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int groupId,  String groupName,  List<TeamStandingDTO> standings)?  $default,) {final _that = this;
switch (_that) {
case _GroupStandingsReportDTO() when $default != null:
return $default(_that.groupId,_that.groupName,_that.standings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GroupStandingsReportDTO implements GroupStandingsReportDTO {
  const _GroupStandingsReportDTO({required this.groupId, required this.groupName, required final  List<TeamStandingDTO> standings}): _standings = standings;
  factory _GroupStandingsReportDTO.fromJson(Map<String, dynamic> json) => _$GroupStandingsReportDTOFromJson(json);

// Java Long maps to int in Dart/JSON
@override final  int groupId;
@override final  String groupName;
 final  List<TeamStandingDTO> _standings;
@override List<TeamStandingDTO> get standings {
  if (_standings is EqualUnmodifiableListView) return _standings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_standings);
}


/// Create a copy of GroupStandingsReportDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupStandingsReportDTOCopyWith<_GroupStandingsReportDTO> get copyWith => __$GroupStandingsReportDTOCopyWithImpl<_GroupStandingsReportDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroupStandingsReportDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupStandingsReportDTO&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&const DeepCollectionEquality().equals(other._standings, _standings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,groupName,const DeepCollectionEquality().hash(_standings));

@override
String toString() {
  return 'GroupStandingsReportDTO(groupId: $groupId, groupName: $groupName, standings: $standings)';
}


}

/// @nodoc
abstract mixin class _$GroupStandingsReportDTOCopyWith<$Res> implements $GroupStandingsReportDTOCopyWith<$Res> {
  factory _$GroupStandingsReportDTOCopyWith(_GroupStandingsReportDTO value, $Res Function(_GroupStandingsReportDTO) _then) = __$GroupStandingsReportDTOCopyWithImpl;
@override @useResult
$Res call({
 int groupId, String groupName, List<TeamStandingDTO> standings
});




}
/// @nodoc
class __$GroupStandingsReportDTOCopyWithImpl<$Res>
    implements _$GroupStandingsReportDTOCopyWith<$Res> {
  __$GroupStandingsReportDTOCopyWithImpl(this._self, this._then);

  final _GroupStandingsReportDTO _self;
  final $Res Function(_GroupStandingsReportDTO) _then;

/// Create a copy of GroupStandingsReportDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupId = null,Object? groupName = null,Object? standings = null,}) {
  return _then(_GroupStandingsReportDTO(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,standings: null == standings ? _self._standings : standings // ignore: cast_nullable_to_non_nullable
as List<TeamStandingDTO>,
  ));
}


}

// dart format on
