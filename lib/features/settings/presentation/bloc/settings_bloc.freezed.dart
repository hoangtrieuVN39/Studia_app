// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent()';
}


}

/// @nodoc
class $SettingsEventCopyWith<$Res>  {
$SettingsEventCopyWith(SettingsEvent _, $Res Function(SettingsEvent) __);
}


/// @nodoc


class Initial implements SettingsEvent {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent.initial()';
}


}




/// @nodoc


class LanguageTap implements SettingsEvent {
  const LanguageTap();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LanguageTap);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent.onLanguageTap()';
}


}




/// @nodoc


class LanguageChanged implements SettingsEvent {
  const LanguageChanged(this.language);
  

 final  Language language;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LanguageChangedCopyWith<LanguageChanged> get copyWith => _$LanguageChangedCopyWithImpl<LanguageChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LanguageChanged&&(identical(other.language, language) || other.language == language));
}


@override
int get hashCode => Object.hash(runtimeType,language);

@override
String toString() {
  return 'SettingsEvent.onLanguageChanged(language: $language)';
}


}

/// @nodoc
abstract mixin class $LanguageChangedCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory $LanguageChangedCopyWith(LanguageChanged value, $Res Function(LanguageChanged) _then) = _$LanguageChangedCopyWithImpl;
@useResult
$Res call({
 Language language
});




}
/// @nodoc
class _$LanguageChangedCopyWithImpl<$Res>
    implements $LanguageChangedCopyWith<$Res> {
  _$LanguageChangedCopyWithImpl(this._self, this._then);

  final LanguageChanged _self;
  final $Res Function(LanguageChanged) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? language = null,}) {
  return _then(LanguageChanged(
null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as Language,
  ));
}


}

/// @nodoc


class BackTap implements SettingsEvent {
  const BackTap();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackTap);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent.onBackTap()';
}


}




/// @nodoc
mixin _$SettingsState {

 bool get isLoading; bool get isError; String get message; Language get language; bool get isLanguageTap; bool get isLogoutTap; bool get isBackTap;
/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsStateCopyWith<SettingsState> get copyWith => _$SettingsStateCopyWithImpl<SettingsState>(this as SettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&(identical(other.language, language) || other.language == language)&&(identical(other.isLanguageTap, isLanguageTap) || other.isLanguageTap == isLanguageTap)&&(identical(other.isLogoutTap, isLogoutTap) || other.isLogoutTap == isLogoutTap)&&(identical(other.isBackTap, isBackTap) || other.isBackTap == isBackTap));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,language,isLanguageTap,isLogoutTap,isBackTap);

@override
String toString() {
  return 'SettingsState(isLoading: $isLoading, isError: $isError, message: $message, language: $language, isLanguageTap: $isLanguageTap, isLogoutTap: $isLogoutTap, isBackTap: $isBackTap)';
}


}

/// @nodoc
abstract mixin class $SettingsStateCopyWith<$Res>  {
  factory $SettingsStateCopyWith(SettingsState value, $Res Function(SettingsState) _then) = _$SettingsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isError, String message, Language language, bool isLanguageTap, bool isLogoutTap, bool isBackTap
});




}
/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._self, this._then);

  final SettingsState _self;
  final $Res Function(SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? language = null,Object? isLanguageTap = null,Object? isLogoutTap = null,Object? isBackTap = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as Language,isLanguageTap: null == isLanguageTap ? _self.isLanguageTap : isLanguageTap // ignore: cast_nullable_to_non_nullable
as bool,isLogoutTap: null == isLogoutTap ? _self.isLogoutTap : isLogoutTap // ignore: cast_nullable_to_non_nullable
as bool,isBackTap: null == isBackTap ? _self.isBackTap : isBackTap // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _SettingsState implements SettingsState {
  const _SettingsState({this.isLoading = false, this.isError = false, this.message = '', this.language = Language.en, this.isLanguageTap = false, this.isLogoutTap = false, this.isBackTap = false});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isError;
@override@JsonKey() final  String message;
@override@JsonKey() final  Language language;
@override@JsonKey() final  bool isLanguageTap;
@override@JsonKey() final  bool isLogoutTap;
@override@JsonKey() final  bool isBackTap;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsStateCopyWith<_SettingsState> get copyWith => __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&(identical(other.language, language) || other.language == language)&&(identical(other.isLanguageTap, isLanguageTap) || other.isLanguageTap == isLanguageTap)&&(identical(other.isLogoutTap, isLogoutTap) || other.isLogoutTap == isLogoutTap)&&(identical(other.isBackTap, isBackTap) || other.isBackTap == isBackTap));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,language,isLanguageTap,isLogoutTap,isBackTap);

@override
String toString() {
  return 'SettingsState(isLoading: $isLoading, isError: $isError, message: $message, language: $language, isLanguageTap: $isLanguageTap, isLogoutTap: $isLogoutTap, isBackTap: $isBackTap)';
}


}

/// @nodoc
abstract mixin class _$SettingsStateCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(_SettingsState value, $Res Function(_SettingsState) _then) = __$SettingsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isError, String message, Language language, bool isLanguageTap, bool isLogoutTap, bool isBackTap
});




}
/// @nodoc
class __$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsStateCopyWith<$Res> {
  __$SettingsStateCopyWithImpl(this._self, this._then);

  final _SettingsState _self;
  final $Res Function(_SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? language = null,Object? isLanguageTap = null,Object? isLogoutTap = null,Object? isBackTap = null,}) {
  return _then(_SettingsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as Language,isLanguageTap: null == isLanguageTap ? _self.isLanguageTap : isLanguageTap // ignore: cast_nullable_to_non_nullable
as bool,isLogoutTap: null == isLogoutTap ? _self.isLogoutTap : isLogoutTap // ignore: cast_nullable_to_non_nullable
as bool,isBackTap: null == isBackTap ? _self.isBackTap : isBackTap // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
