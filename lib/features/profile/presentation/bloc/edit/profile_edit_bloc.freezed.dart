// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_edit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEditEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEditEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditEvent()';
}


}

/// @nodoc
class $ProfileEditEventCopyWith<$Res>  {
$ProfileEditEventCopyWith(ProfileEditEvent _, $Res Function(ProfileEditEvent) __);
}


/// @nodoc


class Initial implements ProfileEditEvent {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditEvent.initial()';
}


}




/// @nodoc


class PickGradeRequested implements ProfileEditEvent {
  const PickGradeRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickGradeRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditEvent.pickGradeRequested()';
}


}




/// @nodoc


class PickYearOfBirthRequested implements ProfileEditEvent {
  const PickYearOfBirthRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickYearOfBirthRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditEvent.pickYearOfBirthRequested()';
}


}




/// @nodoc


class YobSelected implements ProfileEditEvent {
  const YobSelected(this.year);
  

 final  int year;

/// Create a copy of ProfileEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YobSelectedCopyWith<YobSelected> get copyWith => _$YobSelectedCopyWithImpl<YobSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YobSelected&&(identical(other.year, year) || other.year == year));
}


@override
int get hashCode => Object.hash(runtimeType,year);

@override
String toString() {
  return 'ProfileEditEvent.yobSelected(year: $year)';
}


}

/// @nodoc
abstract mixin class $YobSelectedCopyWith<$Res> implements $ProfileEditEventCopyWith<$Res> {
  factory $YobSelectedCopyWith(YobSelected value, $Res Function(YobSelected) _then) = _$YobSelectedCopyWithImpl;
@useResult
$Res call({
 int year
});




}
/// @nodoc
class _$YobSelectedCopyWithImpl<$Res>
    implements $YobSelectedCopyWith<$Res> {
  _$YobSelectedCopyWithImpl(this._self, this._then);

  final YobSelected _self;
  final $Res Function(YobSelected) _then;

/// Create a copy of ProfileEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? year = null,}) {
  return _then(YobSelected(
null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class GradeSelected implements ProfileEditEvent {
  const GradeSelected(this.level);
  

 final  Levels level;

/// Create a copy of ProfileEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GradeSelectedCopyWith<GradeSelected> get copyWith => _$GradeSelectedCopyWithImpl<GradeSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GradeSelected&&(identical(other.level, level) || other.level == level));
}


@override
int get hashCode => Object.hash(runtimeType,level);

@override
String toString() {
  return 'ProfileEditEvent.gradeSelected(level: $level)';
}


}

/// @nodoc
abstract mixin class $GradeSelectedCopyWith<$Res> implements $ProfileEditEventCopyWith<$Res> {
  factory $GradeSelectedCopyWith(GradeSelected value, $Res Function(GradeSelected) _then) = _$GradeSelectedCopyWithImpl;
@useResult
$Res call({
 Levels level
});




}
/// @nodoc
class _$GradeSelectedCopyWithImpl<$Res>
    implements $GradeSelectedCopyWith<$Res> {
  _$GradeSelectedCopyWithImpl(this._self, this._then);

  final GradeSelected _self;
  final $Res Function(GradeSelected) _then;

/// Create a copy of ProfileEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? level = null,}) {
  return _then(GradeSelected(
null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as Levels,
  ));
}


}

/// @nodoc


class ContinuePressed implements ProfileEditEvent {
  const ContinuePressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContinuePressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditEvent.continuePressed()';
}


}




/// @nodoc


class SetGender implements ProfileEditEvent {
  const SetGender(this.gender);
  

 final  Gender gender;

/// Create a copy of ProfileEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetGenderCopyWith<SetGender> get copyWith => _$SetGenderCopyWithImpl<SetGender>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetGender&&(identical(other.gender, gender) || other.gender == gender));
}


@override
int get hashCode => Object.hash(runtimeType,gender);

@override
String toString() {
  return 'ProfileEditEvent.setGender(gender: $gender)';
}


}

/// @nodoc
abstract mixin class $SetGenderCopyWith<$Res> implements $ProfileEditEventCopyWith<$Res> {
  factory $SetGenderCopyWith(SetGender value, $Res Function(SetGender) _then) = _$SetGenderCopyWithImpl;
@useResult
$Res call({
 Gender gender
});




}
/// @nodoc
class _$SetGenderCopyWithImpl<$Res>
    implements $SetGenderCopyWith<$Res> {
  _$SetGenderCopyWithImpl(this._self, this._then);

  final SetGender _self;
  final $Res Function(SetGender) _then;

/// Create a copy of ProfileEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? gender = null,}) {
  return _then(SetGender(
null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,
  ));
}


}

/// @nodoc


class SetFirstName implements ProfileEditEvent {
  const SetFirstName(this.firstName);
  

 final  String firstName;

/// Create a copy of ProfileEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetFirstNameCopyWith<SetFirstName> get copyWith => _$SetFirstNameCopyWithImpl<SetFirstName>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetFirstName&&(identical(other.firstName, firstName) || other.firstName == firstName));
}


@override
int get hashCode => Object.hash(runtimeType,firstName);

@override
String toString() {
  return 'ProfileEditEvent.setFirstName(firstName: $firstName)';
}


}

/// @nodoc
abstract mixin class $SetFirstNameCopyWith<$Res> implements $ProfileEditEventCopyWith<$Res> {
  factory $SetFirstNameCopyWith(SetFirstName value, $Res Function(SetFirstName) _then) = _$SetFirstNameCopyWithImpl;
@useResult
$Res call({
 String firstName
});




}
/// @nodoc
class _$SetFirstNameCopyWithImpl<$Res>
    implements $SetFirstNameCopyWith<$Res> {
  _$SetFirstNameCopyWithImpl(this._self, this._then);

  final SetFirstName _self;
  final $Res Function(SetFirstName) _then;

/// Create a copy of ProfileEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? firstName = null,}) {
  return _then(SetFirstName(
null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SetLastName implements ProfileEditEvent {
  const SetLastName(this.lastName);
  

 final  String lastName;

/// Create a copy of ProfileEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetLastNameCopyWith<SetLastName> get copyWith => _$SetLastNameCopyWithImpl<SetLastName>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetLastName&&(identical(other.lastName, lastName) || other.lastName == lastName));
}


@override
int get hashCode => Object.hash(runtimeType,lastName);

@override
String toString() {
  return 'ProfileEditEvent.setLastName(lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class $SetLastNameCopyWith<$Res> implements $ProfileEditEventCopyWith<$Res> {
  factory $SetLastNameCopyWith(SetLastName value, $Res Function(SetLastName) _then) = _$SetLastNameCopyWithImpl;
@useResult
$Res call({
 String lastName
});




}
/// @nodoc
class _$SetLastNameCopyWithImpl<$Res>
    implements $SetLastNameCopyWith<$Res> {
  _$SetLastNameCopyWithImpl(this._self, this._then);

  final SetLastName _self;
  final $Res Function(SetLastName) _then;

/// Create a copy of ProfileEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lastName = null,}) {
  return _then(SetLastName(
null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class BackPressed implements ProfileEditEvent {
  const BackPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditEvent.backPressed()';
}


}




/// @nodoc
mixin _$ProfileEditState {

 bool get isLoading; bool get isError; String get message; bool get showGradePicker; Levels? get selectedLevel; List<Levels> get levels; String get firstName; String get lastName; Gender get gender; int get yearOfBirth; bool get showYearOfBirthPicker; bool get showLevelPicker; bool get isContinuePressed; bool get isBackPressed;
/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileEditStateCopyWith<ProfileEditState> get copyWith => _$ProfileEditStateCopyWithImpl<ProfileEditState>(this as ProfileEditState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEditState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&(identical(other.showGradePicker, showGradePicker) || other.showGradePicker == showGradePicker)&&(identical(other.selectedLevel, selectedLevel) || other.selectedLevel == selectedLevel)&&const DeepCollectionEquality().equals(other.levels, levels)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.yearOfBirth, yearOfBirth) || other.yearOfBirth == yearOfBirth)&&(identical(other.showYearOfBirthPicker, showYearOfBirthPicker) || other.showYearOfBirthPicker == showYearOfBirthPicker)&&(identical(other.showLevelPicker, showLevelPicker) || other.showLevelPicker == showLevelPicker)&&(identical(other.isContinuePressed, isContinuePressed) || other.isContinuePressed == isContinuePressed)&&(identical(other.isBackPressed, isBackPressed) || other.isBackPressed == isBackPressed));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,showGradePicker,selectedLevel,const DeepCollectionEquality().hash(levels),firstName,lastName,gender,yearOfBirth,showYearOfBirthPicker,showLevelPicker,isContinuePressed,isBackPressed);

@override
String toString() {
  return 'ProfileEditState(isLoading: $isLoading, isError: $isError, message: $message, showGradePicker: $showGradePicker, selectedLevel: $selectedLevel, levels: $levels, firstName: $firstName, lastName: $lastName, gender: $gender, yearOfBirth: $yearOfBirth, showYearOfBirthPicker: $showYearOfBirthPicker, showLevelPicker: $showLevelPicker, isContinuePressed: $isContinuePressed, isBackPressed: $isBackPressed)';
}


}

/// @nodoc
abstract mixin class $ProfileEditStateCopyWith<$Res>  {
  factory $ProfileEditStateCopyWith(ProfileEditState value, $Res Function(ProfileEditState) _then) = _$ProfileEditStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isError, String message, bool showGradePicker, Levels? selectedLevel, List<Levels> levels, String firstName, String lastName, Gender gender, int yearOfBirth, bool showYearOfBirthPicker, bool showLevelPicker, bool isContinuePressed, bool isBackPressed
});




}
/// @nodoc
class _$ProfileEditStateCopyWithImpl<$Res>
    implements $ProfileEditStateCopyWith<$Res> {
  _$ProfileEditStateCopyWithImpl(this._self, this._then);

  final ProfileEditState _self;
  final $Res Function(ProfileEditState) _then;

/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? showGradePicker = null,Object? selectedLevel = freezed,Object? levels = null,Object? firstName = null,Object? lastName = null,Object? gender = null,Object? yearOfBirth = null,Object? showYearOfBirthPicker = null,Object? showLevelPicker = null,Object? isContinuePressed = null,Object? isBackPressed = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,showGradePicker: null == showGradePicker ? _self.showGradePicker : showGradePicker // ignore: cast_nullable_to_non_nullable
as bool,selectedLevel: freezed == selectedLevel ? _self.selectedLevel : selectedLevel // ignore: cast_nullable_to_non_nullable
as Levels?,levels: null == levels ? _self.levels : levels // ignore: cast_nullable_to_non_nullable
as List<Levels>,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,yearOfBirth: null == yearOfBirth ? _self.yearOfBirth : yearOfBirth // ignore: cast_nullable_to_non_nullable
as int,showYearOfBirthPicker: null == showYearOfBirthPicker ? _self.showYearOfBirthPicker : showYearOfBirthPicker // ignore: cast_nullable_to_non_nullable
as bool,showLevelPicker: null == showLevelPicker ? _self.showLevelPicker : showLevelPicker // ignore: cast_nullable_to_non_nullable
as bool,isContinuePressed: null == isContinuePressed ? _self.isContinuePressed : isContinuePressed // ignore: cast_nullable_to_non_nullable
as bool,isBackPressed: null == isBackPressed ? _self.isBackPressed : isBackPressed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _EditState implements ProfileEditState {
  const _EditState({this.isLoading = false, this.isError = false, this.message = '', this.showGradePicker = false, this.selectedLevel = null, final  List<Levels> levels = const [], this.firstName = '', this.lastName = '', this.gender = Gender.Male, this.yearOfBirth = AppTextConstants.yearOfBirthDefault, this.showYearOfBirthPicker = false, this.showLevelPicker = false, this.isContinuePressed = false, this.isBackPressed = false}): _levels = levels;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isError;
@override@JsonKey() final  String message;
@override@JsonKey() final  bool showGradePicker;
@override@JsonKey() final  Levels? selectedLevel;
 final  List<Levels> _levels;
@override@JsonKey() List<Levels> get levels {
  if (_levels is EqualUnmodifiableListView) return _levels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_levels);
}

@override@JsonKey() final  String firstName;
@override@JsonKey() final  String lastName;
@override@JsonKey() final  Gender gender;
@override@JsonKey() final  int yearOfBirth;
@override@JsonKey() final  bool showYearOfBirthPicker;
@override@JsonKey() final  bool showLevelPicker;
@override@JsonKey() final  bool isContinuePressed;
@override@JsonKey() final  bool isBackPressed;

/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditStateCopyWith<_EditState> get copyWith => __$EditStateCopyWithImpl<_EditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&(identical(other.showGradePicker, showGradePicker) || other.showGradePicker == showGradePicker)&&(identical(other.selectedLevel, selectedLevel) || other.selectedLevel == selectedLevel)&&const DeepCollectionEquality().equals(other._levels, _levels)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.yearOfBirth, yearOfBirth) || other.yearOfBirth == yearOfBirth)&&(identical(other.showYearOfBirthPicker, showYearOfBirthPicker) || other.showYearOfBirthPicker == showYearOfBirthPicker)&&(identical(other.showLevelPicker, showLevelPicker) || other.showLevelPicker == showLevelPicker)&&(identical(other.isContinuePressed, isContinuePressed) || other.isContinuePressed == isContinuePressed)&&(identical(other.isBackPressed, isBackPressed) || other.isBackPressed == isBackPressed));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,showGradePicker,selectedLevel,const DeepCollectionEquality().hash(_levels),firstName,lastName,gender,yearOfBirth,showYearOfBirthPicker,showLevelPicker,isContinuePressed,isBackPressed);

@override
String toString() {
  return 'ProfileEditState(isLoading: $isLoading, isError: $isError, message: $message, showGradePicker: $showGradePicker, selectedLevel: $selectedLevel, levels: $levels, firstName: $firstName, lastName: $lastName, gender: $gender, yearOfBirth: $yearOfBirth, showYearOfBirthPicker: $showYearOfBirthPicker, showLevelPicker: $showLevelPicker, isContinuePressed: $isContinuePressed, isBackPressed: $isBackPressed)';
}


}

/// @nodoc
abstract mixin class _$EditStateCopyWith<$Res> implements $ProfileEditStateCopyWith<$Res> {
  factory _$EditStateCopyWith(_EditState value, $Res Function(_EditState) _then) = __$EditStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isError, String message, bool showGradePicker, Levels? selectedLevel, List<Levels> levels, String firstName, String lastName, Gender gender, int yearOfBirth, bool showYearOfBirthPicker, bool showLevelPicker, bool isContinuePressed, bool isBackPressed
});




}
/// @nodoc
class __$EditStateCopyWithImpl<$Res>
    implements _$EditStateCopyWith<$Res> {
  __$EditStateCopyWithImpl(this._self, this._then);

  final _EditState _self;
  final $Res Function(_EditState) _then;

/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? showGradePicker = null,Object? selectedLevel = freezed,Object? levels = null,Object? firstName = null,Object? lastName = null,Object? gender = null,Object? yearOfBirth = null,Object? showYearOfBirthPicker = null,Object? showLevelPicker = null,Object? isContinuePressed = null,Object? isBackPressed = null,}) {
  return _then(_EditState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,showGradePicker: null == showGradePicker ? _self.showGradePicker : showGradePicker // ignore: cast_nullable_to_non_nullable
as bool,selectedLevel: freezed == selectedLevel ? _self.selectedLevel : selectedLevel // ignore: cast_nullable_to_non_nullable
as Levels?,levels: null == levels ? _self._levels : levels // ignore: cast_nullable_to_non_nullable
as List<Levels>,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,yearOfBirth: null == yearOfBirth ? _self.yearOfBirth : yearOfBirth // ignore: cast_nullable_to_non_nullable
as int,showYearOfBirthPicker: null == showYearOfBirthPicker ? _self.showYearOfBirthPicker : showYearOfBirthPicker // ignore: cast_nullable_to_non_nullable
as bool,showLevelPicker: null == showLevelPicker ? _self.showLevelPicker : showLevelPicker // ignore: cast_nullable_to_non_nullable
as bool,isContinuePressed: null == isContinuePressed ? _self.isContinuePressed : isContinuePressed // ignore: cast_nullable_to_non_nullable
as bool,isBackPressed: null == isBackPressed ? _self.isBackPressed : isBackPressed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
