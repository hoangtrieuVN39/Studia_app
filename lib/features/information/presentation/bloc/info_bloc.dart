import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/information/domain/usecases/fetch_domain_details.dart';
import 'package:studia/features/information/domain/usecases/fetch_level_details.dart';
import 'package:studia/features/information/domain/usecases/fetch_skill_details.dart';
import 'package:studia/features/information/domain/usecases/fetch_standard_details.dart';

part 'info_event.dart';
part 'info_state.dart';
part 'info_bloc.freezed.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  FetchDomainDetails fetchDomainDetails;
  FetchLevelDetails fetchLevelDetails;
  FetchSkillDetails fetchSkillDetails;
  FetchStandardDetails fetchStandardDetails;
  User user;
  dynamic data;

  InfoBloc({
    required this.fetchDomainDetails,
    required this.fetchLevelDetails,
    required this.fetchSkillDetails,
    required this.fetchStandardDetails,
    required this.user,
    required this.data,
  }) : super(InfoState()) {
    on<Initial>(_onInitial);
    on<Select>(_onSelect);
    add(Initial(data));
  }

  _onInitial(Initial event, Emitter<InfoState> emit) async {
    emit(state.copyWith(isLoading: true, selected: event.selected));
    await _onUpdate(emit);
  }

  _onSelect(Select event, Emitter<InfoState> emit) async {
    emit(state.copyWith(isLoading: true, selected: event.selectedItem));
    await _onUpdate(emit);
  }

  _onUpdate(Emitter<InfoState> emit) async {
    if (state.selected is Levels) {
      LevelFullDetails details = await fetchLevelDetails(
        state.selected,
        user.performance,
      );
      emit(
        state.copyWith(
          levelDetails: details,
          isLoading: false,
          skillDetails: null,
          domainDetails: null,
          standardDetails: null,
        ),
      );
    }
    if (state.selected is Skills) {
      SkillFullDetails details = await fetchSkillDetails(
        state.selected,
        user.performance,
      );
      emit(
        state.copyWith(
          skillDetails: details,
          isLoading: false,
          domainDetails: null,
          levelDetails: null,
          standardDetails: null,
        ),
      );
    }
    if (state.selected is Domains) {
      DomainFullDetails details = await fetchDomainDetails(
        state.selected,
        user.performance,
      );
      emit(
        state.copyWith(
          domainDetails: details,
          isLoading: false,
          skillDetails: null,
          levelDetails: null,
          standardDetails: null,
        ),
      );
    }
    if (state.selected is Standards) {
      StandardFullDetails details = await fetchStandardDetails(
        state.selected,
        user.performance,
      );
      emit(
        state.copyWith(
          standardDetails: details,
          isLoading: false,
          skillDetails: null,
          domainDetails: null,
          levelDetails: null,
        ),
      );
    }
  }
}

enum InfoType { level, skill, domain, standard }
