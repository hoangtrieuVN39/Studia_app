// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skills_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SkillsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SkillsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SkillsEvent()';
}


}

/// @nodoc
class $SkillsEventCopyWith<$Res>  {
$SkillsEventCopyWith(SkillsEvent _, $Res Function(SkillsEvent) __);
}


/// @nodoc


class Initial implements SkillsEvent {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SkillsEvent.initial()';
}


}




/// @nodoc


class SelectLevel implements SkillsEvent {
  const SelectLevel();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectLevel);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SkillsEvent.onSelectLevel()';
}


}




/// @nodoc


class LevelSelected implements SkillsEvent {
  const LevelSelected(this.level);
  

 final  Levels level;

/// Create a copy of SkillsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LevelSelectedCopyWith<LevelSelected> get copyWith => _$LevelSelectedCopyWithImpl<LevelSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LevelSelected&&(identical(other.level, level) || other.level == level));
}


@override
int get hashCode => Object.hash(runtimeType,level);

@override
String toString() {
  return 'SkillsEvent.levelSelected(level: $level)';
}


}

/// @nodoc
abstract mixin class $LevelSelectedCopyWith<$Res> implements $SkillsEventCopyWith<$Res> {
  factory $LevelSelectedCopyWith(LevelSelected value, $Res Function(LevelSelected) _then) = _$LevelSelectedCopyWithImpl;
@useResult
$Res call({
 Levels level
});




}
/// @nodoc
class _$LevelSelectedCopyWithImpl<$Res>
    implements $LevelSelectedCopyWith<$Res> {
  _$LevelSelectedCopyWithImpl(this._self, this._then);

  final LevelSelected _self;
  final $Res Function(LevelSelected) _then;

/// Create a copy of SkillsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? level = null,}) {
  return _then(LevelSelected(
null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as Levels,
  ));
}


}

/// @nodoc


class SkillSelected implements SkillsEvent {
  const SkillSelected(this.skill);
  

 final  Skills skill;

/// Create a copy of SkillsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SkillSelectedCopyWith<SkillSelected> get copyWith => _$SkillSelectedCopyWithImpl<SkillSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SkillSelected&&(identical(other.skill, skill) || other.skill == skill));
}


@override
int get hashCode => Object.hash(runtimeType,skill);

@override
String toString() {
  return 'SkillsEvent.skillSelected(skill: $skill)';
}


}

/// @nodoc
abstract mixin class $SkillSelectedCopyWith<$Res> implements $SkillsEventCopyWith<$Res> {
  factory $SkillSelectedCopyWith(SkillSelected value, $Res Function(SkillSelected) _then) = _$SkillSelectedCopyWithImpl;
@useResult
$Res call({
 Skills skill
});




}
/// @nodoc
class _$SkillSelectedCopyWithImpl<$Res>
    implements $SkillSelectedCopyWith<$Res> {
  _$SkillSelectedCopyWithImpl(this._self, this._then);

  final SkillSelected _self;
  final $Res Function(SkillSelected) _then;

/// Create a copy of SkillsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? skill = null,}) {
  return _then(SkillSelected(
null == skill ? _self.skill : skill // ignore: cast_nullable_to_non_nullable
as Skills,
  ));
}


}

/// @nodoc


class DomainSelected implements SkillsEvent {
  const DomainSelected(this.domain);
  

 final  Domains domain;

/// Create a copy of SkillsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DomainSelectedCopyWith<DomainSelected> get copyWith => _$DomainSelectedCopyWithImpl<DomainSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DomainSelected&&(identical(other.domain, domain) || other.domain == domain));
}


@override
int get hashCode => Object.hash(runtimeType,domain);

@override
String toString() {
  return 'SkillsEvent.domainSelected(domain: $domain)';
}


}

/// @nodoc
abstract mixin class $DomainSelectedCopyWith<$Res> implements $SkillsEventCopyWith<$Res> {
  factory $DomainSelectedCopyWith(DomainSelected value, $Res Function(DomainSelected) _then) = _$DomainSelectedCopyWithImpl;
@useResult
$Res call({
 Domains domain
});




}
/// @nodoc
class _$DomainSelectedCopyWithImpl<$Res>
    implements $DomainSelectedCopyWith<$Res> {
  _$DomainSelectedCopyWithImpl(this._self, this._then);

  final DomainSelected _self;
  final $Res Function(DomainSelected) _then;

/// Create a copy of SkillsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? domain = null,}) {
  return _then(DomainSelected(
null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as Domains,
  ));
}


}

/// @nodoc


class Navigate implements SkillsEvent {
  const Navigate(this.navItem);
  

 final  NavItem navItem;

/// Create a copy of SkillsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateCopyWith<Navigate> get copyWith => _$NavigateCopyWithImpl<Navigate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Navigate&&(identical(other.navItem, navItem) || other.navItem == navItem));
}


@override
int get hashCode => Object.hash(runtimeType,navItem);

@override
String toString() {
  return 'SkillsEvent.navigate(navItem: $navItem)';
}


}

/// @nodoc
abstract mixin class $NavigateCopyWith<$Res> implements $SkillsEventCopyWith<$Res> {
  factory $NavigateCopyWith(Navigate value, $Res Function(Navigate) _then) = _$NavigateCopyWithImpl;
@useResult
$Res call({
 NavItem navItem
});




}
/// @nodoc
class _$NavigateCopyWithImpl<$Res>
    implements $NavigateCopyWith<$Res> {
  _$NavigateCopyWithImpl(this._self, this._then);

  final Navigate _self;
  final $Res Function(Navigate) _then;

/// Create a copy of SkillsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? navItem = null,}) {
  return _then(Navigate(
null == navItem ? _self.navItem : navItem // ignore: cast_nullable_to_non_nullable
as NavItem,
  ));
}


}

/// @nodoc
mixin _$SkillsState {

 bool get isLoading; bool get isError; String get message; List<SkillDetails> get skillsDetails; List<DomainDetails> get domainsDetails; List<Levels> get levels; Levels? get selectedLevel; bool get selectLevel; Skills? get skillSelected; Domains? get domainSelected; NavItem get selectedNavItem;
/// Create a copy of SkillsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SkillsStateCopyWith<SkillsState> get copyWith => _$SkillsStateCopyWithImpl<SkillsState>(this as SkillsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SkillsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.skillsDetails, skillsDetails)&&const DeepCollectionEquality().equals(other.domainsDetails, domainsDetails)&&const DeepCollectionEquality().equals(other.levels, levels)&&(identical(other.selectedLevel, selectedLevel) || other.selectedLevel == selectedLevel)&&(identical(other.selectLevel, selectLevel) || other.selectLevel == selectLevel)&&(identical(other.skillSelected, skillSelected) || other.skillSelected == skillSelected)&&(identical(other.domainSelected, domainSelected) || other.domainSelected == domainSelected)&&(identical(other.selectedNavItem, selectedNavItem) || other.selectedNavItem == selectedNavItem));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,const DeepCollectionEquality().hash(skillsDetails),const DeepCollectionEquality().hash(domainsDetails),const DeepCollectionEquality().hash(levels),selectedLevel,selectLevel,skillSelected,domainSelected,selectedNavItem);

@override
String toString() {
  return 'SkillsState(isLoading: $isLoading, isError: $isError, message: $message, skillsDetails: $skillsDetails, domainsDetails: $domainsDetails, levels: $levels, selectedLevel: $selectedLevel, selectLevel: $selectLevel, skillSelected: $skillSelected, domainSelected: $domainSelected, selectedNavItem: $selectedNavItem)';
}


}

/// @nodoc
abstract mixin class $SkillsStateCopyWith<$Res>  {
  factory $SkillsStateCopyWith(SkillsState value, $Res Function(SkillsState) _then) = _$SkillsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isError, String message, List<SkillDetails> skillsDetails, List<DomainDetails> domainsDetails, List<Levels> levels, Levels? selectedLevel, bool selectLevel, Skills? skillSelected, Domains? domainSelected, NavItem selectedNavItem
});




}
/// @nodoc
class _$SkillsStateCopyWithImpl<$Res>
    implements $SkillsStateCopyWith<$Res> {
  _$SkillsStateCopyWithImpl(this._self, this._then);

  final SkillsState _self;
  final $Res Function(SkillsState) _then;

/// Create a copy of SkillsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? skillsDetails = null,Object? domainsDetails = null,Object? levels = null,Object? selectedLevel = freezed,Object? selectLevel = null,Object? skillSelected = freezed,Object? domainSelected = freezed,Object? selectedNavItem = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,skillsDetails: null == skillsDetails ? _self.skillsDetails : skillsDetails // ignore: cast_nullable_to_non_nullable
as List<SkillDetails>,domainsDetails: null == domainsDetails ? _self.domainsDetails : domainsDetails // ignore: cast_nullable_to_non_nullable
as List<DomainDetails>,levels: null == levels ? _self.levels : levels // ignore: cast_nullable_to_non_nullable
as List<Levels>,selectedLevel: freezed == selectedLevel ? _self.selectedLevel : selectedLevel // ignore: cast_nullable_to_non_nullable
as Levels?,selectLevel: null == selectLevel ? _self.selectLevel : selectLevel // ignore: cast_nullable_to_non_nullable
as bool,skillSelected: freezed == skillSelected ? _self.skillSelected : skillSelected // ignore: cast_nullable_to_non_nullable
as Skills?,domainSelected: freezed == domainSelected ? _self.domainSelected : domainSelected // ignore: cast_nullable_to_non_nullable
as Domains?,selectedNavItem: null == selectedNavItem ? _self.selectedNavItem : selectedNavItem // ignore: cast_nullable_to_non_nullable
as NavItem,
  ));
}

}


/// @nodoc


class _SkillsState implements SkillsState {
  const _SkillsState({this.isLoading = false, this.isError = false, this.message = '', final  List<SkillDetails> skillsDetails = const [], final  List<DomainDetails> domainsDetails = const [], final  List<Levels> levels = const [], this.selectedLevel = null, this.selectLevel = false, this.skillSelected = null, this.domainSelected = null, this.selectedNavItem = NavItem.domains}): _skillsDetails = skillsDetails,_domainsDetails = domainsDetails,_levels = levels;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isError;
@override@JsonKey() final  String message;
 final  List<SkillDetails> _skillsDetails;
@override@JsonKey() List<SkillDetails> get skillsDetails {
  if (_skillsDetails is EqualUnmodifiableListView) return _skillsDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skillsDetails);
}

 final  List<DomainDetails> _domainsDetails;
@override@JsonKey() List<DomainDetails> get domainsDetails {
  if (_domainsDetails is EqualUnmodifiableListView) return _domainsDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_domainsDetails);
}

 final  List<Levels> _levels;
@override@JsonKey() List<Levels> get levels {
  if (_levels is EqualUnmodifiableListView) return _levels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_levels);
}

@override@JsonKey() final  Levels? selectedLevel;
@override@JsonKey() final  bool selectLevel;
@override@JsonKey() final  Skills? skillSelected;
@override@JsonKey() final  Domains? domainSelected;
@override@JsonKey() final  NavItem selectedNavItem;

/// Create a copy of SkillsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SkillsStateCopyWith<_SkillsState> get copyWith => __$SkillsStateCopyWithImpl<_SkillsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SkillsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._skillsDetails, _skillsDetails)&&const DeepCollectionEquality().equals(other._domainsDetails, _domainsDetails)&&const DeepCollectionEquality().equals(other._levels, _levels)&&(identical(other.selectedLevel, selectedLevel) || other.selectedLevel == selectedLevel)&&(identical(other.selectLevel, selectLevel) || other.selectLevel == selectLevel)&&(identical(other.skillSelected, skillSelected) || other.skillSelected == skillSelected)&&(identical(other.domainSelected, domainSelected) || other.domainSelected == domainSelected)&&(identical(other.selectedNavItem, selectedNavItem) || other.selectedNavItem == selectedNavItem));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,const DeepCollectionEquality().hash(_skillsDetails),const DeepCollectionEquality().hash(_domainsDetails),const DeepCollectionEquality().hash(_levels),selectedLevel,selectLevel,skillSelected,domainSelected,selectedNavItem);

@override
String toString() {
  return 'SkillsState(isLoading: $isLoading, isError: $isError, message: $message, skillsDetails: $skillsDetails, domainsDetails: $domainsDetails, levels: $levels, selectedLevel: $selectedLevel, selectLevel: $selectLevel, skillSelected: $skillSelected, domainSelected: $domainSelected, selectedNavItem: $selectedNavItem)';
}


}

/// @nodoc
abstract mixin class _$SkillsStateCopyWith<$Res> implements $SkillsStateCopyWith<$Res> {
  factory _$SkillsStateCopyWith(_SkillsState value, $Res Function(_SkillsState) _then) = __$SkillsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isError, String message, List<SkillDetails> skillsDetails, List<DomainDetails> domainsDetails, List<Levels> levels, Levels? selectedLevel, bool selectLevel, Skills? skillSelected, Domains? domainSelected, NavItem selectedNavItem
});




}
/// @nodoc
class __$SkillsStateCopyWithImpl<$Res>
    implements _$SkillsStateCopyWith<$Res> {
  __$SkillsStateCopyWithImpl(this._self, this._then);

  final _SkillsState _self;
  final $Res Function(_SkillsState) _then;

/// Create a copy of SkillsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? skillsDetails = null,Object? domainsDetails = null,Object? levels = null,Object? selectedLevel = freezed,Object? selectLevel = null,Object? skillSelected = freezed,Object? domainSelected = freezed,Object? selectedNavItem = null,}) {
  return _then(_SkillsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,skillsDetails: null == skillsDetails ? _self._skillsDetails : skillsDetails // ignore: cast_nullable_to_non_nullable
as List<SkillDetails>,domainsDetails: null == domainsDetails ? _self._domainsDetails : domainsDetails // ignore: cast_nullable_to_non_nullable
as List<DomainDetails>,levels: null == levels ? _self._levels : levels // ignore: cast_nullable_to_non_nullable
as List<Levels>,selectedLevel: freezed == selectedLevel ? _self.selectedLevel : selectedLevel // ignore: cast_nullable_to_non_nullable
as Levels?,selectLevel: null == selectLevel ? _self.selectLevel : selectLevel // ignore: cast_nullable_to_non_nullable
as bool,skillSelected: freezed == skillSelected ? _self.skillSelected : skillSelected // ignore: cast_nullable_to_non_nullable
as Skills?,domainSelected: freezed == domainSelected ? _self.domainSelected : domainSelected // ignore: cast_nullable_to_non_nullable
as Domains?,selectedNavItem: null == selectedNavItem ? _self.selectedNavItem : selectedNavItem // ignore: cast_nullable_to_non_nullable
as NavItem,
  ));
}


}

// dart format on
