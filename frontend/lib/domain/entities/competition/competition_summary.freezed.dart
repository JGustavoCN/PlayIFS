// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'competition_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompetitionSummary {

 int get id; String get name; String get level;
/// Create a copy of CompetitionSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompetitionSummaryCopyWith<CompetitionSummary> get copyWith => _$CompetitionSummaryCopyWithImpl<CompetitionSummary>(this as CompetitionSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompetitionSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,level);

@override
String toString() {
  return 'CompetitionSummary(id: $id, name: $name, level: $level)';
}


}

/// @nodoc
abstract mixin class $CompetitionSummaryCopyWith<$Res>  {
  factory $CompetitionSummaryCopyWith(CompetitionSummary value, $Res Function(CompetitionSummary) _then) = _$CompetitionSummaryCopyWithImpl;
@useResult
$Res call({
 int id, String name, String level
});




}
/// @nodoc
class _$CompetitionSummaryCopyWithImpl<$Res>
    implements $CompetitionSummaryCopyWith<$Res> {
  _$CompetitionSummaryCopyWithImpl(this._self, this._then);

  final CompetitionSummary _self;
  final $Res Function(CompetitionSummary) _then;

/// Create a copy of CompetitionSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? level = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CompetitionSummary].
extension CompetitionSummaryPatterns on CompetitionSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompetitionSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompetitionSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompetitionSummary value)  $default,){
final _that = this;
switch (_that) {
case _CompetitionSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompetitionSummary value)?  $default,){
final _that = this;
switch (_that) {
case _CompetitionSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String level)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompetitionSummary() when $default != null:
return $default(_that.id,_that.name,_that.level);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String level)  $default,) {final _that = this;
switch (_that) {
case _CompetitionSummary():
return $default(_that.id,_that.name,_that.level);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String level)?  $default,) {final _that = this;
switch (_that) {
case _CompetitionSummary() when $default != null:
return $default(_that.id,_that.name,_that.level);case _:
  return null;

}
}

}

/// @nodoc


class _CompetitionSummary implements CompetitionSummary {
  const _CompetitionSummary({required this.id, required this.name, required this.level});
  

@override final  int id;
@override final  String name;
@override final  String level;

/// Create a copy of CompetitionSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompetitionSummaryCopyWith<_CompetitionSummary> get copyWith => __$CompetitionSummaryCopyWithImpl<_CompetitionSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompetitionSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,level);

@override
String toString() {
  return 'CompetitionSummary(id: $id, name: $name, level: $level)';
}


}

/// @nodoc
abstract mixin class _$CompetitionSummaryCopyWith<$Res> implements $CompetitionSummaryCopyWith<$Res> {
  factory _$CompetitionSummaryCopyWith(_CompetitionSummary value, $Res Function(_CompetitionSummary) _then) = __$CompetitionSummaryCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String level
});




}
/// @nodoc
class __$CompetitionSummaryCopyWithImpl<$Res>
    implements _$CompetitionSummaryCopyWith<$Res> {
  __$CompetitionSummaryCopyWithImpl(this._self, this._then);

  final _CompetitionSummary _self;
  final $Res Function(_CompetitionSummary) _then;

/// Create a copy of CompetitionSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? level = null,}) {
  return _then(_CompetitionSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
