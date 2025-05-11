import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/di/provider.dart';
import 'package:studia/features/auth/domain/usecases/fetch_domains_usecase.dart';
import 'package:studia/features/auth/domain/usecases/register_usecase.dart';
part 'register_fav_event.dart';
part 'register_fav_state.dart';
part 'register_fav_bloc.freezed.dart';

class RegisterFavBloc extends Bloc<RegisterFavEvent, RegisterFavState> {
  final FetchDomainsUsecase fetchDomainsUsecase;
  final Map<String, dynamic> userData;
  final RegisterUsecase registerUsecase;

  RegisterFavBloc(this.fetchDomainsUsecase, this.userData, this.registerUsecase)
    : super(RegisterFavState()) {
    on<Initial>(_onInitial);
    on<DomainSelected>(_onDomainSelected);
    on<ContinuePressed>(_onContinuePressed);
    on<DomainUnselected>(_onDomainUnselected);
    add(const Initial());
  }

  Future<void> _onInitial(Initial event, Emitter<RegisterFavState> emit) async {
    emit(state.copyWith(isLoading: true));
    final domains = await fetchDomainsUsecase();
    emit(state.copyWith(domains: domains, isLoading: false));
  }

  Future<void> _onDomainSelected(
    DomainSelected event,
    Emitter<RegisterFavState> emit,
  ) async {
    final selectedDomains = [...state.selectedDomains, event.domain];
    emit(
      state.copyWith(
        selectedDomains: selectedDomains,
        domains:
            state.domains
                .where((domain) => !selectedDomains.contains(domain))
                .toList(),
      ),
    );
  }

  Future<void> _onDomainUnselected(
    DomainUnselected event,
    Emitter<RegisterFavState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedDomains:
            state.selectedDomains
                .where((domain) => domain != event.domain)
                .toList(),
        domains: [...state.domains, event.domain],
      ),
    );
  }

  Future<void> _onContinuePressed(
    ContinuePressed event,
    Emitter<RegisterFavState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await registerUsecase(userData);
    emit(state.copyWith(isLoading: false, isContinuePressed: true));
  }
}
