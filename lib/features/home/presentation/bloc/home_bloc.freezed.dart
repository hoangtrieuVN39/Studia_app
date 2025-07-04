// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// @nodoc


class Initial implements HomeEvent {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.initial()';
}


}




/// @nodoc


class StandardNodeTapped implements HomeEvent {
  const StandardNodeTapped(this.selectedStandard);
  

 final  Standards selectedStandard;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandardNodeTappedCopyWith<StandardNodeTapped> get copyWith => _$StandardNodeTappedCopyWithImpl<StandardNodeTapped>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandardNodeTapped&&(identical(other.selectedStandard, selectedStandard) || other.selectedStandard == selectedStandard));
}


@override
int get hashCode => Object.hash(runtimeType,selectedStandard);

@override
String toString() {
  return 'HomeEvent.standardNodeTapped(selectedStandard: $selectedStandard)';
}


}

/// @nodoc
abstract mixin class $StandardNodeTappedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $StandardNodeTappedCopyWith(StandardNodeTapped value, $Res Function(StandardNodeTapped) _then) = _$StandardNodeTappedCopyWithImpl;
@useResult
$Res call({
 Standards selectedStandard
});




}
/// @nodoc
class _$StandardNodeTappedCopyWithImpl<$Res>
    implements $StandardNodeTappedCopyWith<$Res> {
  _$StandardNodeTappedCopyWithImpl(this._self, this._then);

  final StandardNodeTapped _self;
  final $Res Function(StandardNodeTapped) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedStandard = null,}) {
  return _then(StandardNodeTapped(
null == selectedStandard ? _self.selectedStandard : selectedStandard // ignore: cast_nullable_to_non_nullable
as Standards,
  ));
}


}

/// @nodoc


class OnPlayButtonTapped implements HomeEvent {
  const OnPlayButtonTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnPlayButtonTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onPlayButtonTapped()';
}


}




/// @nodoc


class OnViewInfoButtonTapped implements HomeEvent {
  const OnViewInfoButtonTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnViewInfoButtonTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onViewInfoButtonTapped()';
}


}




/// @nodoc
mixin _$HomeState {

 bool get isLoading; bool get isError; String get message; Standards? get selectedStandard; Map<Standards, double> get standards_performance; bool get isPlayTapped; bool get isViewInfoTapped; bool get isFirstPlay; List<Question> get questions; List<int> get validActions; int get recommendActions;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&(identical(other.selectedStandard, selectedStandard) || other.selectedStandard == selectedStandard)&&const DeepCollectionEquality().equals(other.standards_performance, standards_performance)&&(identical(other.isPlayTapped, isPlayTapped) || other.isPlayTapped == isPlayTapped)&&(identical(other.isViewInfoTapped, isViewInfoTapped) || other.isViewInfoTapped == isViewInfoTapped)&&(identical(other.isFirstPlay, isFirstPlay) || other.isFirstPlay == isFirstPlay)&&const DeepCollectionEquality().equals(other.questions, questions)&&const DeepCollectionEquality().equals(other.validActions, validActions)&&(identical(other.recommendActions, recommendActions) || other.recommendActions == recommendActions));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,selectedStandard,const DeepCollectionEquality().hash(standards_performance),isPlayTapped,isViewInfoTapped,isFirstPlay,const DeepCollectionEquality().hash(questions),const DeepCollectionEquality().hash(validActions),recommendActions);

@override
String toString() {
  return 'HomeState(isLoading: $isLoading, isError: $isError, message: $message, selectedStandard: $selectedStandard, standards_performance: $standards_performance, isPlayTapped: $isPlayTapped, isViewInfoTapped: $isViewInfoTapped, isFirstPlay: $isFirstPlay, questions: $questions, validActions: $validActions, recommendActions: $recommendActions)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isError, String message, Standards? selectedStandard, Map<Standards, double> standards_performance, bool isPlayTapped, bool isViewInfoTapped, bool isFirstPlay, List<Question> questions, List<int> validActions, int recommendActions
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? selectedStandard = freezed,Object? standards_performance = null,Object? isPlayTapped = null,Object? isViewInfoTapped = null,Object? isFirstPlay = null,Object? questions = null,Object? validActions = null,Object? recommendActions = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,selectedStandard: freezed == selectedStandard ? _self.selectedStandard : selectedStandard // ignore: cast_nullable_to_non_nullable
as Standards?,standards_performance: null == standards_performance ? _self.standards_performance : standards_performance // ignore: cast_nullable_to_non_nullable
as Map<Standards, double>,isPlayTapped: null == isPlayTapped ? _self.isPlayTapped : isPlayTapped // ignore: cast_nullable_to_non_nullable
as bool,isViewInfoTapped: null == isViewInfoTapped ? _self.isViewInfoTapped : isViewInfoTapped // ignore: cast_nullable_to_non_nullable
as bool,isFirstPlay: null == isFirstPlay ? _self.isFirstPlay : isFirstPlay // ignore: cast_nullable_to_non_nullable
as bool,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,validActions: null == validActions ? _self.validActions : validActions // ignore: cast_nullable_to_non_nullable
as List<int>,recommendActions: null == recommendActions ? _self.recommendActions : recommendActions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.isLoading = false, this.isError = false, this.message = '', this.selectedStandard = null, final  Map<Standards, double> standards_performance = const {}, this.isPlayTapped = false, this.isViewInfoTapped = false, this.isFirstPlay = false, final  List<Question> questions = const [], final  List<int> validActions = const [], this.recommendActions = 0}): _standards_performance = standards_performance,_questions = questions,_validActions = validActions;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isError;
@override@JsonKey() final  String message;
@override@JsonKey() final  Standards? selectedStandard;
 final  Map<Standards, double> _standards_performance;
@override@JsonKey() Map<Standards, double> get standards_performance {
  if (_standards_performance is EqualUnmodifiableMapView) return _standards_performance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_standards_performance);
}

@override@JsonKey() final  bool isPlayTapped;
@override@JsonKey() final  bool isViewInfoTapped;
@override@JsonKey() final  bool isFirstPlay;
 final  List<Question> _questions;
@override@JsonKey() List<Question> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

 final  List<int> _validActions;
@override@JsonKey() List<int> get validActions {
  if (_validActions is EqualUnmodifiableListView) return _validActions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_validActions);
}

@override@JsonKey() final  int recommendActions;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&(identical(other.selectedStandard, selectedStandard) || other.selectedStandard == selectedStandard)&&const DeepCollectionEquality().equals(other._standards_performance, _standards_performance)&&(identical(other.isPlayTapped, isPlayTapped) || other.isPlayTapped == isPlayTapped)&&(identical(other.isViewInfoTapped, isViewInfoTapped) || other.isViewInfoTapped == isViewInfoTapped)&&(identical(other.isFirstPlay, isFirstPlay) || other.isFirstPlay == isFirstPlay)&&const DeepCollectionEquality().equals(other._questions, _questions)&&const DeepCollectionEquality().equals(other._validActions, _validActions)&&(identical(other.recommendActions, recommendActions) || other.recommendActions == recommendActions));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,selectedStandard,const DeepCollectionEquality().hash(_standards_performance),isPlayTapped,isViewInfoTapped,isFirstPlay,const DeepCollectionEquality().hash(_questions),const DeepCollectionEquality().hash(_validActions),recommendActions);

@override
String toString() {
  return 'HomeState(isLoading: $isLoading, isError: $isError, message: $message, selectedStandard: $selectedStandard, standards_performance: $standards_performance, isPlayTapped: $isPlayTapped, isViewInfoTapped: $isViewInfoTapped, isFirstPlay: $isFirstPlay, questions: $questions, validActions: $validActions, recommendActions: $recommendActions)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isError, String message, Standards? selectedStandard, Map<Standards, double> standards_performance, bool isPlayTapped, bool isViewInfoTapped, bool isFirstPlay, List<Question> questions, List<int> validActions, int recommendActions
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? selectedStandard = freezed,Object? standards_performance = null,Object? isPlayTapped = null,Object? isViewInfoTapped = null,Object? isFirstPlay = null,Object? questions = null,Object? validActions = null,Object? recommendActions = null,}) {
  return _then(_HomeState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,selectedStandard: freezed == selectedStandard ? _self.selectedStandard : selectedStandard // ignore: cast_nullable_to_non_nullable
as Standards?,standards_performance: null == standards_performance ? _self._standards_performance : standards_performance // ignore: cast_nullable_to_non_nullable
as Map<Standards, double>,isPlayTapped: null == isPlayTapped ? _self.isPlayTapped : isPlayTapped // ignore: cast_nullable_to_non_nullable
as bool,isViewInfoTapped: null == isViewInfoTapped ? _self.isViewInfoTapped : isViewInfoTapped // ignore: cast_nullable_to_non_nullable
as bool,isFirstPlay: null == isFirstPlay ? _self.isFirstPlay : isFirstPlay // ignore: cast_nullable_to_non_nullable
as bool,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,validActions: null == validActions ? _self._validActions : validActions // ignore: cast_nullable_to_non_nullable
as List<int>,recommendActions: null == recommendActions ? _self.recommendActions : recommendActions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
