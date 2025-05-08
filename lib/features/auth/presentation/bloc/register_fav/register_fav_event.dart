part of 'register_fav_bloc.dart';

@freezed
class RegisterFavEvent with _$RegisterFavEvent {
  const factory RegisterFavEvent.initial() = Initial;

  const factory RegisterFavEvent.domainSelected(Domains domain) = DomainSelected;

  const factory RegisterFavEvent.domainUnselected(Domains domain) =
      DomainUnselected;

  const factory RegisterFavEvent.continuePressed() = ContinuePressed;
}
