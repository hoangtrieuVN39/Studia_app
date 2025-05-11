// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MenuEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MenuEvent()';
}


}

/// @nodoc
class $MenuEventCopyWith<$Res>  {
$MenuEventCopyWith(MenuEvent _, $Res Function(MenuEvent) __);
}


/// @nodoc


class Initial implements MenuEvent {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MenuEvent.initial()';
}


}




/// @nodoc


class ViewProfile implements MenuEvent {
  const ViewProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MenuEvent.viewProfile()';
}


}




/// @nodoc


class ViewSkills implements MenuEvent {
  const ViewSkills();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewSkills);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MenuEvent.viewSkills()';
}


}




/// @nodoc


class ViewSettings implements MenuEvent {
  const ViewSettings();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewSettings);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MenuEvent.viewSettings()';
}


}




/// @nodoc


class Logout implements MenuEvent {
  const Logout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Logout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MenuEvent.logout()';
}


}




/// @nodoc
mixin _$MenuState {

 bool get isLoading; bool get isError; String get message; String get avatar; String get name; bool get isViewProfile; bool get isViewSkills; bool get isViewSettings; bool get isLogout;
/// Create a copy of MenuState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuStateCopyWith<MenuState> get copyWith => _$MenuStateCopyWithImpl<MenuState>(this as MenuState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.name, name) || other.name == name)&&(identical(other.isViewProfile, isViewProfile) || other.isViewProfile == isViewProfile)&&(identical(other.isViewSkills, isViewSkills) || other.isViewSkills == isViewSkills)&&(identical(other.isViewSettings, isViewSettings) || other.isViewSettings == isViewSettings)&&(identical(other.isLogout, isLogout) || other.isLogout == isLogout));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,avatar,name,isViewProfile,isViewSkills,isViewSettings,isLogout);

@override
String toString() {
  return 'MenuState(isLoading: $isLoading, isError: $isError, message: $message, avatar: $avatar, name: $name, isViewProfile: $isViewProfile, isViewSkills: $isViewSkills, isViewSettings: $isViewSettings, isLogout: $isLogout)';
}


}

/// @nodoc
abstract mixin class $MenuStateCopyWith<$Res>  {
  factory $MenuStateCopyWith(MenuState value, $Res Function(MenuState) _then) = _$MenuStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isError, String message, String avatar, String name, bool isViewProfile, bool isViewSkills, bool isViewSettings, bool isLogout
});




}
/// @nodoc
class _$MenuStateCopyWithImpl<$Res>
    implements $MenuStateCopyWith<$Res> {
  _$MenuStateCopyWithImpl(this._self, this._then);

  final MenuState _self;
  final $Res Function(MenuState) _then;

/// Create a copy of MenuState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? avatar = null,Object? name = null,Object? isViewProfile = null,Object? isViewSkills = null,Object? isViewSettings = null,Object? isLogout = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isViewProfile: null == isViewProfile ? _self.isViewProfile : isViewProfile // ignore: cast_nullable_to_non_nullable
as bool,isViewSkills: null == isViewSkills ? _self.isViewSkills : isViewSkills // ignore: cast_nullable_to_non_nullable
as bool,isViewSettings: null == isViewSettings ? _self.isViewSettings : isViewSettings // ignore: cast_nullable_to_non_nullable
as bool,isLogout: null == isLogout ? _self.isLogout : isLogout // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _MainState implements MenuState {
  const _MainState({this.isLoading = false, this.isError = false, this.message = '', this.avatar = '', this.name = '', this.isViewProfile = false, this.isViewSkills = false, this.isViewSettings = false, this.isLogout = false});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isError;
@override@JsonKey() final  String message;
@override@JsonKey() final  String avatar;
@override@JsonKey() final  String name;
@override@JsonKey() final  bool isViewProfile;
@override@JsonKey() final  bool isViewSkills;
@override@JsonKey() final  bool isViewSettings;
@override@JsonKey() final  bool isLogout;

/// Create a copy of MenuState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MainStateCopyWith<_MainState> get copyWith => __$MainStateCopyWithImpl<_MainState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MainState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.name, name) || other.name == name)&&(identical(other.isViewProfile, isViewProfile) || other.isViewProfile == isViewProfile)&&(identical(other.isViewSkills, isViewSkills) || other.isViewSkills == isViewSkills)&&(identical(other.isViewSettings, isViewSettings) || other.isViewSettings == isViewSettings)&&(identical(other.isLogout, isLogout) || other.isLogout == isLogout));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,avatar,name,isViewProfile,isViewSkills,isViewSettings,isLogout);

@override
String toString() {
  return 'MenuState(isLoading: $isLoading, isError: $isError, message: $message, avatar: $avatar, name: $name, isViewProfile: $isViewProfile, isViewSkills: $isViewSkills, isViewSettings: $isViewSettings, isLogout: $isLogout)';
}


}

/// @nodoc
abstract mixin class _$MainStateCopyWith<$Res> implements $MenuStateCopyWith<$Res> {
  factory _$MainStateCopyWith(_MainState value, $Res Function(_MainState) _then) = __$MainStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isError, String message, String avatar, String name, bool isViewProfile, bool isViewSkills, bool isViewSettings, bool isLogout
});




}
/// @nodoc
class __$MainStateCopyWithImpl<$Res>
    implements _$MainStateCopyWith<$Res> {
  __$MainStateCopyWithImpl(this._self, this._then);

  final _MainState _self;
  final $Res Function(_MainState) _then;

/// Create a copy of MenuState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? avatar = null,Object? name = null,Object? isViewProfile = null,Object? isViewSkills = null,Object? isViewSettings = null,Object? isLogout = null,}) {
  return _then(_MainState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isViewProfile: null == isViewProfile ? _self.isViewProfile : isViewProfile // ignore: cast_nullable_to_non_nullable
as bool,isViewSkills: null == isViewSkills ? _self.isViewSkills : isViewSkills // ignore: cast_nullable_to_non_nullable
as bool,isViewSettings: null == isViewSettings ? _self.isViewSettings : isViewSettings // ignore: cast_nullable_to_non_nullable
as bool,isLogout: null == isLogout ? _self.isLogout : isLogout // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
