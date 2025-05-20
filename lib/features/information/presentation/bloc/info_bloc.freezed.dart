// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InfoEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InfoEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InfoEvent()';
}


}

/// @nodoc
class $InfoEventCopyWith<$Res>  {
$InfoEventCopyWith(InfoEvent _, $Res Function(InfoEvent) __);
}


/// @nodoc


class Initial implements InfoEvent {
  const Initial(this.selected);
  

 final  dynamic selected;

/// Create a copy of InfoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial&&const DeepCollectionEquality().equals(other.selected, selected));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(selected));

@override
String toString() {
  return 'InfoEvent.initial(selected: $selected)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $InfoEventCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@useResult
$Res call({
 dynamic selected
});




}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of InfoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selected = freezed,}) {
  return _then(Initial(
freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class Select implements InfoEvent {
  const Select(this.selectedItem);
  

 final  dynamic selectedItem;

/// Create a copy of InfoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectCopyWith<Select> get copyWith => _$SelectCopyWithImpl<Select>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Select&&const DeepCollectionEquality().equals(other.selectedItem, selectedItem));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(selectedItem));

@override
String toString() {
  return 'InfoEvent.onSelect(selectedItem: $selectedItem)';
}


}

/// @nodoc
abstract mixin class $SelectCopyWith<$Res> implements $InfoEventCopyWith<$Res> {
  factory $SelectCopyWith(Select value, $Res Function(Select) _then) = _$SelectCopyWithImpl;
@useResult
$Res call({
 dynamic selectedItem
});




}
/// @nodoc
class _$SelectCopyWithImpl<$Res>
    implements $SelectCopyWith<$Res> {
  _$SelectCopyWithImpl(this._self, this._then);

  final Select _self;
  final $Res Function(Select) _then;

/// Create a copy of InfoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedItem = freezed,}) {
  return _then(Select(
freezed == selectedItem ? _self.selectedItem : selectedItem // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc
mixin _$InfoState {

 bool get isLoading; bool get isError; String get message; dynamic get selected; double? get progress; LevelFullDetails? get levelDetails; DomainFullDetails? get domainDetails; SkillFullDetails? get skillDetails; StandardFullDetails? get standardDetails;
/// Create a copy of InfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InfoStateCopyWith<InfoState> get copyWith => _$InfoStateCopyWithImpl<InfoState>(this as InfoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InfoState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.selected, selected)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.levelDetails, levelDetails) || other.levelDetails == levelDetails)&&(identical(other.domainDetails, domainDetails) || other.domainDetails == domainDetails)&&(identical(other.skillDetails, skillDetails) || other.skillDetails == skillDetails)&&(identical(other.standardDetails, standardDetails) || other.standardDetails == standardDetails));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,const DeepCollectionEquality().hash(selected),progress,levelDetails,domainDetails,skillDetails,standardDetails);

@override
String toString() {
  return 'InfoState(isLoading: $isLoading, isError: $isError, message: $message, selected: $selected, progress: $progress, levelDetails: $levelDetails, domainDetails: $domainDetails, skillDetails: $skillDetails, standardDetails: $standardDetails)';
}


}

/// @nodoc
abstract mixin class $InfoStateCopyWith<$Res>  {
  factory $InfoStateCopyWith(InfoState value, $Res Function(InfoState) _then) = _$InfoStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isError, String message, dynamic selected, double? progress, LevelFullDetails? levelDetails, DomainFullDetails? domainDetails, SkillFullDetails? skillDetails, StandardFullDetails? standardDetails
});




}
/// @nodoc
class _$InfoStateCopyWithImpl<$Res>
    implements $InfoStateCopyWith<$Res> {
  _$InfoStateCopyWithImpl(this._self, this._then);

  final InfoState _self;
  final $Res Function(InfoState) _then;

/// Create a copy of InfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? selected = freezed,Object? progress = freezed,Object? levelDetails = freezed,Object? domainDetails = freezed,Object? skillDetails = freezed,Object? standardDetails = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as dynamic,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double?,levelDetails: freezed == levelDetails ? _self.levelDetails : levelDetails // ignore: cast_nullable_to_non_nullable
as LevelFullDetails?,domainDetails: freezed == domainDetails ? _self.domainDetails : domainDetails // ignore: cast_nullable_to_non_nullable
as DomainFullDetails?,skillDetails: freezed == skillDetails ? _self.skillDetails : skillDetails // ignore: cast_nullable_to_non_nullable
as SkillFullDetails?,standardDetails: freezed == standardDetails ? _self.standardDetails : standardDetails // ignore: cast_nullable_to_non_nullable
as StandardFullDetails?,
  ));
}

}


/// @nodoc


class _InfoState implements InfoState {
  const _InfoState({this.isLoading = false, this.isError = false, this.message = '', this.selected = null, this.progress = null, this.levelDetails = null, this.domainDetails = null, this.skillDetails = null, this.standardDetails = null});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isError;
@override@JsonKey() final  String message;
@override@JsonKey() final  dynamic selected;
@override@JsonKey() final  double? progress;
@override@JsonKey() final  LevelFullDetails? levelDetails;
@override@JsonKey() final  DomainFullDetails? domainDetails;
@override@JsonKey() final  SkillFullDetails? skillDetails;
@override@JsonKey() final  StandardFullDetails? standardDetails;

/// Create a copy of InfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InfoStateCopyWith<_InfoState> get copyWith => __$InfoStateCopyWithImpl<_InfoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InfoState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.selected, selected)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.levelDetails, levelDetails) || other.levelDetails == levelDetails)&&(identical(other.domainDetails, domainDetails) || other.domainDetails == domainDetails)&&(identical(other.skillDetails, skillDetails) || other.skillDetails == skillDetails)&&(identical(other.standardDetails, standardDetails) || other.standardDetails == standardDetails));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,const DeepCollectionEquality().hash(selected),progress,levelDetails,domainDetails,skillDetails,standardDetails);

@override
String toString() {
  return 'InfoState(isLoading: $isLoading, isError: $isError, message: $message, selected: $selected, progress: $progress, levelDetails: $levelDetails, domainDetails: $domainDetails, skillDetails: $skillDetails, standardDetails: $standardDetails)';
}


}

/// @nodoc
abstract mixin class _$InfoStateCopyWith<$Res> implements $InfoStateCopyWith<$Res> {
  factory _$InfoStateCopyWith(_InfoState value, $Res Function(_InfoState) _then) = __$InfoStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isError, String message, dynamic selected, double? progress, LevelFullDetails? levelDetails, DomainFullDetails? domainDetails, SkillFullDetails? skillDetails, StandardFullDetails? standardDetails
});




}
/// @nodoc
class __$InfoStateCopyWithImpl<$Res>
    implements _$InfoStateCopyWith<$Res> {
  __$InfoStateCopyWithImpl(this._self, this._then);

  final _InfoState _self;
  final $Res Function(_InfoState) _then;

/// Create a copy of InfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? selected = freezed,Object? progress = freezed,Object? levelDetails = freezed,Object? domainDetails = freezed,Object? skillDetails = freezed,Object? standardDetails = freezed,}) {
  return _then(_InfoState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as dynamic,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double?,levelDetails: freezed == levelDetails ? _self.levelDetails : levelDetails // ignore: cast_nullable_to_non_nullable
as LevelFullDetails?,domainDetails: freezed == domainDetails ? _self.domainDetails : domainDetails // ignore: cast_nullable_to_non_nullable
as DomainFullDetails?,skillDetails: freezed == skillDetails ? _self.skillDetails : skillDetails // ignore: cast_nullable_to_non_nullable
as SkillFullDetails?,standardDetails: freezed == standardDetails ? _self.standardDetails : standardDetails // ignore: cast_nullable_to_non_nullable
as StandardFullDetails?,
  ));
}


}

// dart format on
