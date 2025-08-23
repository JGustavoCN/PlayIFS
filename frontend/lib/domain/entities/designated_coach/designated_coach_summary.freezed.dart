// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'designated_coach_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DesignatedCoachSummary {

 int get id; String get competitionName; String get sportName; String get courseName; String get athleteName;
/// Create a copy of DesignatedCoachSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DesignatedCoachSummaryCopyWith<DesignatedCoachSummary> get copyWith => _$DesignatedCoachSummaryCopyWithImpl<DesignatedCoachSummary>(this as DesignatedCoachSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DesignatedCoachSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.competitionName, competitionName) || other.competitionName == competitionName)&&(identical(other.sportName, sportName) || other.sportName == sportName)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.athleteName, athleteName) || other.athleteName == athleteName));
}


@override
int get hashCode => Object.hash(runtimeType,id,competitionName,sportName,courseName,athleteName);

@override
String toString() {
  return 'DesignatedCoachSummary(id: $id, competitionName: $competitionName, sportName: $sportName, courseName: $courseName, athleteName: $athleteName)';
}


}

/// @nodoc
abstract mixin class $DesignatedCoachSummaryCopyWith<$Res>  {
  factory $DesignatedCoachSummaryCopyWith(DesignatedCoachSummary value, $Res Function(DesignatedCoachSummary) _then) = _$DesignatedCoachSummaryCopyWithImpl;
@useResult
$Res call({
 int id, String competitionName, String sportName, String courseName, String athleteName
});




}
/// @nodoc
class _$DesignatedCoachSummaryCopyWithImpl<$Res>
    implements $DesignatedCoachSummaryCopyWith<$Res> {
  _$DesignatedCoachSummaryCopyWithImpl(this._self, this._then);

  final DesignatedCoachSummary _self;
  final $Res Function(DesignatedCoachSummary) _then;

/// Create a copy of DesignatedCoachSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? competitionName = null,Object? sportName = null,Object? courseName = null,Object? athleteName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,competitionName: null == competitionName ? _self.competitionName : competitionName // ignore: cast_nullable_to_non_nullable
as String,sportName: null == sportName ? _self.sportName : sportName // ignore: cast_nullable_to_non_nullable
as String,courseName: null == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String,athleteName: null == athleteName ? _self.athleteName : athleteName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DesignatedCoachSummary].
extension DesignatedCoachSummaryPatterns on DesignatedCoachSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DesignatedCoachSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DesignatedCoachSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DesignatedCoachSummary value)  $default,){
final _that = this;
switch (_that) {
case _DesignatedCoachSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DesignatedCoachSummary value)?  $default,){
final _that = this;
switch (_that) {
case _DesignatedCoachSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String competitionName,  String sportName,  String courseName,  String athleteName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DesignatedCoachSummary() when $default != null:
return $default(_that.id,_that.competitionName,_that.sportName,_that.courseName,_that.athleteName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String competitionName,  String sportName,  String courseName,  String athleteName)  $default,) {final _that = this;
switch (_that) {
case _DesignatedCoachSummary():
return $default(_that.id,_that.competitionName,_that.sportName,_that.courseName,_that.athleteName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String competitionName,  String sportName,  String courseName,  String athleteName)?  $default,) {final _that = this;
switch (_that) {
case _DesignatedCoachSummary() when $default != null:
return $default(_that.id,_that.competitionName,_that.sportName,_that.courseName,_that.athleteName);case _:
  return null;

}
}

}

/// @nodoc


class _DesignatedCoachSummary implements DesignatedCoachSummary {
  const _DesignatedCoachSummary({required this.id, required this.competitionName, required this.sportName, required this.courseName, required this.athleteName});
  

@override final  int id;
@override final  String competitionName;
@override final  String sportName;
@override final  String courseName;
@override final  String athleteName;

/// Create a copy of DesignatedCoachSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DesignatedCoachSummaryCopyWith<_DesignatedCoachSummary> get copyWith => __$DesignatedCoachSummaryCopyWithImpl<_DesignatedCoachSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DesignatedCoachSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.competitionName, competitionName) || other.competitionName == competitionName)&&(identical(other.sportName, sportName) || other.sportName == sportName)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.athleteName, athleteName) || other.athleteName == athleteName));
}


@override
int get hashCode => Object.hash(runtimeType,id,competitionName,sportName,courseName,athleteName);

@override
String toString() {
  return 'DesignatedCoachSummary(id: $id, competitionName: $competitionName, sportName: $sportName, courseName: $courseName, athleteName: $athleteName)';
}


}

/// @nodoc
abstract mixin class _$DesignatedCoachSummaryCopyWith<$Res> implements $DesignatedCoachSummaryCopyWith<$Res> {
  factory _$DesignatedCoachSummaryCopyWith(_DesignatedCoachSummary value, $Res Function(_DesignatedCoachSummary) _then) = __$DesignatedCoachSummaryCopyWithImpl;
@override @useResult
$Res call({
 int id, String competitionName, String sportName, String courseName, String athleteName
});




}
/// @nodoc
class __$DesignatedCoachSummaryCopyWithImpl<$Res>
    implements _$DesignatedCoachSummaryCopyWith<$Res> {
  __$DesignatedCoachSummaryCopyWithImpl(this._self, this._then);

  final _DesignatedCoachSummary _self;
  final $Res Function(_DesignatedCoachSummary) _then;

/// Create a copy of DesignatedCoachSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? competitionName = null,Object? sportName = null,Object? courseName = null,Object? athleteName = null,}) {
  return _then(_DesignatedCoachSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,competitionName: null == competitionName ? _self.competitionName : competitionName // ignore: cast_nullable_to_non_nullable
as String,sportName: null == sportName ? _self.sportName : sportName // ignore: cast_nullable_to_non_nullable
as String,courseName: null == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String,athleteName: null == athleteName ? _self.athleteName : athleteName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
