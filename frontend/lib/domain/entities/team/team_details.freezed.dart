// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TeamDetails {

 int get id; String get name;// ✅ CORREÇÃO: A entidade de domínio agora contém os dados detalhados.
 String get competitionName; int get competitionId; String get sportName; int get sportId; String get courseName; int get courseId; String get coachName; int get coachId; List<AthleteSummary> get athletes;
/// Create a copy of TeamDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamDetailsCopyWith<TeamDetails> get copyWith => _$TeamDetailsCopyWithImpl<TeamDetails>(this as TeamDetails, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.competitionName, competitionName) || other.competitionName == competitionName)&&(identical(other.competitionId, competitionId) || other.competitionId == competitionId)&&(identical(other.sportName, sportName) || other.sportName == sportName)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.coachName, coachName) || other.coachName == coachName)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&const DeepCollectionEquality().equals(other.athletes, athletes));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,competitionName,competitionId,sportName,sportId,courseName,courseId,coachName,coachId,const DeepCollectionEquality().hash(athletes));

@override
String toString() {
  return 'TeamDetails(id: $id, name: $name, competitionName: $competitionName, competitionId: $competitionId, sportName: $sportName, sportId: $sportId, courseName: $courseName, courseId: $courseId, coachName: $coachName, coachId: $coachId, athletes: $athletes)';
}


}

/// @nodoc
abstract mixin class $TeamDetailsCopyWith<$Res>  {
  factory $TeamDetailsCopyWith(TeamDetails value, $Res Function(TeamDetails) _then) = _$TeamDetailsCopyWithImpl;
@useResult
$Res call({
 int id, String name, String competitionName, int competitionId, String sportName, int sportId, String courseName, int courseId, String coachName, int coachId, List<AthleteSummary> athletes
});




}
/// @nodoc
class _$TeamDetailsCopyWithImpl<$Res>
    implements $TeamDetailsCopyWith<$Res> {
  _$TeamDetailsCopyWithImpl(this._self, this._then);

  final TeamDetails _self;
  final $Res Function(TeamDetails) _then;

/// Create a copy of TeamDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? competitionName = null,Object? competitionId = null,Object? sportName = null,Object? sportId = null,Object? courseName = null,Object? courseId = null,Object? coachName = null,Object? coachId = null,Object? athletes = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,competitionName: null == competitionName ? _self.competitionName : competitionName // ignore: cast_nullable_to_non_nullable
as String,competitionId: null == competitionId ? _self.competitionId : competitionId // ignore: cast_nullable_to_non_nullable
as int,sportName: null == sportName ? _self.sportName : sportName // ignore: cast_nullable_to_non_nullable
as String,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int,courseName: null == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,coachName: null == coachName ? _self.coachName : coachName // ignore: cast_nullable_to_non_nullable
as String,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as int,athletes: null == athletes ? _self.athletes : athletes // ignore: cast_nullable_to_non_nullable
as List<AthleteSummary>,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamDetails].
extension TeamDetailsPatterns on TeamDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamDetails value)  $default,){
final _that = this;
switch (_that) {
case _TeamDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamDetails value)?  $default,){
final _that = this;
switch (_that) {
case _TeamDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String competitionName,  int competitionId,  String sportName,  int sportId,  String courseName,  int courseId,  String coachName,  int coachId,  List<AthleteSummary> athletes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamDetails() when $default != null:
return $default(_that.id,_that.name,_that.competitionName,_that.competitionId,_that.sportName,_that.sportId,_that.courseName,_that.courseId,_that.coachName,_that.coachId,_that.athletes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String competitionName,  int competitionId,  String sportName,  int sportId,  String courseName,  int courseId,  String coachName,  int coachId,  List<AthleteSummary> athletes)  $default,) {final _that = this;
switch (_that) {
case _TeamDetails():
return $default(_that.id,_that.name,_that.competitionName,_that.competitionId,_that.sportName,_that.sportId,_that.courseName,_that.courseId,_that.coachName,_that.coachId,_that.athletes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String competitionName,  int competitionId,  String sportName,  int sportId,  String courseName,  int courseId,  String coachName,  int coachId,  List<AthleteSummary> athletes)?  $default,) {final _that = this;
switch (_that) {
case _TeamDetails() when $default != null:
return $default(_that.id,_that.name,_that.competitionName,_that.competitionId,_that.sportName,_that.sportId,_that.courseName,_that.courseId,_that.coachName,_that.coachId,_that.athletes);case _:
  return null;

}
}

}

/// @nodoc


class _TeamDetails implements TeamDetails {
  const _TeamDetails({required this.id, required this.name, required this.competitionName, required this.competitionId, required this.sportName, required this.sportId, required this.courseName, required this.courseId, required this.coachName, required this.coachId, required final  List<AthleteSummary> athletes}): _athletes = athletes;
  

@override final  int id;
@override final  String name;
// ✅ CORREÇÃO: A entidade de domínio agora contém os dados detalhados.
@override final  String competitionName;
@override final  int competitionId;
@override final  String sportName;
@override final  int sportId;
@override final  String courseName;
@override final  int courseId;
@override final  String coachName;
@override final  int coachId;
 final  List<AthleteSummary> _athletes;
@override List<AthleteSummary> get athletes {
  if (_athletes is EqualUnmodifiableListView) return _athletes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_athletes);
}


/// Create a copy of TeamDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamDetailsCopyWith<_TeamDetails> get copyWith => __$TeamDetailsCopyWithImpl<_TeamDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.competitionName, competitionName) || other.competitionName == competitionName)&&(identical(other.competitionId, competitionId) || other.competitionId == competitionId)&&(identical(other.sportName, sportName) || other.sportName == sportName)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.coachName, coachName) || other.coachName == coachName)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&const DeepCollectionEquality().equals(other._athletes, _athletes));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,competitionName,competitionId,sportName,sportId,courseName,courseId,coachName,coachId,const DeepCollectionEquality().hash(_athletes));

@override
String toString() {
  return 'TeamDetails(id: $id, name: $name, competitionName: $competitionName, competitionId: $competitionId, sportName: $sportName, sportId: $sportId, courseName: $courseName, courseId: $courseId, coachName: $coachName, coachId: $coachId, athletes: $athletes)';
}


}

/// @nodoc
abstract mixin class _$TeamDetailsCopyWith<$Res> implements $TeamDetailsCopyWith<$Res> {
  factory _$TeamDetailsCopyWith(_TeamDetails value, $Res Function(_TeamDetails) _then) = __$TeamDetailsCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String competitionName, int competitionId, String sportName, int sportId, String courseName, int courseId, String coachName, int coachId, List<AthleteSummary> athletes
});




}
/// @nodoc
class __$TeamDetailsCopyWithImpl<$Res>
    implements _$TeamDetailsCopyWith<$Res> {
  __$TeamDetailsCopyWithImpl(this._self, this._then);

  final _TeamDetails _self;
  final $Res Function(_TeamDetails) _then;

/// Create a copy of TeamDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? competitionName = null,Object? competitionId = null,Object? sportName = null,Object? sportId = null,Object? courseName = null,Object? courseId = null,Object? coachName = null,Object? coachId = null,Object? athletes = null,}) {
  return _then(_TeamDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,competitionName: null == competitionName ? _self.competitionName : competitionName // ignore: cast_nullable_to_non_nullable
as String,competitionId: null == competitionId ? _self.competitionId : competitionId // ignore: cast_nullable_to_non_nullable
as int,sportName: null == sportName ? _self.sportName : sportName // ignore: cast_nullable_to_non_nullable
as String,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int,courseName: null == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,coachName: null == coachName ? _self.coachName : coachName // ignore: cast_nullable_to_non_nullable
as String,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as int,athletes: null == athletes ? _self._athletes : athletes // ignore: cast_nullable_to_non_nullable
as List<AthleteSummary>,
  ));
}


}

// dart format on
