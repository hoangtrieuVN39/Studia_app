// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'play_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent()';
}


}

/// @nodoc
class $PlayEventCopyWith<$Res>  {
$PlayEventCopyWith(PlayEvent _, $Res Function(PlayEvent) __);
}


/// @nodoc


class Initial implements PlayEvent {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent.initial()';
}


}




/// @nodoc


class SelectChoice implements PlayEvent {
  const SelectChoice(this.index);
  

 final  int index;

/// Create a copy of PlayEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectChoiceCopyWith<SelectChoice> get copyWith => _$SelectChoiceCopyWithImpl<SelectChoice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectChoice&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'PlayEvent.selectChoice(index: $index)';
}


}

/// @nodoc
abstract mixin class $SelectChoiceCopyWith<$Res> implements $PlayEventCopyWith<$Res> {
  factory $SelectChoiceCopyWith(SelectChoice value, $Res Function(SelectChoice) _then) = _$SelectChoiceCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class _$SelectChoiceCopyWithImpl<$Res>
    implements $SelectChoiceCopyWith<$Res> {
  _$SelectChoiceCopyWithImpl(this._self, this._then);

  final SelectChoice _self;
  final $Res Function(SelectChoice) _then;

/// Create a copy of PlayEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(SelectChoice(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class Submit implements PlayEvent {
  const Submit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Submit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent.submit()';
}


}




/// @nodoc


class ViewSolution implements PlayEvent {
  const ViewSolution();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewSolution);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent.viewSolution()';
}


}




/// @nodoc


class NextQuestion implements PlayEvent {
  const NextQuestion();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NextQuestion);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent.nextQuestion()';
}


}




/// @nodoc


class Done implements PlayEvent {
  const Done();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Done);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent.done()';
}


}




/// @nodoc


class ViewResults implements PlayEvent {
  const ViewResults();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewResults);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent.viewResults()';
}


}




/// @nodoc


class Quit implements PlayEvent {
  const Quit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Quit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent.quit()';
}


}




/// @nodoc


class PlayAgain implements PlayEvent {
  const PlayAgain();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayAgain);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent.playAgain()';
}


}




/// @nodoc


class QuitConfirmed implements PlayEvent {
  const QuitConfirmed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuitConfirmed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent.quitConfirmed()';
}


}




/// @nodoc
mixin _$PlayState {

 bool get isLoading; bool get isError; String get message; List<Question> get questions; List<int> get selectedChoices; int get currentQuestionIndex; bool get isViewingSolution; bool get isDone; bool get isNextQuestion; bool get isSubmit; bool get isViewingResults; bool get isQuit; bool get isQuitConfirmed; bool get isPlayAgain;
/// Create a copy of PlayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayStateCopyWith<PlayState> get copyWith => _$PlayStateCopyWithImpl<PlayState>(this as PlayState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.questions, questions)&&const DeepCollectionEquality().equals(other.selectedChoices, selectedChoices)&&(identical(other.currentQuestionIndex, currentQuestionIndex) || other.currentQuestionIndex == currentQuestionIndex)&&(identical(other.isViewingSolution, isViewingSolution) || other.isViewingSolution == isViewingSolution)&&(identical(other.isDone, isDone) || other.isDone == isDone)&&(identical(other.isNextQuestion, isNextQuestion) || other.isNextQuestion == isNextQuestion)&&(identical(other.isSubmit, isSubmit) || other.isSubmit == isSubmit)&&(identical(other.isViewingResults, isViewingResults) || other.isViewingResults == isViewingResults)&&(identical(other.isQuit, isQuit) || other.isQuit == isQuit)&&(identical(other.isQuitConfirmed, isQuitConfirmed) || other.isQuitConfirmed == isQuitConfirmed)&&(identical(other.isPlayAgain, isPlayAgain) || other.isPlayAgain == isPlayAgain));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,const DeepCollectionEquality().hash(questions),const DeepCollectionEquality().hash(selectedChoices),currentQuestionIndex,isViewingSolution,isDone,isNextQuestion,isSubmit,isViewingResults,isQuit,isQuitConfirmed,isPlayAgain);

@override
String toString() {
  return 'PlayState(isLoading: $isLoading, isError: $isError, message: $message, questions: $questions, selectedChoices: $selectedChoices, currentQuestionIndex: $currentQuestionIndex, isViewingSolution: $isViewingSolution, isDone: $isDone, isNextQuestion: $isNextQuestion, isSubmit: $isSubmit, isViewingResults: $isViewingResults, isQuit: $isQuit, isQuitConfirmed: $isQuitConfirmed, isPlayAgain: $isPlayAgain)';
}


}

/// @nodoc
abstract mixin class $PlayStateCopyWith<$Res>  {
  factory $PlayStateCopyWith(PlayState value, $Res Function(PlayState) _then) = _$PlayStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isError, String message, List<Question> questions, List<int> selectedChoices, int currentQuestionIndex, bool isViewingSolution, bool isDone, bool isNextQuestion, bool isSubmit, bool isViewingResults, bool isQuit, bool isQuitConfirmed, bool isPlayAgain
});




}
/// @nodoc
class _$PlayStateCopyWithImpl<$Res>
    implements $PlayStateCopyWith<$Res> {
  _$PlayStateCopyWithImpl(this._self, this._then);

  final PlayState _self;
  final $Res Function(PlayState) _then;

/// Create a copy of PlayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? questions = null,Object? selectedChoices = null,Object? currentQuestionIndex = null,Object? isViewingSolution = null,Object? isDone = null,Object? isNextQuestion = null,Object? isSubmit = null,Object? isViewingResults = null,Object? isQuit = null,Object? isQuitConfirmed = null,Object? isPlayAgain = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,selectedChoices: null == selectedChoices ? _self.selectedChoices : selectedChoices // ignore: cast_nullable_to_non_nullable
as List<int>,currentQuestionIndex: null == currentQuestionIndex ? _self.currentQuestionIndex : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
as int,isViewingSolution: null == isViewingSolution ? _self.isViewingSolution : isViewingSolution // ignore: cast_nullable_to_non_nullable
as bool,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,isNextQuestion: null == isNextQuestion ? _self.isNextQuestion : isNextQuestion // ignore: cast_nullable_to_non_nullable
as bool,isSubmit: null == isSubmit ? _self.isSubmit : isSubmit // ignore: cast_nullable_to_non_nullable
as bool,isViewingResults: null == isViewingResults ? _self.isViewingResults : isViewingResults // ignore: cast_nullable_to_non_nullable
as bool,isQuit: null == isQuit ? _self.isQuit : isQuit // ignore: cast_nullable_to_non_nullable
as bool,isQuitConfirmed: null == isQuitConfirmed ? _self.isQuitConfirmed : isQuitConfirmed // ignore: cast_nullable_to_non_nullable
as bool,isPlayAgain: null == isPlayAgain ? _self.isPlayAgain : isPlayAgain // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _PlayState implements PlayState {
   _PlayState({this.isLoading = false, this.isError = false, this.message = '', final  List<Question> questions = const [], final  List<int> selectedChoices = const [], this.currentQuestionIndex = 0, this.isViewingSolution = false, this.isDone = false, this.isNextQuestion = false, this.isSubmit = false, this.isViewingResults = false, this.isQuit = false, this.isQuitConfirmed = false, this.isPlayAgain = false}): _questions = questions,_selectedChoices = selectedChoices;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isError;
@override@JsonKey() final  String message;
 final  List<Question> _questions;
@override@JsonKey() List<Question> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

 final  List<int> _selectedChoices;
@override@JsonKey() List<int> get selectedChoices {
  if (_selectedChoices is EqualUnmodifiableListView) return _selectedChoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedChoices);
}

@override@JsonKey() final  int currentQuestionIndex;
@override@JsonKey() final  bool isViewingSolution;
@override@JsonKey() final  bool isDone;
@override@JsonKey() final  bool isNextQuestion;
@override@JsonKey() final  bool isSubmit;
@override@JsonKey() final  bool isViewingResults;
@override@JsonKey() final  bool isQuit;
@override@JsonKey() final  bool isQuitConfirmed;
@override@JsonKey() final  bool isPlayAgain;

/// Create a copy of PlayState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayStateCopyWith<_PlayState> get copyWith => __$PlayStateCopyWithImpl<_PlayState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._questions, _questions)&&const DeepCollectionEquality().equals(other._selectedChoices, _selectedChoices)&&(identical(other.currentQuestionIndex, currentQuestionIndex) || other.currentQuestionIndex == currentQuestionIndex)&&(identical(other.isViewingSolution, isViewingSolution) || other.isViewingSolution == isViewingSolution)&&(identical(other.isDone, isDone) || other.isDone == isDone)&&(identical(other.isNextQuestion, isNextQuestion) || other.isNextQuestion == isNextQuestion)&&(identical(other.isSubmit, isSubmit) || other.isSubmit == isSubmit)&&(identical(other.isViewingResults, isViewingResults) || other.isViewingResults == isViewingResults)&&(identical(other.isQuit, isQuit) || other.isQuit == isQuit)&&(identical(other.isQuitConfirmed, isQuitConfirmed) || other.isQuitConfirmed == isQuitConfirmed)&&(identical(other.isPlayAgain, isPlayAgain) || other.isPlayAgain == isPlayAgain));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,const DeepCollectionEquality().hash(_questions),const DeepCollectionEquality().hash(_selectedChoices),currentQuestionIndex,isViewingSolution,isDone,isNextQuestion,isSubmit,isViewingResults,isQuit,isQuitConfirmed,isPlayAgain);

@override
String toString() {
  return 'PlayState(isLoading: $isLoading, isError: $isError, message: $message, questions: $questions, selectedChoices: $selectedChoices, currentQuestionIndex: $currentQuestionIndex, isViewingSolution: $isViewingSolution, isDone: $isDone, isNextQuestion: $isNextQuestion, isSubmit: $isSubmit, isViewingResults: $isViewingResults, isQuit: $isQuit, isQuitConfirmed: $isQuitConfirmed, isPlayAgain: $isPlayAgain)';
}


}

/// @nodoc
abstract mixin class _$PlayStateCopyWith<$Res> implements $PlayStateCopyWith<$Res> {
  factory _$PlayStateCopyWith(_PlayState value, $Res Function(_PlayState) _then) = __$PlayStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isError, String message, List<Question> questions, List<int> selectedChoices, int currentQuestionIndex, bool isViewingSolution, bool isDone, bool isNextQuestion, bool isSubmit, bool isViewingResults, bool isQuit, bool isQuitConfirmed, bool isPlayAgain
});




}
/// @nodoc
class __$PlayStateCopyWithImpl<$Res>
    implements _$PlayStateCopyWith<$Res> {
  __$PlayStateCopyWithImpl(this._self, this._then);

  final _PlayState _self;
  final $Res Function(_PlayState) _then;

/// Create a copy of PlayState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? questions = null,Object? selectedChoices = null,Object? currentQuestionIndex = null,Object? isViewingSolution = null,Object? isDone = null,Object? isNextQuestion = null,Object? isSubmit = null,Object? isViewingResults = null,Object? isQuit = null,Object? isQuitConfirmed = null,Object? isPlayAgain = null,}) {
  return _then(_PlayState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,selectedChoices: null == selectedChoices ? _self._selectedChoices : selectedChoices // ignore: cast_nullable_to_non_nullable
as List<int>,currentQuestionIndex: null == currentQuestionIndex ? _self.currentQuestionIndex : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
as int,isViewingSolution: null == isViewingSolution ? _self.isViewingSolution : isViewingSolution // ignore: cast_nullable_to_non_nullable
as bool,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,isNextQuestion: null == isNextQuestion ? _self.isNextQuestion : isNextQuestion // ignore: cast_nullable_to_non_nullable
as bool,isSubmit: null == isSubmit ? _self.isSubmit : isSubmit // ignore: cast_nullable_to_non_nullable
as bool,isViewingResults: null == isViewingResults ? _self.isViewingResults : isViewingResults // ignore: cast_nullable_to_non_nullable
as bool,isQuit: null == isQuit ? _self.isQuit : isQuit // ignore: cast_nullable_to_non_nullable
as bool,isQuitConfirmed: null == isQuitConfirmed ? _self.isQuitConfirmed : isQuitConfirmed // ignore: cast_nullable_to_non_nullable
as bool,isPlayAgain: null == isPlayAgain ? _self.isPlayAgain : isPlayAgain // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
