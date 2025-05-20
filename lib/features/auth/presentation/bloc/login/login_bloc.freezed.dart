// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent()';
}


}

/// @nodoc
class $LoginEventCopyWith<$Res>  {
$LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}


/// @nodoc


class LoginRequested implements LoginEvent {
  const LoginRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.loginRequested()';
}


}




/// @nodoc


class Initial implements LoginEvent {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.initial()';
}


}




/// @nodoc


class NetworkStatusChanged implements LoginEvent {
  const NetworkStatusChanged(this.status);
  

 final  NetworkStatus status;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkStatusChangedCopyWith<NetworkStatusChanged> get copyWith => _$NetworkStatusChangedCopyWithImpl<NetworkStatusChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkStatusChanged&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'LoginEvent.networkStatusChanged(status: $status)';
}


}

/// @nodoc
abstract mixin class $NetworkStatusChangedCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory $NetworkStatusChangedCopyWith(NetworkStatusChanged value, $Res Function(NetworkStatusChanged) _then) = _$NetworkStatusChangedCopyWithImpl;
@useResult
$Res call({
 NetworkStatus status
});




}
/// @nodoc
class _$NetworkStatusChangedCopyWithImpl<$Res>
    implements $NetworkStatusChangedCopyWith<$Res> {
  _$NetworkStatusChangedCopyWithImpl(this._self, this._then);

  final NetworkStatusChanged _self;
  final $Res Function(NetworkStatusChanged) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(NetworkStatusChanged(
null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NetworkStatus,
  ));
}


}

/// @nodoc
mixin _$LoginState {

 bool get isLoading; bool get isError; String get message; bool get isRegister; String get id; String get email; bool get isLoggedIn; bool get isNoInternetConnection;
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateCopyWith<LoginState> get copyWith => _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&(identical(other.isRegister, isRegister) || other.isRegister == isRegister)&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.isNoInternetConnection, isNoInternetConnection) || other.isNoInternetConnection == isNoInternetConnection));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,isRegister,id,email,isLoggedIn,isNoInternetConnection);

@override
String toString() {
  return 'LoginState(isLoading: $isLoading, isError: $isError, message: $message, isRegister: $isRegister, id: $id, email: $email, isLoggedIn: $isLoggedIn, isNoInternetConnection: $isNoInternetConnection)';
}


}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res>  {
  factory $LoginStateCopyWith(LoginState value, $Res Function(LoginState) _then) = _$LoginStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isError, String message, bool isRegister, String id, String email, bool isLoggedIn, bool isNoInternetConnection
});




}
/// @nodoc
class _$LoginStateCopyWithImpl<$Res>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? isRegister = null,Object? id = null,Object? email = null,Object? isLoggedIn = null,Object? isNoInternetConnection = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isRegister: null == isRegister ? _self.isRegister : isRegister // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,isNoInternetConnection: null == isNoInternetConnection ? _self.isNoInternetConnection : isNoInternetConnection // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _LoginState implements LoginState {
  const _LoginState({this.isLoading = false, this.isError = false, this.message = '', this.isRegister = false, this.id = '', this.email = '', this.isLoggedIn = false, this.isNoInternetConnection = false});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isError;
@override@JsonKey() final  String message;
@override@JsonKey() final  bool isRegister;
@override@JsonKey() final  String id;
@override@JsonKey() final  String email;
@override@JsonKey() final  bool isLoggedIn;
@override@JsonKey() final  bool isNoInternetConnection;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginStateCopyWith<_LoginState> get copyWith => __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&(identical(other.isRegister, isRegister) || other.isRegister == isRegister)&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.isNoInternetConnection, isNoInternetConnection) || other.isNoInternetConnection == isNoInternetConnection));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,isRegister,id,email,isLoggedIn,isNoInternetConnection);

@override
String toString() {
  return 'LoginState(isLoading: $isLoading, isError: $isError, message: $message, isRegister: $isRegister, id: $id, email: $email, isLoggedIn: $isLoggedIn, isNoInternetConnection: $isNoInternetConnection)';
}


}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(_LoginState value, $Res Function(_LoginState) _then) = __$LoginStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isError, String message, bool isRegister, String id, String email, bool isLoggedIn, bool isNoInternetConnection
});




}
/// @nodoc
class __$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? isRegister = null,Object? id = null,Object? email = null,Object? isLoggedIn = null,Object? isNoInternetConnection = null,}) {
  return _then(_LoginState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isRegister: null == isRegister ? _self.isRegister : isRegister // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,isNoInternetConnection: null == isNoInternetConnection ? _self.isNoInternetConnection : isNoInternetConnection // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
