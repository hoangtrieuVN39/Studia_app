// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_fav_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterFavEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterFavEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterFavEvent()';
}


}

/// @nodoc
class $RegisterFavEventCopyWith<$Res>  {
$RegisterFavEventCopyWith(RegisterFavEvent _, $Res Function(RegisterFavEvent) __);
}


/// @nodoc


class Initial implements RegisterFavEvent {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterFavEvent.initial()';
}


}




/// @nodoc


class DomainSelected implements RegisterFavEvent {
  const DomainSelected(this.domain);
  

 final  Domains domain;

/// Create a copy of RegisterFavEvent
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
  return 'RegisterFavEvent.domainSelected(domain: $domain)';
}


}

/// @nodoc
abstract mixin class $DomainSelectedCopyWith<$Res> implements $RegisterFavEventCopyWith<$Res> {
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

/// Create a copy of RegisterFavEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? domain = null,}) {
  return _then(DomainSelected(
null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as Domains,
  ));
}


}

/// @nodoc


class DomainUnselected implements RegisterFavEvent {
  const DomainUnselected(this.domain);
  

 final  Domains domain;

/// Create a copy of RegisterFavEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DomainUnselectedCopyWith<DomainUnselected> get copyWith => _$DomainUnselectedCopyWithImpl<DomainUnselected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DomainUnselected&&(identical(other.domain, domain) || other.domain == domain));
}


@override
int get hashCode => Object.hash(runtimeType,domain);

@override
String toString() {
  return 'RegisterFavEvent.domainUnselected(domain: $domain)';
}


}

/// @nodoc
abstract mixin class $DomainUnselectedCopyWith<$Res> implements $RegisterFavEventCopyWith<$Res> {
  factory $DomainUnselectedCopyWith(DomainUnselected value, $Res Function(DomainUnselected) _then) = _$DomainUnselectedCopyWithImpl;
@useResult
$Res call({
 Domains domain
});




}
/// @nodoc
class _$DomainUnselectedCopyWithImpl<$Res>
    implements $DomainUnselectedCopyWith<$Res> {
  _$DomainUnselectedCopyWithImpl(this._self, this._then);

  final DomainUnselected _self;
  final $Res Function(DomainUnselected) _then;

/// Create a copy of RegisterFavEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? domain = null,}) {
  return _then(DomainUnselected(
null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as Domains,
  ));
}


}

/// @nodoc


class ContinuePressed implements RegisterFavEvent {
  const ContinuePressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContinuePressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterFavEvent.continuePressed()';
}


}




/// @nodoc
mixin _$RegisterFavState {

 List<Domains> get domains; List<Domains> get selectedDomains; bool get isLoading; bool get isError; String get message; bool get isContinuePressed;
/// Create a copy of RegisterFavState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterFavStateCopyWith<RegisterFavState> get copyWith => _$RegisterFavStateCopyWithImpl<RegisterFavState>(this as RegisterFavState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterFavState&&const DeepCollectionEquality().equals(other.domains, domains)&&const DeepCollectionEquality().equals(other.selectedDomains, selectedDomains)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&(identical(other.isContinuePressed, isContinuePressed) || other.isContinuePressed == isContinuePressed));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(domains),const DeepCollectionEquality().hash(selectedDomains),isLoading,isError,message,isContinuePressed);

@override
String toString() {
  return 'RegisterFavState(domains: $domains, selectedDomains: $selectedDomains, isLoading: $isLoading, isError: $isError, message: $message, isContinuePressed: $isContinuePressed)';
}


}

/// @nodoc
abstract mixin class $RegisterFavStateCopyWith<$Res>  {
  factory $RegisterFavStateCopyWith(RegisterFavState value, $Res Function(RegisterFavState) _then) = _$RegisterFavStateCopyWithImpl;
@useResult
$Res call({
 List<Domains> domains, List<Domains> selectedDomains, bool isLoading, bool isError, String message, bool isContinuePressed
});




}
/// @nodoc
class _$RegisterFavStateCopyWithImpl<$Res>
    implements $RegisterFavStateCopyWith<$Res> {
  _$RegisterFavStateCopyWithImpl(this._self, this._then);

  final RegisterFavState _self;
  final $Res Function(RegisterFavState) _then;

/// Create a copy of RegisterFavState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domains = null,Object? selectedDomains = null,Object? isLoading = null,Object? isError = null,Object? message = null,Object? isContinuePressed = null,}) {
  return _then(_self.copyWith(
domains: null == domains ? _self.domains : domains // ignore: cast_nullable_to_non_nullable
as List<Domains>,selectedDomains: null == selectedDomains ? _self.selectedDomains : selectedDomains // ignore: cast_nullable_to_non_nullable
as List<Domains>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isContinuePressed: null == isContinuePressed ? _self.isContinuePressed : isContinuePressed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _RegisterFavState implements RegisterFavState {
   _RegisterFavState({final  List<Domains> domains = const [], final  List<Domains> selectedDomains = const [], this.isLoading = false, this.isError = false, this.message = '', this.isContinuePressed = false}): _domains = domains,_selectedDomains = selectedDomains;
  

 final  List<Domains> _domains;
@override@JsonKey() List<Domains> get domains {
  if (_domains is EqualUnmodifiableListView) return _domains;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_domains);
}

 final  List<Domains> _selectedDomains;
@override@JsonKey() List<Domains> get selectedDomains {
  if (_selectedDomains is EqualUnmodifiableListView) return _selectedDomains;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedDomains);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isError;
@override@JsonKey() final  String message;
@override@JsonKey() final  bool isContinuePressed;

/// Create a copy of RegisterFavState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterFavStateCopyWith<_RegisterFavState> get copyWith => __$RegisterFavStateCopyWithImpl<_RegisterFavState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterFavState&&const DeepCollectionEquality().equals(other._domains, _domains)&&const DeepCollectionEquality().equals(other._selectedDomains, _selectedDomains)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&(identical(other.isContinuePressed, isContinuePressed) || other.isContinuePressed == isContinuePressed));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_domains),const DeepCollectionEquality().hash(_selectedDomains),isLoading,isError,message,isContinuePressed);

@override
String toString() {
  return 'RegisterFavState(domains: $domains, selectedDomains: $selectedDomains, isLoading: $isLoading, isError: $isError, message: $message, isContinuePressed: $isContinuePressed)';
}


}

/// @nodoc
abstract mixin class _$RegisterFavStateCopyWith<$Res> implements $RegisterFavStateCopyWith<$Res> {
  factory _$RegisterFavStateCopyWith(_RegisterFavState value, $Res Function(_RegisterFavState) _then) = __$RegisterFavStateCopyWithImpl;
@override @useResult
$Res call({
 List<Domains> domains, List<Domains> selectedDomains, bool isLoading, bool isError, String message, bool isContinuePressed
});




}
/// @nodoc
class __$RegisterFavStateCopyWithImpl<$Res>
    implements _$RegisterFavStateCopyWith<$Res> {
  __$RegisterFavStateCopyWithImpl(this._self, this._then);

  final _RegisterFavState _self;
  final $Res Function(_RegisterFavState) _then;

/// Create a copy of RegisterFavState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domains = null,Object? selectedDomains = null,Object? isLoading = null,Object? isError = null,Object? message = null,Object? isContinuePressed = null,}) {
  return _then(_RegisterFavState(
domains: null == domains ? _self._domains : domains // ignore: cast_nullable_to_non_nullable
as List<Domains>,selectedDomains: null == selectedDomains ? _self._selectedDomains : selectedDomains // ignore: cast_nullable_to_non_nullable
as List<Domains>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isContinuePressed: null == isContinuePressed ? _self.isContinuePressed : isContinuePressed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
