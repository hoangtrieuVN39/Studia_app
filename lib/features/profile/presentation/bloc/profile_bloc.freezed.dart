// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// @nodoc


class _Initial implements ProfileEvent {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.initial()';
}


}




/// @nodoc


class _SelectGrade implements ProfileEvent {
  const _SelectGrade(this.level);
  

 final  Levels level;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectGradeCopyWith<_SelectGrade> get copyWith => __$SelectGradeCopyWithImpl<_SelectGrade>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectGrade&&(identical(other.level, level) || other.level == level));
}


@override
int get hashCode => Object.hash(runtimeType,level);

@override
String toString() {
  return 'ProfileEvent.selectGrade(level: $level)';
}


}

/// @nodoc
abstract mixin class _$SelectGradeCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$SelectGradeCopyWith(_SelectGrade value, $Res Function(_SelectGrade) _then) = __$SelectGradeCopyWithImpl;
@useResult
$Res call({
 Levels level
});




}
/// @nodoc
class __$SelectGradeCopyWithImpl<$Res>
    implements _$SelectGradeCopyWith<$Res> {
  __$SelectGradeCopyWithImpl(this._self, this._then);

  final _SelectGrade _self;
  final $Res Function(_SelectGrade) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? level = null,}) {
  return _then(_SelectGrade(
null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as Levels,
  ));
}


}

/// @nodoc


class _EditProfile implements ProfileEvent {
  const _EditProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.editProfile()';
}


}




/// @nodoc


class _ViewAllSkills implements ProfileEvent {
  const _ViewAllSkills();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewAllSkills);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.viewAllSkills()';
}


}




/// @nodoc


class _SelectSkillsSort implements ProfileEvent {
  const _SelectSkillsSort(this.skillsSort);
  

 final  SkillsSort skillsSort;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectSkillsSortCopyWith<_SelectSkillsSort> get copyWith => __$SelectSkillsSortCopyWithImpl<_SelectSkillsSort>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectSkillsSort&&(identical(other.skillsSort, skillsSort) || other.skillsSort == skillsSort));
}


@override
int get hashCode => Object.hash(runtimeType,skillsSort);

@override
String toString() {
  return 'ProfileEvent.selectSkillsSort(skillsSort: $skillsSort)';
}


}

/// @nodoc
abstract mixin class _$SelectSkillsSortCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$SelectSkillsSortCopyWith(_SelectSkillsSort value, $Res Function(_SelectSkillsSort) _then) = __$SelectSkillsSortCopyWithImpl;
@useResult
$Res call({
 SkillsSort skillsSort
});




}
/// @nodoc
class __$SelectSkillsSortCopyWithImpl<$Res>
    implements _$SelectSkillsSortCopyWith<$Res> {
  __$SelectSkillsSortCopyWithImpl(this._self, this._then);

  final _SelectSkillsSort _self;
  final $Res Function(_SelectSkillsSort) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? skillsSort = null,}) {
  return _then(_SelectSkillsSort(
null == skillsSort ? _self.skillsSort : skillsSort // ignore: cast_nullable_to_non_nullable
as SkillsSort,
  ));
}


}

/// @nodoc


class _ViewSkill implements ProfileEvent {
  const _ViewSkill(this.skill);
  

 final  Skills skill;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewSkillCopyWith<_ViewSkill> get copyWith => __$ViewSkillCopyWithImpl<_ViewSkill>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewSkill&&(identical(other.skill, skill) || other.skill == skill));
}


@override
int get hashCode => Object.hash(runtimeType,skill);

@override
String toString() {
  return 'ProfileEvent.viewSkill(skill: $skill)';
}


}

/// @nodoc
abstract mixin class _$ViewSkillCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$ViewSkillCopyWith(_ViewSkill value, $Res Function(_ViewSkill) _then) = __$ViewSkillCopyWithImpl;
@useResult
$Res call({
 Skills skill
});




}
/// @nodoc
class __$ViewSkillCopyWithImpl<$Res>
    implements _$ViewSkillCopyWith<$Res> {
  __$ViewSkillCopyWithImpl(this._self, this._then);

  final _ViewSkill _self;
  final $Res Function(_ViewSkill) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? skill = null,}) {
  return _then(_ViewSkill(
null == skill ? _self.skill : skill // ignore: cast_nullable_to_non_nullable
as Skills,
  ));
}


}

/// @nodoc


class _Back implements ProfileEvent {
  const _Back();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Back);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.back()';
}


}




/// @nodoc
mixin _$ProfileState {

 bool get isLoading; bool get isError; String get message; User? get user; bool get isSelectGrade; bool get isEditProfile; bool get isViewAllSkills; bool get isSelectSkillsSort; Levels? get selectedLevel; Map<Skills, Map<String, dynamic>> get skills; List<Levels> get levels; List<Skills> get learnedSkills; SkillsSort get sortedSkills; bool get isBack; int get avgPerformance; Skills? get viewSkill;
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStateCopyWith<ProfileState> get copyWith => _$ProfileStateCopyWithImpl<ProfileState>(this as ProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user)&&(identical(other.isSelectGrade, isSelectGrade) || other.isSelectGrade == isSelectGrade)&&(identical(other.isEditProfile, isEditProfile) || other.isEditProfile == isEditProfile)&&(identical(other.isViewAllSkills, isViewAllSkills) || other.isViewAllSkills == isViewAllSkills)&&(identical(other.isSelectSkillsSort, isSelectSkillsSort) || other.isSelectSkillsSort == isSelectSkillsSort)&&(identical(other.selectedLevel, selectedLevel) || other.selectedLevel == selectedLevel)&&const DeepCollectionEquality().equals(other.skills, skills)&&const DeepCollectionEquality().equals(other.levels, levels)&&const DeepCollectionEquality().equals(other.learnedSkills, learnedSkills)&&(identical(other.sortedSkills, sortedSkills) || other.sortedSkills == sortedSkills)&&(identical(other.isBack, isBack) || other.isBack == isBack)&&(identical(other.avgPerformance, avgPerformance) || other.avgPerformance == avgPerformance)&&(identical(other.viewSkill, viewSkill) || other.viewSkill == viewSkill));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,user,isSelectGrade,isEditProfile,isViewAllSkills,isSelectSkillsSort,selectedLevel,const DeepCollectionEquality().hash(skills),const DeepCollectionEquality().hash(levels),const DeepCollectionEquality().hash(learnedSkills),sortedSkills,isBack,avgPerformance,viewSkill);

@override
String toString() {
  return 'ProfileState(isLoading: $isLoading, isError: $isError, message: $message, user: $user, isSelectGrade: $isSelectGrade, isEditProfile: $isEditProfile, isViewAllSkills: $isViewAllSkills, isSelectSkillsSort: $isSelectSkillsSort, selectedLevel: $selectedLevel, skills: $skills, levels: $levels, learnedSkills: $learnedSkills, sortedSkills: $sortedSkills, isBack: $isBack, avgPerformance: $avgPerformance, viewSkill: $viewSkill)';
}


}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res>  {
  factory $ProfileStateCopyWith(ProfileState value, $Res Function(ProfileState) _then) = _$ProfileStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isError, String message, User? user, bool isSelectGrade, bool isEditProfile, bool isViewAllSkills, bool isSelectSkillsSort, Levels? selectedLevel, Map<Skills, Map<String, dynamic>> skills, List<Levels> levels, List<Skills> learnedSkills, SkillsSort sortedSkills, bool isBack, int avgPerformance, Skills? viewSkill
});




}
/// @nodoc
class _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? user = freezed,Object? isSelectGrade = null,Object? isEditProfile = null,Object? isViewAllSkills = null,Object? isSelectSkillsSort = null,Object? selectedLevel = freezed,Object? skills = null,Object? levels = null,Object? learnedSkills = null,Object? sortedSkills = null,Object? isBack = null,Object? avgPerformance = null,Object? viewSkill = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,isSelectGrade: null == isSelectGrade ? _self.isSelectGrade : isSelectGrade // ignore: cast_nullable_to_non_nullable
as bool,isEditProfile: null == isEditProfile ? _self.isEditProfile : isEditProfile // ignore: cast_nullable_to_non_nullable
as bool,isViewAllSkills: null == isViewAllSkills ? _self.isViewAllSkills : isViewAllSkills // ignore: cast_nullable_to_non_nullable
as bool,isSelectSkillsSort: null == isSelectSkillsSort ? _self.isSelectSkillsSort : isSelectSkillsSort // ignore: cast_nullable_to_non_nullable
as bool,selectedLevel: freezed == selectedLevel ? _self.selectedLevel : selectedLevel // ignore: cast_nullable_to_non_nullable
as Levels?,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as Map<Skills, Map<String, dynamic>>,levels: null == levels ? _self.levels : levels // ignore: cast_nullable_to_non_nullable
as List<Levels>,learnedSkills: null == learnedSkills ? _self.learnedSkills : learnedSkills // ignore: cast_nullable_to_non_nullable
as List<Skills>,sortedSkills: null == sortedSkills ? _self.sortedSkills : sortedSkills // ignore: cast_nullable_to_non_nullable
as SkillsSort,isBack: null == isBack ? _self.isBack : isBack // ignore: cast_nullable_to_non_nullable
as bool,avgPerformance: null == avgPerformance ? _self.avgPerformance : avgPerformance // ignore: cast_nullable_to_non_nullable
as int,viewSkill: freezed == viewSkill ? _self.viewSkill : viewSkill // ignore: cast_nullable_to_non_nullable
as Skills?,
  ));
}

}


/// @nodoc


class _ProfileState implements ProfileState {
  const _ProfileState({this.isLoading = false, this.isError = false, this.message = '', this.user = null, this.isSelectGrade = false, this.isEditProfile = false, this.isViewAllSkills = false, this.isSelectSkillsSort = false, this.selectedLevel = null, final  Map<Skills, Map<String, dynamic>> skills = const {}, final  List<Levels> levels = const [], final  List<Skills> learnedSkills = const [], this.sortedSkills = SkillsSort.latest, this.isBack = false, this.avgPerformance = 0, this.viewSkill = null}): _skills = skills,_levels = levels,_learnedSkills = learnedSkills;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isError;
@override@JsonKey() final  String message;
@override@JsonKey() final  User? user;
@override@JsonKey() final  bool isSelectGrade;
@override@JsonKey() final  bool isEditProfile;
@override@JsonKey() final  bool isViewAllSkills;
@override@JsonKey() final  bool isSelectSkillsSort;
@override@JsonKey() final  Levels? selectedLevel;
 final  Map<Skills, Map<String, dynamic>> _skills;
@override@JsonKey() Map<Skills, Map<String, dynamic>> get skills {
  if (_skills is EqualUnmodifiableMapView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_skills);
}

 final  List<Levels> _levels;
@override@JsonKey() List<Levels> get levels {
  if (_levels is EqualUnmodifiableListView) return _levels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_levels);
}

 final  List<Skills> _learnedSkills;
@override@JsonKey() List<Skills> get learnedSkills {
  if (_learnedSkills is EqualUnmodifiableListView) return _learnedSkills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_learnedSkills);
}

@override@JsonKey() final  SkillsSort sortedSkills;
@override@JsonKey() final  bool isBack;
@override@JsonKey() final  int avgPerformance;
@override@JsonKey() final  Skills? viewSkill;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStateCopyWith<_ProfileState> get copyWith => __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user)&&(identical(other.isSelectGrade, isSelectGrade) || other.isSelectGrade == isSelectGrade)&&(identical(other.isEditProfile, isEditProfile) || other.isEditProfile == isEditProfile)&&(identical(other.isViewAllSkills, isViewAllSkills) || other.isViewAllSkills == isViewAllSkills)&&(identical(other.isSelectSkillsSort, isSelectSkillsSort) || other.isSelectSkillsSort == isSelectSkillsSort)&&(identical(other.selectedLevel, selectedLevel) || other.selectedLevel == selectedLevel)&&const DeepCollectionEquality().equals(other._skills, _skills)&&const DeepCollectionEquality().equals(other._levels, _levels)&&const DeepCollectionEquality().equals(other._learnedSkills, _learnedSkills)&&(identical(other.sortedSkills, sortedSkills) || other.sortedSkills == sortedSkills)&&(identical(other.isBack, isBack) || other.isBack == isBack)&&(identical(other.avgPerformance, avgPerformance) || other.avgPerformance == avgPerformance)&&(identical(other.viewSkill, viewSkill) || other.viewSkill == viewSkill));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,user,isSelectGrade,isEditProfile,isViewAllSkills,isSelectSkillsSort,selectedLevel,const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_levels),const DeepCollectionEquality().hash(_learnedSkills),sortedSkills,isBack,avgPerformance,viewSkill);

@override
String toString() {
  return 'ProfileState(isLoading: $isLoading, isError: $isError, message: $message, user: $user, isSelectGrade: $isSelectGrade, isEditProfile: $isEditProfile, isViewAllSkills: $isViewAllSkills, isSelectSkillsSort: $isSelectSkillsSort, selectedLevel: $selectedLevel, skills: $skills, levels: $levels, learnedSkills: $learnedSkills, sortedSkills: $sortedSkills, isBack: $isBack, avgPerformance: $avgPerformance, viewSkill: $viewSkill)';
}


}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(_ProfileState value, $Res Function(_ProfileState) _then) = __$ProfileStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isError, String message, User? user, bool isSelectGrade, bool isEditProfile, bool isViewAllSkills, bool isSelectSkillsSort, Levels? selectedLevel, Map<Skills, Map<String, dynamic>> skills, List<Levels> levels, List<Skills> learnedSkills, SkillsSort sortedSkills, bool isBack, int avgPerformance, Skills? viewSkill
});




}
/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? user = freezed,Object? isSelectGrade = null,Object? isEditProfile = null,Object? isViewAllSkills = null,Object? isSelectSkillsSort = null,Object? selectedLevel = freezed,Object? skills = null,Object? levels = null,Object? learnedSkills = null,Object? sortedSkills = null,Object? isBack = null,Object? avgPerformance = null,Object? viewSkill = freezed,}) {
  return _then(_ProfileState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,isSelectGrade: null == isSelectGrade ? _self.isSelectGrade : isSelectGrade // ignore: cast_nullable_to_non_nullable
as bool,isEditProfile: null == isEditProfile ? _self.isEditProfile : isEditProfile // ignore: cast_nullable_to_non_nullable
as bool,isViewAllSkills: null == isViewAllSkills ? _self.isViewAllSkills : isViewAllSkills // ignore: cast_nullable_to_non_nullable
as bool,isSelectSkillsSort: null == isSelectSkillsSort ? _self.isSelectSkillsSort : isSelectSkillsSort // ignore: cast_nullable_to_non_nullable
as bool,selectedLevel: freezed == selectedLevel ? _self.selectedLevel : selectedLevel // ignore: cast_nullable_to_non_nullable
as Levels?,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as Map<Skills, Map<String, dynamic>>,levels: null == levels ? _self._levels : levels // ignore: cast_nullable_to_non_nullable
as List<Levels>,learnedSkills: null == learnedSkills ? _self._learnedSkills : learnedSkills // ignore: cast_nullable_to_non_nullable
as List<Skills>,sortedSkills: null == sortedSkills ? _self.sortedSkills : sortedSkills // ignore: cast_nullable_to_non_nullable
as SkillsSort,isBack: null == isBack ? _self.isBack : isBack // ignore: cast_nullable_to_non_nullable
as bool,avgPerformance: null == avgPerformance ? _self.avgPerformance : avgPerformance // ignore: cast_nullable_to_non_nullable
as int,viewSkill: freezed == viewSkill ? _self.viewSkill : viewSkill // ignore: cast_nullable_to_non_nullable
as Skills?,
  ));
}


}

// dart format on
