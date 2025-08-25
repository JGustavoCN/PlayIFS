// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TeamInput {

 String get name; int get competitionId; int get sportId; int get courseId; int get coachId; List<int> get athleteIds;
/// Create a copy of TeamInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamInputCopyWith<TeamInput> get copyWith => _$TeamInputCopyWithImpl<TeamInput>(this as TeamInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamInput&&(identical(other.name, name) || other.name == name)&&(identical(other.competitionId, competitionId) || other.competitionId == competitionId)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&const DeepCollectionEquality().equals(other.athleteIds, athleteIds));
}


@override
int get hashCode => Object.hash(runtimeType,name,competitionId,sportId,courseId,coachId,const DeepCollectionEquality().hash(athleteIds));

@override
String toString() {
  return 'TeamInput(name: $name, competitionId: $competitionId, sportId: $sportId, courseId: $courseId, coachId: $coachId, athleteIds: $athleteIds)';
}


}

/// @nodoc
abstract mixin class $TeamInputCopyWith<$Res>  {
  factory $TeamInputCopyWith(TeamInput value, $Res Function(TeamInput) _then) = _$TeamInputCopyWithImpl;
@useResult
$Res call({
 String name, int competitionId, int sportId, int courseId, int coachId, List<int> athleteIds
});




}
/// @nodoc
class _$TeamInputCopyWithImpl<$Res>
    implements $TeamInputCopyWith<$Res> {
  _$TeamInputCopyWithImpl(this._self, this._then);

  final TeamInput _self;
  final $Res Function(TeamInput) _then;

/// Create a copy of TeamInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? competitionId = null,Object? sportId = null,Object? courseId = null,Object? coachId = null,Object? athleteIds = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,competitionId: null == competitionId ? _self.competitionId : competitionId // ignore: cast_nullable_to_non_nullable
as int,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as int,athleteIds: null == athleteIds ? _self.athleteIds : athleteIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamInput].
extension TeamInputPatterns on TeamInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamInput value)  $default,){
final _that = this;
switch (_that) {
case _TeamInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamInput value)?  $default,){
final _that = this;
switch (_that) {
case _TeamInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int competitionId,  int sportId,  int courseId,  int coachId,  List<int> athleteIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamInput() when $default != null:
return $default(_that.name,_that.competitionId,_that.sportId,_that.courseId,_that.coachId,_that.athleteIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int competitionId,  int sportId,  int courseId,  int coachId,  List<int> athleteIds)  $default,) {final _that = this;
switch (_that) {
case _TeamInput():
return $default(_that.name,_that.competitionId,_that.sportId,_that.courseId,_that.coachId,_that.athleteIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int competitionId,  int sportId,  int courseId,  int coachId,  List<int> athleteIds)?  $default,) {final _that = this;
switch (_that) {
case _TeamInput() when $default != null:
return $default(_that.name,_that.competitionId,_that.sportId,_that.courseId,_that.coachId,_that.athleteIds);case _:
  return null;

}
}

}

/// @nodoc


class _TeamInput implements TeamInput {
  const _TeamInput({required this.name, required this.competitionId, required this.sportId, required this.courseId, required this.coachId, required final  List<int> athleteIds}): _athleteIds = athleteIds;
  

@override final  String name;
@override final  int competitionId;
@override final  int sportId;
@override final  int courseId;
@override final  int coachId;
 final  List<int> _athleteIds;
@override List<int> get athleteIds {
  if (_athleteIds is EqualUnmodifiableListView) return _athleteIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_athleteIds);
}


/// Create a copy of TeamInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamInputCopyWith<_TeamInput> get copyWith => __$TeamInputCopyWithImpl<_TeamInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamInput&&(identical(other.name, name) || other.name == name)&&(identical(other.competitionId, competitionId) || other.competitionId == competitionId)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&const DeepCollectionEquality().equals(other._athleteIds, _athleteIds));
}


@override
int get hashCode => Object.hash(runtimeType,name,competitionId,sportId,courseId,coachId,const DeepCollectionEquality().hash(_athleteIds));

@override
String toString() {
  return 'TeamInput(name: $name, competitionId: $competitionId, sportId: $sportId, courseId: $courseId, coachId: $coachId, athleteIds: $athleteIds)';
}


}

/// @nodoc
abstract mixin class _$TeamInputCopyWith<$Res> implements $TeamInputCopyWith<$Res> {
  factory _$TeamInputCopyWith(_TeamInput value, $Res Function(_TeamInput) _then) = __$TeamInputCopyWithImpl;
@override @useResult
$Res call({
 String name, int competitionId, int sportId, int courseId, int coachId, List<int> athleteIds
});




}
/// @nodoc
class __$TeamInputCopyWithImpl<$Res>
    implements _$TeamInputCopyWith<$Res> {
  __$TeamInputCopyWithImpl(this._self, this._then);

  final _TeamInput _self;
  final $Res Function(_TeamInput) _then;

/// Create a copy of TeamInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? competitionId = null,Object? sportId = null,Object? courseId = null,Object? coachId = null,Object? athleteIds = null,}) {
  return _then(_TeamInput(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,competitionId: null == competitionId ? _self.competitionId : competitionId // ignore: cast_nullable_to_non_nullable
as int,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as int,athleteIds: null == athleteIds ? _self._athleteIds : athleteIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
