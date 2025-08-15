// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'athlete_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AthleteSummary {

 int get id; String get registration; String get fullName;
/// Create a copy of AthleteSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AthleteSummaryCopyWith<AthleteSummary> get copyWith => _$AthleteSummaryCopyWithImpl<AthleteSummary>(this as AthleteSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AthleteSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}


@override
int get hashCode => Object.hash(runtimeType,id,registration,fullName);

@override
String toString() {
  return 'AthleteSummary(id: $id, registration: $registration, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class $AthleteSummaryCopyWith<$Res>  {
  factory $AthleteSummaryCopyWith(AthleteSummary value, $Res Function(AthleteSummary) _then) = _$AthleteSummaryCopyWithImpl;
@useResult
$Res call({
 int id, String registration, String fullName
});




}
/// @nodoc
class _$AthleteSummaryCopyWithImpl<$Res>
    implements $AthleteSummaryCopyWith<$Res> {
  _$AthleteSummaryCopyWithImpl(this._self, this._then);

  final AthleteSummary _self;
  final $Res Function(AthleteSummary) _then;

/// Create a copy of AthleteSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? registration = null,Object? fullName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AthleteSummary].
extension AthleteSummaryPatterns on AthleteSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AthleteSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AthleteSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AthleteSummary value)  $default,){
final _that = this;
switch (_that) {
case _AthleteSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AthleteSummary value)?  $default,){
final _that = this;
switch (_that) {
case _AthleteSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String registration,  String fullName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AthleteSummary() when $default != null:
return $default(_that.id,_that.registration,_that.fullName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String registration,  String fullName)  $default,) {final _that = this;
switch (_that) {
case _AthleteSummary():
return $default(_that.id,_that.registration,_that.fullName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String registration,  String fullName)?  $default,) {final _that = this;
switch (_that) {
case _AthleteSummary() when $default != null:
return $default(_that.id,_that.registration,_that.fullName);case _:
  return null;

}
}

}

/// @nodoc


class _AthleteSummary implements AthleteSummary {
  const _AthleteSummary({required this.id, required this.registration, required this.fullName});
  

@override final  int id;
@override final  String registration;
@override final  String fullName;

/// Create a copy of AthleteSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AthleteSummaryCopyWith<_AthleteSummary> get copyWith => __$AthleteSummaryCopyWithImpl<_AthleteSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AthleteSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}


@override
int get hashCode => Object.hash(runtimeType,id,registration,fullName);

@override
String toString() {
  return 'AthleteSummary(id: $id, registration: $registration, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class _$AthleteSummaryCopyWith<$Res> implements $AthleteSummaryCopyWith<$Res> {
  factory _$AthleteSummaryCopyWith(_AthleteSummary value, $Res Function(_AthleteSummary) _then) = __$AthleteSummaryCopyWithImpl;
@override @useResult
$Res call({
 int id, String registration, String fullName
});




}
/// @nodoc
class __$AthleteSummaryCopyWithImpl<$Res>
    implements _$AthleteSummaryCopyWith<$Res> {
  __$AthleteSummaryCopyWithImpl(this._self, this._then);

  final _AthleteSummary _self;
  final $Res Function(_AthleteSummary) _then;

/// Create a copy of AthleteSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? registration = null,Object? fullName = null,}) {
  return _then(_AthleteSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,registration: null == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
