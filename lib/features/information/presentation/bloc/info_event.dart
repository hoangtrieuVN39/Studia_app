part of 'info_bloc.dart';

@freezed
abstract class InfoEvent with _$InfoEvent {
  const factory InfoEvent.initial(dynamic selected) = Initial;
  const factory InfoEvent.onSelect(dynamic selectedItem) = Select;
}
