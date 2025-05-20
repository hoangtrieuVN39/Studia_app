part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loginRequested() = LoginRequested;
  const factory LoginEvent.initial() = Initial;
  const factory LoginEvent.networkStatusChanged(NetworkStatus status) =
      NetworkStatusChanged;
}
