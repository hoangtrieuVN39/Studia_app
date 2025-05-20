// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent()';
}


}

/// @nodoc
class $ChatEventCopyWith<$Res>  {
$ChatEventCopyWith(ChatEvent _, $Res Function(ChatEvent) __);
}


/// @nodoc


class _Initial implements ChatEvent {
  const _Initial({this.groupId = 'default_group_id'});
  

@JsonKey() final  String groupId;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.groupId, groupId) || other.groupId == groupId));
}


@override
int get hashCode => Object.hash(runtimeType,groupId);

@override
String toString() {
  return 'ChatEvent.initial(groupId: $groupId)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@useResult
$Res call({
 String groupId
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? groupId = null,}) {
  return _then(_Initial(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _TextChanged implements ChatEvent {
  const _TextChanged(this.text);
  

 final  String text;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextChangedCopyWith<_TextChanged> get copyWith => __$TextChangedCopyWithImpl<_TextChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextChanged&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'ChatEvent.textChanged(text: $text)';
}


}

/// @nodoc
abstract mixin class _$TextChangedCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory _$TextChangedCopyWith(_TextChanged value, $Res Function(_TextChanged) _then) = __$TextChangedCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class __$TextChangedCopyWithImpl<$Res>
    implements _$TextChangedCopyWith<$Res> {
  __$TextChangedCopyWithImpl(this._self, this._then);

  final _TextChanged _self;
  final $Res Function(_TextChanged) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(_TextChanged(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SendMessage implements ChatEvent {
  const _SendMessage(this.messageContent);
  

 final  String messageContent;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMessageCopyWith<_SendMessage> get copyWith => __$SendMessageCopyWithImpl<_SendMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMessage&&(identical(other.messageContent, messageContent) || other.messageContent == messageContent));
}


@override
int get hashCode => Object.hash(runtimeType,messageContent);

@override
String toString() {
  return 'ChatEvent.sendMessage(messageContent: $messageContent)';
}


}

/// @nodoc
abstract mixin class _$SendMessageCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory _$SendMessageCopyWith(_SendMessage value, $Res Function(_SendMessage) _then) = __$SendMessageCopyWithImpl;
@useResult
$Res call({
 String messageContent
});




}
/// @nodoc
class __$SendMessageCopyWithImpl<$Res>
    implements _$SendMessageCopyWith<$Res> {
  __$SendMessageCopyWithImpl(this._self, this._then);

  final _SendMessage _self;
  final $Res Function(_SendMessage) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageContent = null,}) {
  return _then(_SendMessage(
null == messageContent ? _self.messageContent : messageContent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ClickChip implements ChatEvent {
  const _ClickChip(this.chip);
  

 final  String chip;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClickChipCopyWith<_ClickChip> get copyWith => __$ClickChipCopyWithImpl<_ClickChip>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClickChip&&(identical(other.chip, chip) || other.chip == chip));
}


@override
int get hashCode => Object.hash(runtimeType,chip);

@override
String toString() {
  return 'ChatEvent.clickChip(chip: $chip)';
}


}

/// @nodoc
abstract mixin class _$ClickChipCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory _$ClickChipCopyWith(_ClickChip value, $Res Function(_ClickChip) _then) = __$ClickChipCopyWithImpl;
@useResult
$Res call({
 String chip
});




}
/// @nodoc
class __$ClickChipCopyWithImpl<$Res>
    implements _$ClickChipCopyWith<$Res> {
  __$ClickChipCopyWithImpl(this._self, this._then);

  final _ClickChip _self;
  final $Res Function(_ClickChip) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chip = null,}) {
  return _then(_ClickChip(
null == chip ? _self.chip : chip // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _MessageReceived implements ChatEvent {
  const _MessageReceived(this.message);
  

 final  Message message;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageReceivedCopyWith<_MessageReceived> get copyWith => __$MessageReceivedCopyWithImpl<_MessageReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageReceived&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatEvent.messageReceived(message: $message)';
}


}

/// @nodoc
abstract mixin class _$MessageReceivedCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory _$MessageReceivedCopyWith(_MessageReceived value, $Res Function(_MessageReceived) _then) = __$MessageReceivedCopyWithImpl;
@useResult
$Res call({
 Message message
});




}
/// @nodoc
class __$MessageReceivedCopyWithImpl<$Res>
    implements _$MessageReceivedCopyWith<$Res> {
  __$MessageReceivedCopyWithImpl(this._self, this._then);

  final _MessageReceived _self;
  final $Res Function(_MessageReceived) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_MessageReceived(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}


}

/// @nodoc
mixin _$ChatState {

 bool get isLoading; bool get isError; String get message; List<String> get messageChips; List<Message> get messageHistory; String? get messageContent; bool get isSending; String? get error;
/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatStateCopyWith<ChatState> get copyWith => _$ChatStateCopyWithImpl<ChatState>(this as ChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.messageChips, messageChips)&&const DeepCollectionEquality().equals(other.messageHistory, messageHistory)&&(identical(other.messageContent, messageContent) || other.messageContent == messageContent)&&(identical(other.isSending, isSending) || other.isSending == isSending)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,const DeepCollectionEquality().hash(messageChips),const DeepCollectionEquality().hash(messageHistory),messageContent,isSending,error);

@override
String toString() {
  return 'ChatState(isLoading: $isLoading, isError: $isError, message: $message, messageChips: $messageChips, messageHistory: $messageHistory, messageContent: $messageContent, isSending: $isSending, error: $error)';
}


}

/// @nodoc
abstract mixin class $ChatStateCopyWith<$Res>  {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) _then) = _$ChatStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isError, String message, List<String> messageChips, List<Message> messageHistory, String? messageContent, bool isSending, String? error
});




}
/// @nodoc
class _$ChatStateCopyWithImpl<$Res>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._self, this._then);

  final ChatState _self;
  final $Res Function(ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? messageChips = null,Object? messageHistory = null,Object? messageContent = freezed,Object? isSending = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,messageChips: null == messageChips ? _self.messageChips : messageChips // ignore: cast_nullable_to_non_nullable
as List<String>,messageHistory: null == messageHistory ? _self.messageHistory : messageHistory // ignore: cast_nullable_to_non_nullable
as List<Message>,messageContent: freezed == messageContent ? _self.messageContent : messageContent // ignore: cast_nullable_to_non_nullable
as String?,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _ChatState implements ChatState {
  const _ChatState({this.isLoading = false, this.isError = false, this.message = '', final  List<String> messageChips = const [], final  List<Message> messageHistory = const [], this.messageContent = '', this.isSending = false, this.error}): _messageChips = messageChips,_messageHistory = messageHistory;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isError;
@override@JsonKey() final  String message;
 final  List<String> _messageChips;
@override@JsonKey() List<String> get messageChips {
  if (_messageChips is EqualUnmodifiableListView) return _messageChips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messageChips);
}

 final  List<Message> _messageHistory;
@override@JsonKey() List<Message> get messageHistory {
  if (_messageHistory is EqualUnmodifiableListView) return _messageHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messageHistory);
}

@override@JsonKey() final  String? messageContent;
@override@JsonKey() final  bool isSending;
@override final  String? error;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatStateCopyWith<_ChatState> get copyWith => __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._messageChips, _messageChips)&&const DeepCollectionEquality().equals(other._messageHistory, _messageHistory)&&(identical(other.messageContent, messageContent) || other.messageContent == messageContent)&&(identical(other.isSending, isSending) || other.isSending == isSending)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isError,message,const DeepCollectionEquality().hash(_messageChips),const DeepCollectionEquality().hash(_messageHistory),messageContent,isSending,error);

@override
String toString() {
  return 'ChatState(isLoading: $isLoading, isError: $isError, message: $message, messageChips: $messageChips, messageHistory: $messageHistory, messageContent: $messageContent, isSending: $isSending, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(_ChatState value, $Res Function(_ChatState) _then) = __$ChatStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isError, String message, List<String> messageChips, List<Message> messageHistory, String? messageContent, bool isSending, String? error
});




}
/// @nodoc
class __$ChatStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(this._self, this._then);

  final _ChatState _self;
  final $Res Function(_ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isError = null,Object? message = null,Object? messageChips = null,Object? messageHistory = null,Object? messageContent = freezed,Object? isSending = null,Object? error = freezed,}) {
  return _then(_ChatState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,messageChips: null == messageChips ? _self._messageChips : messageChips // ignore: cast_nullable_to_non_nullable
as List<String>,messageHistory: null == messageHistory ? _self._messageHistory : messageHistory // ignore: cast_nullable_to_non_nullable
as List<Message>,messageContent: freezed == messageContent ? _self.messageContent : messageContent // ignore: cast_nullable_to_non_nullable
as String?,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
