// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppConfig {

/// Lista de valores possíveis para o nível de um curso.
 List<String> get courseLevels;/// Lista de valores possíveis para a fase de um jogo.
 List<String> get gamePhases;/// Lista de valores possíveis para o status de um jogo.
 List<String> get gameStatuses;
/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigCopyWith<AppConfig> get copyWith => _$AppConfigCopyWithImpl<AppConfig>(this as AppConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfig&&const DeepCollectionEquality().equals(other.courseLevels, courseLevels)&&const DeepCollectionEquality().equals(other.gamePhases, gamePhases)&&const DeepCollectionEquality().equals(other.gameStatuses, gameStatuses));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(courseLevels),const DeepCollectionEquality().hash(gamePhases),const DeepCollectionEquality().hash(gameStatuses));

@override
String toString() {
  return 'AppConfig(courseLevels: $courseLevels, gamePhases: $gamePhases, gameStatuses: $gameStatuses)';
}


}

/// @nodoc
abstract mixin class $AppConfigCopyWith<$Res>  {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) _then) = _$AppConfigCopyWithImpl;
@useResult
$Res call({
 List<String> courseLevels, List<String> gamePhases, List<String> gameStatuses
});




}
/// @nodoc
class _$AppConfigCopyWithImpl<$Res>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._self, this._then);

  final AppConfig _self;
  final $Res Function(AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? courseLevels = null,Object? gamePhases = null,Object? gameStatuses = null,}) {
  return _then(_self.copyWith(
courseLevels: null == courseLevels ? _self.courseLevels : courseLevels // ignore: cast_nullable_to_non_nullable
as List<String>,gamePhases: null == gamePhases ? _self.gamePhases : gamePhases // ignore: cast_nullable_to_non_nullable
as List<String>,gameStatuses: null == gameStatuses ? _self.gameStatuses : gameStatuses // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [AppConfig].
extension AppConfigPatterns on AppConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppConfig value)  $default,){
final _that = this;
switch (_that) {
case _AppConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> courseLevels,  List<String> gamePhases,  List<String> gameStatuses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.courseLevels,_that.gamePhases,_that.gameStatuses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> courseLevels,  List<String> gamePhases,  List<String> gameStatuses)  $default,) {final _that = this;
switch (_that) {
case _AppConfig():
return $default(_that.courseLevels,_that.gamePhases,_that.gameStatuses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> courseLevels,  List<String> gamePhases,  List<String> gameStatuses)?  $default,) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.courseLevels,_that.gamePhases,_that.gameStatuses);case _:
  return null;

}
}

}

/// @nodoc


class _AppConfig implements AppConfig {
  const _AppConfig({required final  List<String> courseLevels, required final  List<String> gamePhases, required final  List<String> gameStatuses}): _courseLevels = courseLevels,_gamePhases = gamePhases,_gameStatuses = gameStatuses;
  

/// Lista de valores possíveis para o nível de um curso.
 final  List<String> _courseLevels;
/// Lista de valores possíveis para o nível de um curso.
@override List<String> get courseLevels {
  if (_courseLevels is EqualUnmodifiableListView) return _courseLevels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_courseLevels);
}

/// Lista de valores possíveis para a fase de um jogo.
 final  List<String> _gamePhases;
/// Lista de valores possíveis para a fase de um jogo.
@override List<String> get gamePhases {
  if (_gamePhases is EqualUnmodifiableListView) return _gamePhases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_gamePhases);
}

/// Lista de valores possíveis para o status de um jogo.
 final  List<String> _gameStatuses;
/// Lista de valores possíveis para o status de um jogo.
@override List<String> get gameStatuses {
  if (_gameStatuses is EqualUnmodifiableListView) return _gameStatuses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_gameStatuses);
}


/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigCopyWith<_AppConfig> get copyWith => __$AppConfigCopyWithImpl<_AppConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfig&&const DeepCollectionEquality().equals(other._courseLevels, _courseLevels)&&const DeepCollectionEquality().equals(other._gamePhases, _gamePhases)&&const DeepCollectionEquality().equals(other._gameStatuses, _gameStatuses));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_courseLevels),const DeepCollectionEquality().hash(_gamePhases),const DeepCollectionEquality().hash(_gameStatuses));

@override
String toString() {
  return 'AppConfig(courseLevels: $courseLevels, gamePhases: $gamePhases, gameStatuses: $gameStatuses)';
}


}

/// @nodoc
abstract mixin class _$AppConfigCopyWith<$Res> implements $AppConfigCopyWith<$Res> {
  factory _$AppConfigCopyWith(_AppConfig value, $Res Function(_AppConfig) _then) = __$AppConfigCopyWithImpl;
@override @useResult
$Res call({
 List<String> courseLevels, List<String> gamePhases, List<String> gameStatuses
});




}
/// @nodoc
class __$AppConfigCopyWithImpl<$Res>
    implements _$AppConfigCopyWith<$Res> {
  __$AppConfigCopyWithImpl(this._self, this._then);

  final _AppConfig _self;
  final $Res Function(_AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? courseLevels = null,Object? gamePhases = null,Object? gameStatuses = null,}) {
  return _then(_AppConfig(
courseLevels: null == courseLevels ? _self._courseLevels : courseLevels // ignore: cast_nullable_to_non_nullable
as List<String>,gamePhases: null == gamePhases ? _self._gamePhases : gamePhases // ignore: cast_nullable_to_non_nullable
as List<String>,gameStatuses: null == gameStatuses ? _self._gameStatuses : gameStatuses // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
