part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.initial() = Initial;
  const factory HomeEvent.standardNodeTapped(Standards selectedStandard) =
      StandardNodeTapped;
  const factory HomeEvent.onPlayButtonTapped() =
      OnPlayButtonTapped;
  const factory HomeEvent.onViewInfoButtonTapped() =
      OnViewInfoButtonTapped;
}
