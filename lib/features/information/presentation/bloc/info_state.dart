part of 'info_bloc.dart';

@freezed
abstract class InfoState with _$InfoState {
  const factory InfoState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String message,
    @Default(null) dynamic selected,
    @Default(null) double? progress,
    @Default(null) LevelFullDetails? levelDetails,
    @Default(null) DomainFullDetails? domainDetails,
    @Default(null) SkillFullDetails? skillDetails,
    @Default(null) StandardFullDetails? standardDetails,
  }) = _InfoState;
}
