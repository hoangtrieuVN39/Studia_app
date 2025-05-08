// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MainEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MainEvent()';
}


}

/// @nodoc
class $MainEventCopyWith<$Res>  {
$MainEventCopyWith(MainEvent _, $Res Function(MainEvent) __);
}


/// @nodoc


class Initial implements MainEvent {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MainEvent.initial()';
}


}




/// @nodoc


class NavBarStatusChanged implements MainEvent {
  const NavBarStatusChanged(this.index);
  

 final  int index;

/// Create a copy of MainEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavBarStatusChangedCopyWith<NavBarStatusChanged> get copyWith => _$NavBarStatusChangedCopyWithImpl<NavBarStatusChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavBarStatusChanged&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'MainEvent.navBarStatusChanged(index: $index)';
}


}

/// @nodoc
abstract mixin class $NavBarStatusChangedCopyWith<$Res> implements $MainEventCopyWith<$Res> {
  factory $NavBarStatusChangedCopyWith(NavBarStatusChanged value, $Res Function(NavBarStatusChanged) _then) = _$NavBarStatusChangedCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class _$NavBarStatusChangedCopyWithImpl<$Res>
    implements $NavBarStatusChangedCopyWith<$Res> {
  _$NavBarStatusChangedCopyWithImpl(this._self, this._then);

  final NavBarStatusChanged _self;
  final $Res Function(NavBarStatusChanged) _then;

/// Create a copy of MainEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(NavBarStatusChanged(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$MainState {

 bool get isLoading; bool get isError; String get message; int get navBarStatus;
/// Create a copy of MainState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainStateCopyWith<MainState> get copyWith => _$MainStateCopyWithImpl<MainState>(this as MainState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&(identical(other.navBarStatus, navBarStatus) || other.navBarStatus == navBarStatus));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,navBarStatus);

@override
String toString() {
  return 'MainState(isLoading: $isLoading, isError: $isError, message: $message, navBarStatus: $navBarStatus)';
}


}

/// @nodoc
abstract mixin class $MainStateCopyWith<$Res>  {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) _then) = _$MainStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isError, String message, int navBarStatus
});




}
/// @nodoc
class _$MainStateCopyWithImpl<$Res>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._self, this._then);

  final MainState _self;
  final $Res Function(MainState) _then;

/// Create a copy of MainState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? navBarStatus = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,navBarStatus: null == navBarStatus ? _self.navBarStatus : navBarStatus // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _MainState implements MainState {
  const _MainState({this.isLoading = false, this.isError = false, this.message = '', this.navBarStatus = 0});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isError;
@override@JsonKey() final  String message;
@override@JsonKey() final  int navBarStatus;

/// Create a copy of MainState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MainStateCopyWith<_MainState> get copyWith => __$MainStateCopyWithImpl<_MainState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MainState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&(identical(other.navBarStatus, navBarStatus) || other.navBarStatus == navBarStatus));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,navBarStatus);

@override
String toString() {
  return 'MainState(isLoading: $isLoading, isError: $isError, message: $message, navBarStatus: $navBarStatus)';
}


}

/// @nodoc
abstract mixin class _$MainStateCopyWith<$Res> implements $MainStateCopyWith<$Res> {
  factory _$MainStateCopyWith(_MainState value, $Res Function(_MainState) _then) = __$MainStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isError, String message, int navBarStatus
});




}
/// @nodoc
class __$MainStateCopyWithImpl<$Res>
    implements _$MainStateCopyWith<$Res> {
  __$MainStateCopyWithImpl(this._self, this._then);

  final _MainState _self;
  final $Res Function(_MainState) _then;

/// Create a copy of MainState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? navBarStatus = null,}) {
  return _then(_MainState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,navBarStatus: null == navBarStatus ? _self.navBarStatus : navBarStatus // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
