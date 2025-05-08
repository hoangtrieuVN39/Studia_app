part of 'main_bloc.dart';

@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.initial() = Initial;
  const factory MainEvent.navBarStatusChanged(int index) = NavBarStatusChanged;
}
