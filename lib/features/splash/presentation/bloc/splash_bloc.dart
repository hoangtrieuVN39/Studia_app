import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<Started>(_onStarted);
    add(const SplashEvent.started());
  }

  Future<void> _onStarted(Started event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(done: true));
  }
}
