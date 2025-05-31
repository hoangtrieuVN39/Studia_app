import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/core/constants/language_constants.dart';
import 'package:studia/features/settings/domain/usecases/update_language_usecase.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final Language language;
  final UpdateLanguageUsecase updateLanguageUsecase;

  SettingsBloc(this.language, this.updateLanguageUsecase)
    : super(const SettingsState()) {
    on<Initial>(_onInitial);
    on<LanguageTap>(_onLanguageTap);
    on<LanguageChanged>(_onLanguageChanged);
    on<BackTap>(_onBackTap);
    add(const SettingsEvent.initial());
  }

  Future<void> _onInitial(Initial event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(language: language));
  }

  Future<void> _onLanguageTap(
    LanguageTap event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(isLanguageTap: true));
    emit(state.copyWith(isLanguageTap: false));
  }

  Future<void> _onLanguageChanged(
    LanguageChanged event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(language: event.language));
    await updateLanguageUsecase.call(event.language);
  }

  Future<void> _onBackTap(BackTap event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(isBackTap: true));
    emit(state.copyWith(isBackTap: false));
  }
}
