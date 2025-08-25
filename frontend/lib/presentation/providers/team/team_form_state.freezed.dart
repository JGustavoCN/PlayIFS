// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TeamFormState {

/// O nome da equipa, controlado pelo campo de texto.
 String get name;/// Mantém os dados da equipa original no modo de edição.
 TeamDetails? get initialTeam;/// Indica se o formulário é válido e pode ser submetido.
 bool get isFormValid;
/// Create a copy of TeamFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamFormStateCopyWith<TeamFormState> get copyWith => _$TeamFormStateCopyWithImpl<TeamFormState>(this as TeamFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamFormState&&(identical(other.name, name) || other.name == name)&&(identical(other.initialTeam, initialTeam) || other.initialTeam == initialTeam)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid));
}


@override
int get hashCode => Object.hash(runtimeType,name,initialTeam,isFormValid);

@override
String toString() {
  return 'TeamFormState(name: $name, initialTeam: $initialTeam, isFormValid: $isFormValid)';
}


}

/// @nodoc
abstract mixin class $TeamFormStateCopyWith<$Res>  {
  factory $TeamFormStateCopyWith(TeamFormState value, $Res Function(TeamFormState) _then) = _$TeamFormStateCopyWithImpl;
@useResult
$Res call({
 String name, TeamDetails? initialTeam, bool isFormValid
});


$TeamDetailsCopyWith<$Res>? get initialTeam;

}
/// @nodoc
class _$TeamFormStateCopyWithImpl<$Res>
    implements $TeamFormStateCopyWith<$Res> {
  _$TeamFormStateCopyWithImpl(this._self, this._then);

  final TeamFormState _self;
  final $Res Function(TeamFormState) _then;

/// Create a copy of TeamFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? initialTeam = freezed,Object? isFormValid = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,initialTeam: freezed == initialTeam ? _self.initialTeam : initialTeam // ignore: cast_nullable_to_non_nullable
as TeamDetails?,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of TeamFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamDetailsCopyWith<$Res>? get initialTeam {
    if (_self.initialTeam == null) {
    return null;
  }

  return $TeamDetailsCopyWith<$Res>(_self.initialTeam!, (value) {
    return _then(_self.copyWith(initialTeam: value));
  });
}
}


/// Adds pattern-matching-related methods to [TeamFormState].
extension TeamFormStatePatterns on TeamFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamFormState value)  $default,){
final _that = this;
switch (_that) {
case _TeamFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamFormState value)?  $default,){
final _that = this;
switch (_that) {
case _TeamFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  TeamDetails? initialTeam,  bool isFormValid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamFormState() when $default != null:
return $default(_that.name,_that.initialTeam,_that.isFormValid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  TeamDetails? initialTeam,  bool isFormValid)  $default,) {final _that = this;
switch (_that) {
case _TeamFormState():
return $default(_that.name,_that.initialTeam,_that.isFormValid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  TeamDetails? initialTeam,  bool isFormValid)?  $default,) {final _that = this;
switch (_that) {
case _TeamFormState() when $default != null:
return $default(_that.name,_that.initialTeam,_that.isFormValid);case _:
  return null;

}
}

}

/// @nodoc


class _TeamFormState implements TeamFormState {
  const _TeamFormState({required this.name, this.initialTeam, this.isFormValid = false});
  

/// O nome da equipa, controlado pelo campo de texto.
@override final  String name;
/// Mantém os dados da equipa original no modo de edição.
@override final  TeamDetails? initialTeam;
/// Indica se o formulário é válido e pode ser submetido.
@override@JsonKey() final  bool isFormValid;

/// Create a copy of TeamFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamFormStateCopyWith<_TeamFormState> get copyWith => __$TeamFormStateCopyWithImpl<_TeamFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamFormState&&(identical(other.name, name) || other.name == name)&&(identical(other.initialTeam, initialTeam) || other.initialTeam == initialTeam)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid));
}


@override
int get hashCode => Object.hash(runtimeType,name,initialTeam,isFormValid);

@override
String toString() {
  return 'TeamFormState(name: $name, initialTeam: $initialTeam, isFormValid: $isFormValid)';
}


}

/// @nodoc
abstract mixin class _$TeamFormStateCopyWith<$Res> implements $TeamFormStateCopyWith<$Res> {
  factory _$TeamFormStateCopyWith(_TeamFormState value, $Res Function(_TeamFormState) _then) = __$TeamFormStateCopyWithImpl;
@override @useResult
$Res call({
 String name, TeamDetails? initialTeam, bool isFormValid
});


@override $TeamDetailsCopyWith<$Res>? get initialTeam;

}
/// @nodoc
class __$TeamFormStateCopyWithImpl<$Res>
    implements _$TeamFormStateCopyWith<$Res> {
  __$TeamFormStateCopyWithImpl(this._self, this._then);

  final _TeamFormState _self;
  final $Res Function(_TeamFormState) _then;

/// Create a copy of TeamFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? initialTeam = freezed,Object? isFormValid = null,}) {
  return _then(_TeamFormState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,initialTeam: freezed == initialTeam ? _self.initialTeam : initialTeam // ignore: cast_nullable_to_non_nullable
as TeamDetails?,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TeamFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamDetailsCopyWith<$Res>? get initialTeam {
    if (_self.initialTeam == null) {
    return null;
  }

  return $TeamDetailsCopyWith<$Res>(_self.initialTeam!, (value) {
    return _then(_self.copyWith(initialTeam: value));
  });
}
}

// dart format on
