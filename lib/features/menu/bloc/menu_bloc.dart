import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/auth/domain/usecases/logout_usecase.dart';

part 'menu_event.dart';
part 'menu_state.dart';
part 'menu_bloc.freezed.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  User user;
  LogoutUsecase logoutUsecase;

  MenuBloc(this.user, this.logoutUsecase) : super(const MenuState()) {
    on<Initial>((event, emit) => _onInitialEvent(event, emit));
    on<ViewProfile>((event, emit) => _onViewProfileEvent(event, emit));
    on<ViewSkills>((event, emit) => _onViewSkillsEvent(event, emit));
    on<ViewSettings>((event, emit) => _onViewSettingsEvent(event, emit));
    on<Logout>((event, emit) => _onLogoutEvent(event, emit));
    add(const Initial());
  }

  Future<void> _onInitialEvent(Initial event, Emitter<MenuState> emit) async {
    emit(state.copyWith(isLoading: true));

    final avatar = user.avatar;
    final name = '${user.firstName} ${user.lastName}';

    emit(state.copyWith(isLoading: false, avatar: avatar, name: name));
  }

  Future<void> _onViewProfileEvent(
    ViewProfile event,
    Emitter<MenuState> emit,
  ) async {
    emit(state.copyWith(isViewProfile: true));
    emit(state.copyWith(isViewProfile: false));
  }

  Future<void> _onViewSkillsEvent(
    ViewSkills event,
    Emitter<MenuState> emit,
  ) async {
    emit(state.copyWith(isViewSkills: true));
    emit(state.copyWith(isViewSkills: false));
  }

  Future<void> _onViewSettingsEvent(
    ViewSettings event,
    Emitter<MenuState> emit,
  ) async {
    emit(state.copyWith(isViewSettings: true));
    emit(state.copyWith(isViewSettings: false));
  }

  Future<void> _onLogoutEvent(Logout event, Emitter<MenuState> emit) async {
    emit(state.copyWith(isLoading: true));
    await logoutUsecase.call();
    emit(state.copyWith(isLogout: true));
  }
}
