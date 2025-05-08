import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_event.dart';
part 'main_state.dart';
part 'main_bloc.freezed.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<Initial>((event, emit) => _onInitialEvent(event, emit));
    on<NavBarStatusChanged>(
      (event, emit) => _onNavBarStatusChanged(event, emit),
    );
    add(const Initial());
  }

  Future<void> _onMainEvent(MainEvent event, Emitter<MainState> emit) async {
    emit(state.copyWith(isLoading: true));
  }

  Future<void> _onInitialEvent(Initial event, Emitter<MainState> emit) async {
    emit(state.copyWith(isLoading: true));
  }

  Future<void> _onNavBarStatusChanged(
    NavBarStatusChanged event,
    Emitter<MainState> emit,
  ) async {
    emit(state.copyWith(navBarStatus: event.index));
  }
}

enum NavBarStatus { home, chat, menu }

extension NavBarStatusExtension on NavBarStatus {
  String get label {
    switch (this) {
      case NavBarStatus.home:
        return 'Home';
      case NavBarStatus.chat:
        return 'Chat';
      case NavBarStatus.menu:
        return 'Menu';
    }
  }

  IconData get icon_default {
    switch (this) {
      case NavBarStatus.home:
        return Icons.home_outlined;
      case NavBarStatus.chat:
        return Icons.chat_bubble_outline;
      case NavBarStatus.menu:
        return Icons.menu_outlined;
    }
  }

  IconData get icon_selected {
    switch (this) {
      case NavBarStatus.home:
        return Icons.home_filled;
      case NavBarStatus.chat:
        return Icons.chat_bubble;
      case NavBarStatus.menu:
        return Icons.menu;
    }
  }
}
