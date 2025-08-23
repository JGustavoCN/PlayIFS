// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'designated_coach_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DesignatedCoachDetails {

 int get id; CompetitionSummary get competition; SportSummary get sport; CourseSummary get course; AthleteSummary get coach;
/// Create a copy of DesignatedCoachDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DesignatedCoachDetailsCopyWith<DesignatedCoachDetails> get copyWith => _$DesignatedCoachDetailsCopyWithImpl<DesignatedCoachDetails>(this as DesignatedCoachDetails, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DesignatedCoachDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.competition, competition) || other.competition == competition)&&(identical(other.sport, sport) || other.sport == sport)&&(identical(other.course, course) || other.course == course)&&(identical(other.coach, coach) || other.coach == coach));
}


@override
int get hashCode => Object.hash(runtimeType,id,competition,sport,course,coach);

@override
String toString() {
  return 'DesignatedCoachDetails(id: $id, competition: $competition, sport: $sport, course: $course, coach: $coach)';
}


}

/// @nodoc
abstract mixin class $DesignatedCoachDetailsCopyWith<$Res>  {
  factory $DesignatedCoachDetailsCopyWith(DesignatedCoachDetails value, $Res Function(DesignatedCoachDetails) _then) = _$DesignatedCoachDetailsCopyWithImpl;
@useResult
$Res call({
 int id, CompetitionSummary competition, SportSummary sport, CourseSummary course, AthleteSummary coach
});


$CompetitionSummaryCopyWith<$Res> get competition;$SportSummaryCopyWith<$Res> get sport;$CourseSummaryCopyWith<$Res> get course;$AthleteSummaryCopyWith<$Res> get coach;

}
/// @nodoc
class _$DesignatedCoachDetailsCopyWithImpl<$Res>
    implements $DesignatedCoachDetailsCopyWith<$Res> {
  _$DesignatedCoachDetailsCopyWithImpl(this._self, this._then);

  final DesignatedCoachDetails _self;
  final $Res Function(DesignatedCoachDetails) _then;

/// Create a copy of DesignatedCoachDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? competition = null,Object? sport = null,Object? course = null,Object? coach = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,competition: null == competition ? _self.competition : competition // ignore: cast_nullable_to_non_nullable
as CompetitionSummary,sport: null == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as SportSummary,course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as CourseSummary,coach: null == coach ? _self.coach : coach // ignore: cast_nullable_to_non_nullable
as AthleteSummary,
  ));
}
/// Create a copy of DesignatedCoachDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompetitionSummaryCopyWith<$Res> get competition {
  
  return $CompetitionSummaryCopyWith<$Res>(_self.competition, (value) {
    return _then(_self.copyWith(competition: value));
  });
}/// Create a copy of DesignatedCoachDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SportSummaryCopyWith<$Res> get sport {
  
  return $SportSummaryCopyWith<$Res>(_self.sport, (value) {
    return _then(_self.copyWith(sport: value));
  });
}/// Create a copy of DesignatedCoachDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseSummaryCopyWith<$Res> get course {
  
  return $CourseSummaryCopyWith<$Res>(_self.course, (value) {
    return _then(_self.copyWith(course: value));
  });
}/// Create a copy of DesignatedCoachDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteSummaryCopyWith<$Res> get coach {
  
  return $AthleteSummaryCopyWith<$Res>(_self.coach, (value) {
    return _then(_self.copyWith(coach: value));
  });
}
}


/// Adds pattern-matching-related methods to [DesignatedCoachDetails].
extension DesignatedCoachDetailsPatterns on DesignatedCoachDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DesignatedCoachDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DesignatedCoachDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DesignatedCoachDetails value)  $default,){
final _that = this;
switch (_that) {
case _DesignatedCoachDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DesignatedCoachDetails value)?  $default,){
final _that = this;
switch (_that) {
case _DesignatedCoachDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  CompetitionSummary competition,  SportSummary sport,  CourseSummary course,  AthleteSummary coach)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DesignatedCoachDetails() when $default != null:
return $default(_that.id,_that.competition,_that.sport,_that.course,_that.coach);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  CompetitionSummary competition,  SportSummary sport,  CourseSummary course,  AthleteSummary coach)  $default,) {final _that = this;
switch (_that) {
case _DesignatedCoachDetails():
return $default(_that.id,_that.competition,_that.sport,_that.course,_that.coach);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  CompetitionSummary competition,  SportSummary sport,  CourseSummary course,  AthleteSummary coach)?  $default,) {final _that = this;
switch (_that) {
case _DesignatedCoachDetails() when $default != null:
return $default(_that.id,_that.competition,_that.sport,_that.course,_that.coach);case _:
  return null;

}
}

}

/// @nodoc


class _DesignatedCoachDetails implements DesignatedCoachDetails {
  const _DesignatedCoachDetails({required this.id, required this.competition, required this.sport, required this.course, required this.coach});
  

@override final  int id;
@override final  CompetitionSummary competition;
@override final  SportSummary sport;
@override final  CourseSummary course;
@override final  AthleteSummary coach;

/// Create a copy of DesignatedCoachDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DesignatedCoachDetailsCopyWith<_DesignatedCoachDetails> get copyWith => __$DesignatedCoachDetailsCopyWithImpl<_DesignatedCoachDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DesignatedCoachDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.competition, competition) || other.competition == competition)&&(identical(other.sport, sport) || other.sport == sport)&&(identical(other.course, course) || other.course == course)&&(identical(other.coach, coach) || other.coach == coach));
}


@override
int get hashCode => Object.hash(runtimeType,id,competition,sport,course,coach);

@override
String toString() {
  return 'DesignatedCoachDetails(id: $id, competition: $competition, sport: $sport, course: $course, coach: $coach)';
}


}

/// @nodoc
abstract mixin class _$DesignatedCoachDetailsCopyWith<$Res> implements $DesignatedCoachDetailsCopyWith<$Res> {
  factory _$DesignatedCoachDetailsCopyWith(_DesignatedCoachDetails value, $Res Function(_DesignatedCoachDetails) _then) = __$DesignatedCoachDetailsCopyWithImpl;
@override @useResult
$Res call({
 int id, CompetitionSummary competition, SportSummary sport, CourseSummary course, AthleteSummary coach
});


@override $CompetitionSummaryCopyWith<$Res> get competition;@override $SportSummaryCopyWith<$Res> get sport;@override $CourseSummaryCopyWith<$Res> get course;@override $AthleteSummaryCopyWith<$Res> get coach;

}
/// @nodoc
class __$DesignatedCoachDetailsCopyWithImpl<$Res>
    implements _$DesignatedCoachDetailsCopyWith<$Res> {
  __$DesignatedCoachDetailsCopyWithImpl(this._self, this._then);

  final _DesignatedCoachDetails _self;
  final $Res Function(_DesignatedCoachDetails) _then;

/// Create a copy of DesignatedCoachDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? competition = null,Object? sport = null,Object? course = null,Object? coach = null,}) {
  return _then(_DesignatedCoachDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,competition: null == competition ? _self.competition : competition // ignore: cast_nullable_to_non_nullable
as CompetitionSummary,sport: null == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as SportSummary,course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as CourseSummary,coach: null == coach ? _self.coach : coach // ignore: cast_nullable_to_non_nullable
as AthleteSummary,
  ));
}

/// Create a copy of DesignatedCoachDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompetitionSummaryCopyWith<$Res> get competition {
  
  return $CompetitionSummaryCopyWith<$Res>(_self.competition, (value) {
    return _then(_self.copyWith(competition: value));
  });
}/// Create a copy of DesignatedCoachDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SportSummaryCopyWith<$Res> get sport {
  
  return $SportSummaryCopyWith<$Res>(_self.sport, (value) {
    return _then(_self.copyWith(sport: value));
  });
}/// Create a copy of DesignatedCoachDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseSummaryCopyWith<$Res> get course {
  
  return $CourseSummaryCopyWith<$Res>(_self.course, (value) {
    return _then(_self.copyWith(course: value));
  });
}/// Create a copy of DesignatedCoachDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteSummaryCopyWith<$Res> get coach {
  
  return $AthleteSummaryCopyWith<$Res>(_self.coach, (value) {
    return _then(_self.copyWith(coach: value));
  });
}
}

// dart format on
