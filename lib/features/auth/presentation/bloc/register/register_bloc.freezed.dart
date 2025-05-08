// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent()';
}


}

/// @nodoc
class $RegisterEventCopyWith<$Res>  {
$RegisterEventCopyWith(RegisterEvent _, $Res Function(RegisterEvent) __);
}


/// @nodoc


class Initial implements RegisterEvent {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.initial()';
}


}




/// @nodoc


class PickGradeRequested implements RegisterEvent {
  const PickGradeRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickGradeRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.pickGradeRequested()';
}


}




/// @nodoc


class PickYearOfBirthRequested implements RegisterEvent {
  const PickYearOfBirthRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickYearOfBirthRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.pickYearOfBirthRequested()';
}


}




/// @nodoc


class YobSelected implements RegisterEvent {
  const YobSelected(this.year);
  

 final  int year;

/// Create a copy of RegisterEvent
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
  return 'RegisterEvent.yobSelected(year: $year)';
}


}

/// @nodoc
abstract mixin class $YobSelectedCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
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

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? year = null,}) {
  return _then(YobSelected(
null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class GradeSelected implements RegisterEvent {
  const GradeSelected(this.level);
  

 final  Levels level;

/// Create a copy of RegisterEvent
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
  return 'RegisterEvent.gradeSelected(level: $level)';
}


}

/// @nodoc
abstract mixin class $GradeSelectedCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
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

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? level = null,}) {
  return _then(GradeSelected(
null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as Levels,
  ));
}


}

/// @nodoc


class ContinuePressed implements RegisterEvent {
  const ContinuePressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContinuePressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.continuePressed()';
}


}




/// @nodoc


class SetGender implements RegisterEvent {
  const SetGender(this.gender);
  

 final  Gender gender;

/// Create a copy of RegisterEvent
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
  return 'RegisterEvent.setGender(gender: $gender)';
}


}

/// @nodoc
abstract mixin class $SetGenderCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
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

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? gender = null,}) {
  return _then(SetGender(
null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,
  ));
}


}

/// @nodoc


class SetFirstName implements RegisterEvent {
  const SetFirstName(this.firstName);
  

 final  String firstName;

/// Create a copy of RegisterEvent
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
  return 'RegisterEvent.setFirstName(firstName: $firstName)';
}


}

/// @nodoc
abstract mixin class $SetFirstNameCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
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

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? firstName = null,}) {
  return _then(SetFirstName(
null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SetLastName implements RegisterEvent {
  const SetLastName(this.lastName);
  

 final  String lastName;

/// Create a copy of RegisterEvent
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
  return 'RegisterEvent.setLastName(lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class $SetLastNameCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
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

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lastName = null,}) {
  return _then(SetLastName(
null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class BackPressed implements RegisterEvent {
  const BackPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.backPressed()';
}


}




/// @nodoc
mixin _$RegisterState {

 bool get isLoading; bool get isError; String get message; bool get showGradePicker; Levels? get selectedLevel; List<Levels> get levels; String get firstName; String get lastName; Gender get gender; int get yearOfBirth; bool get showYearOfBirthPicker; bool get showLevelPicker; bool get isContinuePressed; bool get isBackPressed;
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterStateCopyWith<RegisterState> get copyWith => _$RegisterStateCopyWithImpl<RegisterState>(this as RegisterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&(identical(other.showGradePicker, showGradePicker) || other.showGradePicker == showGradePicker)&&(identical(other.selectedLevel, selectedLevel) || other.selectedLevel == selectedLevel)&&const DeepCollectionEquality().equals(other.levels, levels)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.yearOfBirth, yearOfBirth) || other.yearOfBirth == yearOfBirth)&&(identical(other.showYearOfBirthPicker, showYearOfBirthPicker) || other.showYearOfBirthPicker == showYearOfBirthPicker)&&(identical(other.showLevelPicker, showLevelPicker) || other.showLevelPicker == showLevelPicker)&&(identical(other.isContinuePressed, isContinuePressed) || other.isContinuePressed == isContinuePressed)&&(identical(other.isBackPressed, isBackPressed) || other.isBackPressed == isBackPressed));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,showGradePicker,selectedLevel,const DeepCollectionEquality().hash(levels),firstName,lastName,gender,yearOfBirth,showYearOfBirthPicker,showLevelPicker,isContinuePressed,isBackPressed);

@override
String toString() {
  return 'RegisterState(isLoading: $isLoading, isError: $isError, message: $message, showGradePicker: $showGradePicker, selectedLevel: $selectedLevel, levels: $levels, firstName: $firstName, lastName: $lastName, gender: $gender, yearOfBirth: $yearOfBirth, showYearOfBirthPicker: $showYearOfBirthPicker, showLevelPicker: $showLevelPicker, isContinuePressed: $isContinuePressed, isBackPressed: $isBackPressed)';
}


}

/// @nodoc
abstract mixin class $RegisterStateCopyWith<$Res>  {
  factory $RegisterStateCopyWith(RegisterState value, $Res Function(RegisterState) _then) = _$RegisterStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isError, String message, bool showGradePicker, Levels? selectedLevel, List<Levels> levels, String firstName, String lastName, Gender gender, int yearOfBirth, bool showYearOfBirthPicker, bool showLevelPicker, bool isContinuePressed, bool isBackPressed
});




}
/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._self, this._then);

  final RegisterState _self;
  final $Res Function(RegisterState) _then;

/// Create a copy of RegisterState
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


class _RegisterState implements RegisterState {
  const _RegisterState({this.isLoading = false, this.isError = false, this.message = '', this.showGradePicker = false, this.selectedLevel = null, final  List<Levels> levels = const [], this.firstName = '', this.lastName = '', this.gender = Gender.Male, this.yearOfBirth = AppTextConstants.yearOfBirthDefault, this.showYearOfBirthPicker = false, this.showLevelPicker = false, this.isContinuePressed = false, this.isBackPressed = false}): _levels = levels;
  

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

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterStateCopyWith<_RegisterState> get copyWith => __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&(identical(other.showGradePicker, showGradePicker) || other.showGradePicker == showGradePicker)&&(identical(other.selectedLevel, selectedLevel) || other.selectedLevel == selectedLevel)&&const DeepCollectionEquality().equals(other._levels, _levels)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.yearOfBirth, yearOfBirth) || other.yearOfBirth == yearOfBirth)&&(identical(other.showYearOfBirthPicker, showYearOfBirthPicker) || other.showYearOfBirthPicker == showYearOfBirthPicker)&&(identical(other.showLevelPicker, showLevelPicker) || other.showLevelPicker == showLevelPicker)&&(identical(other.isContinuePressed, isContinuePressed) || other.isContinuePressed == isContinuePressed)&&(identical(other.isBackPressed, isBackPressed) || other.isBackPressed == isBackPressed));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,showGradePicker,selectedLevel,const DeepCollectionEquality().hash(_levels),firstName,lastName,gender,yearOfBirth,showYearOfBirthPicker,showLevelPicker,isContinuePressed,isBackPressed);

@override
String toString() {
  return 'RegisterState(isLoading: $isLoading, isError: $isError, message: $message, showGradePicker: $showGradePicker, selectedLevel: $selectedLevel, levels: $levels, firstName: $firstName, lastName: $lastName, gender: $gender, yearOfBirth: $yearOfBirth, showYearOfBirthPicker: $showYearOfBirthPicker, showLevelPicker: $showLevelPicker, isContinuePressed: $isContinuePressed, isBackPressed: $isBackPressed)';
}


}

/// @nodoc
abstract mixin class _$RegisterStateCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(_RegisterState value, $Res Function(_RegisterState) _then) = __$RegisterStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isError, String message, bool showGradePicker, Levels? selectedLevel, List<Levels> levels, String firstName, String lastName, Gender gender, int yearOfBirth, bool showYearOfBirthPicker, bool showLevelPicker, bool isContinuePressed, bool isBackPressed
});




}
/// @nodoc
class __$RegisterStateCopyWithImpl<$Res>
    implements _$RegisterStateCopyWith<$Res> {
  __$RegisterStateCopyWithImpl(this._self, this._then);

  final _RegisterState _self;
  final $Res Function(_RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? showGradePicker = null,Object? selectedLevel = freezed,Object? levels = null,Object? firstName = null,Object? lastName = null,Object? gender = null,Object? yearOfBirth = null,Object? showYearOfBirthPicker = null,Object? showLevelPicker = null,Object? isContinuePressed = null,Object? isBackPressed = null,}) {
  return _then(_RegisterState(
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
