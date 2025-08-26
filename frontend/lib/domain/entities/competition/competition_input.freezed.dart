// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'competition_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompetitionInput {

 String get name; String get level;// ADICIONADO: Lista de IDs de desportos associados.
 List<int> get sportIds;
/// Create a copy of CompetitionInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompetitionInputCopyWith<CompetitionInput> get copyWith => _$CompetitionInputCopyWithImpl<CompetitionInput>(this as CompetitionInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompetitionInput&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other.sportIds, sportIds));
}


@override
int get hashCode => Object.hash(runtimeType,name,level,const DeepCollectionEquality().hash(sportIds));

@override
String toString() {
  return 'CompetitionInput(name: $name, level: $level, sportIds: $sportIds)';
}


}

/// @nodoc
abstract mixin class $CompetitionInputCopyWith<$Res>  {
  factory $CompetitionInputCopyWith(CompetitionInput value, $Res Function(CompetitionInput) _then) = _$CompetitionInputCopyWithImpl;
@useResult
$Res call({
 String name, String level, List<int> sportIds
});




}
/// @nodoc
class _$CompetitionInputCopyWithImpl<$Res>
    implements $CompetitionInputCopyWith<$Res> {
  _$CompetitionInputCopyWithImpl(this._self, this._then);

  final CompetitionInput _self;
  final $Res Function(CompetitionInput) _then;

/// Create a copy of CompetitionInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? level = null,Object? sportIds = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,sportIds: null == sportIds ? _self.sportIds : sportIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [CompetitionInput].
extension CompetitionInputPatterns on CompetitionInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompetitionInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompetitionInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompetitionInput value)  $default,){
final _that = this;
switch (_that) {
case _CompetitionInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompetitionInput value)?  $default,){
final _that = this;
switch (_that) {
case _CompetitionInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String level,  List<int> sportIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompetitionInput() when $default != null:
return $default(_that.name,_that.level,_that.sportIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String level,  List<int> sportIds)  $default,) {final _that = this;
switch (_that) {
case _CompetitionInput():
return $default(_that.name,_that.level,_that.sportIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String level,  List<int> sportIds)?  $default,) {final _that = this;
switch (_that) {
case _CompetitionInput() when $default != null:
return $default(_that.name,_that.level,_that.sportIds);case _:
  return null;

}
}

}

/// @nodoc


class _CompetitionInput implements CompetitionInput {
  const _CompetitionInput({required this.name, required this.level, required final  List<int> sportIds}): _sportIds = sportIds;
  

@override final  String name;
@override final  String level;
// ADICIONADO: Lista de IDs de desportos associados.
 final  List<int> _sportIds;
// ADICIONADO: Lista de IDs de desportos associados.
@override List<int> get sportIds {
  if (_sportIds is EqualUnmodifiableListView) return _sportIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sportIds);
}


/// Create a copy of CompetitionInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompetitionInputCopyWith<_CompetitionInput> get copyWith => __$CompetitionInputCopyWithImpl<_CompetitionInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompetitionInput&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other._sportIds, _sportIds));
}


@override
int get hashCode => Object.hash(runtimeType,name,level,const DeepCollectionEquality().hash(_sportIds));

@override
String toString() {
  return 'CompetitionInput(name: $name, level: $level, sportIds: $sportIds)';
}


}

/// @nodoc
abstract mixin class _$CompetitionInputCopyWith<$Res> implements $CompetitionInputCopyWith<$Res> {
  factory _$CompetitionInputCopyWith(_CompetitionInput value, $Res Function(_CompetitionInput) _then) = __$CompetitionInputCopyWithImpl;
@override @useResult
$Res call({
 String name, String level, List<int> sportIds
});




}
/// @nodoc
class __$CompetitionInputCopyWithImpl<$Res>
    implements _$CompetitionInputCopyWith<$Res> {
  __$CompetitionInputCopyWithImpl(this._self, this._then);

  final _CompetitionInput _self;
  final $Res Function(_CompetitionInput) _then;

/// Create a copy of CompetitionInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? level = null,Object? sportIds = null,}) {
  return _then(_CompetitionInput(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,sportIds: null == sportIds ? _self._sportIds : sportIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
