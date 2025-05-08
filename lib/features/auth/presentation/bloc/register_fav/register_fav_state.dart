part of 'register_fav_bloc.dart';

@freezed
abstract class RegisterFavState with _$RegisterFavState {
  factory RegisterFavState({
    @Default([]) List<Domains> domains,
    @Default([]) List<Domains> selectedDomains,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String message,
    @Default(false) bool isContinuePressed,
  }) = _RegisterFavState;
}
