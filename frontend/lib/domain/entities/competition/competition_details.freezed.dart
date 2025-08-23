// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'competition_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompetitionDetails {

 int get id; String get name; String get level;
/// Create a copy of CompetitionDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompetitionDetailsCopyWith<CompetitionDetails> get copyWith => _$CompetitionDetailsCopyWithImpl<CompetitionDetails>(this as CompetitionDetails, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompetitionDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,level);

@override
String toString() {
  return 'CompetitionDetails(id: $id, name: $name, level: $level)';
}


}

/// @nodoc
abstract mixin class $CompetitionDetailsCopyWith<$Res>  {
  factory $CompetitionDetailsCopyWith(CompetitionDetails value, $Res Function(CompetitionDetails) _then) = _$CompetitionDetailsCopyWithImpl;
@useResult
$Res call({
 int id, String name, String level
});




}
/// @nodoc
class _$CompetitionDetailsCopyWithImpl<$Res>
    implements $CompetitionDetailsCopyWith<$Res> {
  _$CompetitionDetailsCopyWithImpl(this._self, this._then);

  final CompetitionDetails _self;
  final $Res Function(CompetitionDetails) _then;

/// Create a copy of CompetitionDetails
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


/// Adds pattern-matching-related methods to [CompetitionDetails].
extension CompetitionDetailsPatterns on CompetitionDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompetitionDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompetitionDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompetitionDetails value)  $default,){
final _that = this;
switch (_that) {
case _CompetitionDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompetitionDetails value)?  $default,){
final _that = this;
switch (_that) {
case _CompetitionDetails() when $default != null:
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
case _CompetitionDetails() when $default != null:
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
case _CompetitionDetails():
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
case _CompetitionDetails() when $default != null:
return $default(_that.id,_that.name,_that.level);case _:
  return null;

}
}

}

/// @nodoc


class _CompetitionDetails implements CompetitionDetails {
  const _CompetitionDetails({required this.id, required this.name, required this.level});
  

@override final  int id;
@override final  String name;
@override final  String level;

/// Create a copy of CompetitionDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompetitionDetailsCopyWith<_CompetitionDetails> get copyWith => __$CompetitionDetailsCopyWithImpl<_CompetitionDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompetitionDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,level);

@override
String toString() {
  return 'CompetitionDetails(id: $id, name: $name, level: $level)';
}


}

/// @nodoc
abstract mixin class _$CompetitionDetailsCopyWith<$Res> implements $CompetitionDetailsCopyWith<$Res> {
  factory _$CompetitionDetailsCopyWith(_CompetitionDetails value, $Res Function(_CompetitionDetails) _then) = __$CompetitionDetailsCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String level
});




}
/// @nodoc
class __$CompetitionDetailsCopyWithImpl<$Res>
    implements _$CompetitionDetailsCopyWith<$Res> {
  __$CompetitionDetailsCopyWithImpl(this._self, this._then);

  final _CompetitionDetails _self;
  final $Res Function(_CompetitionDetails) _then;

/// Create a copy of CompetitionDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? level = null,}) {
  return _then(_CompetitionDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
