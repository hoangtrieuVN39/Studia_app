// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RegisterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String email,
      String password,
      String confirmPassword,
    )
    step1Submitted,
    required TResult Function() pickGradeRequested,
    required TResult Function(String grade) gradeSelected,
    required TResult Function(String schoolName, String grade) step2Submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String confirmPassword)?
    step1Submitted,
    TResult? Function()? pickGradeRequested,
    TResult? Function(String grade)? gradeSelected,
    TResult? Function(String schoolName, String grade)? step2Submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String confirmPassword)?
    step1Submitted,
    TResult Function()? pickGradeRequested,
    TResult Function(String grade)? gradeSelected,
    TResult Function(String schoolName, String grade)? step2Submitted,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Step1Submitted value) step1Submitted,
    required TResult Function(PickGradeRequested value) pickGradeRequested,
    required TResult Function(GradeSelected value) gradeSelected,
    required TResult Function(Step2Submitted value) step2Submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Step1Submitted value)? step1Submitted,
    TResult? Function(PickGradeRequested value)? pickGradeRequested,
    TResult? Function(GradeSelected value)? gradeSelected,
    TResult? Function(Step2Submitted value)? step2Submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Step1Submitted value)? step1Submitted,
    TResult Function(PickGradeRequested value)? pickGradeRequested,
    TResult Function(GradeSelected value)? gradeSelected,
    TResult Function(Step2Submitted value)? step2Submitted,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
    RegisterEvent value,
    $Res Function(RegisterEvent) then,
  ) = _$RegisterEventCopyWithImpl<$Res, RegisterEvent>;
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res, $Val extends RegisterEvent>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$Step1SubmittedImplCopyWith<$Res> {
  factory _$$Step1SubmittedImplCopyWith(
    _$Step1SubmittedImpl value,
    $Res Function(_$Step1SubmittedImpl) then,
  ) = __$$Step1SubmittedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password, String confirmPassword});
}

/// @nodoc
class __$$Step1SubmittedImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$Step1SubmittedImpl>
    implements _$$Step1SubmittedImplCopyWith<$Res> {
  __$$Step1SubmittedImplCopyWithImpl(
    _$Step1SubmittedImpl _value,
    $Res Function(_$Step1SubmittedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(
      _$Step1SubmittedImpl(
        null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                as String,
        null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                as String,
        null == confirmPassword
            ? _value.confirmPassword
            : confirmPassword // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$Step1SubmittedImpl implements Step1Submitted {
  const _$Step1SubmittedImpl(this.email, this.password, this.confirmPassword);

  @override
  final String email;
  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'RegisterEvent.step1Submitted(email: $email, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Step1SubmittedImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, confirmPassword);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Step1SubmittedImplCopyWith<_$Step1SubmittedImpl> get copyWith =>
      __$$Step1SubmittedImplCopyWithImpl<_$Step1SubmittedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String email,
      String password,
      String confirmPassword,
    )
    step1Submitted,
    required TResult Function() pickGradeRequested,
    required TResult Function(String grade) gradeSelected,
    required TResult Function(String schoolName, String grade) step2Submitted,
  }) {
    return step1Submitted(email, password, confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String confirmPassword)?
    step1Submitted,
    TResult? Function()? pickGradeRequested,
    TResult? Function(String grade)? gradeSelected,
    TResult? Function(String schoolName, String grade)? step2Submitted,
  }) {
    return step1Submitted?.call(email, password, confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String confirmPassword)?
    step1Submitted,
    TResult Function()? pickGradeRequested,
    TResult Function(String grade)? gradeSelected,
    TResult Function(String schoolName, String grade)? step2Submitted,
    required TResult orElse(),
  }) {
    if (step1Submitted != null) {
      return step1Submitted(email, password, confirmPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Step1Submitted value) step1Submitted,
    required TResult Function(PickGradeRequested value) pickGradeRequested,
    required TResult Function(GradeSelected value) gradeSelected,
    required TResult Function(Step2Submitted value) step2Submitted,
  }) {
    return step1Submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Step1Submitted value)? step1Submitted,
    TResult? Function(PickGradeRequested value)? pickGradeRequested,
    TResult? Function(GradeSelected value)? gradeSelected,
    TResult? Function(Step2Submitted value)? step2Submitted,
  }) {
    return step1Submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Step1Submitted value)? step1Submitted,
    TResult Function(PickGradeRequested value)? pickGradeRequested,
    TResult Function(GradeSelected value)? gradeSelected,
    TResult Function(Step2Submitted value)? step2Submitted,
    required TResult orElse(),
  }) {
    if (step1Submitted != null) {
      return step1Submitted(this);
    }
    return orElse();
  }
}

abstract class Step1Submitted implements RegisterEvent {
  const factory Step1Submitted(
    final String email,
    final String password,
    final String confirmPassword,
  ) = _$Step1SubmittedImpl;

  String get email;
  String get password;
  String get confirmPassword;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Step1SubmittedImplCopyWith<_$Step1SubmittedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PickGradeRequestedImplCopyWith<$Res> {
  factory _$$PickGradeRequestedImplCopyWith(
    _$PickGradeRequestedImpl value,
    $Res Function(_$PickGradeRequestedImpl) then,
  ) = __$$PickGradeRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PickGradeRequestedImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$PickGradeRequestedImpl>
    implements _$$PickGradeRequestedImplCopyWith<$Res> {
  __$$PickGradeRequestedImplCopyWithImpl(
    _$PickGradeRequestedImpl _value,
    $Res Function(_$PickGradeRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PickGradeRequestedImpl implements PickGradeRequested {
  const _$PickGradeRequestedImpl();

  @override
  String toString() {
    return 'RegisterEvent.pickGradeRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PickGradeRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String email,
      String password,
      String confirmPassword,
    )
    step1Submitted,
    required TResult Function() pickGradeRequested,
    required TResult Function(String grade) gradeSelected,
    required TResult Function(String schoolName, String grade) step2Submitted,
  }) {
    return pickGradeRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String confirmPassword)?
    step1Submitted,
    TResult? Function()? pickGradeRequested,
    TResult? Function(String grade)? gradeSelected,
    TResult? Function(String schoolName, String grade)? step2Submitted,
  }) {
    return pickGradeRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String confirmPassword)?
    step1Submitted,
    TResult Function()? pickGradeRequested,
    TResult Function(String grade)? gradeSelected,
    TResult Function(String schoolName, String grade)? step2Submitted,
    required TResult orElse(),
  }) {
    if (pickGradeRequested != null) {
      return pickGradeRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Step1Submitted value) step1Submitted,
    required TResult Function(PickGradeRequested value) pickGradeRequested,
    required TResult Function(GradeSelected value) gradeSelected,
    required TResult Function(Step2Submitted value) step2Submitted,
  }) {
    return pickGradeRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Step1Submitted value)? step1Submitted,
    TResult? Function(PickGradeRequested value)? pickGradeRequested,
    TResult? Function(GradeSelected value)? gradeSelected,
    TResult? Function(Step2Submitted value)? step2Submitted,
  }) {
    return pickGradeRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Step1Submitted value)? step1Submitted,
    TResult Function(PickGradeRequested value)? pickGradeRequested,
    TResult Function(GradeSelected value)? gradeSelected,
    TResult Function(Step2Submitted value)? step2Submitted,
    required TResult orElse(),
  }) {
    if (pickGradeRequested != null) {
      return pickGradeRequested(this);
    }
    return orElse();
  }
}

abstract class PickGradeRequested implements RegisterEvent {
  const factory PickGradeRequested() = _$PickGradeRequestedImpl;
}

/// @nodoc
abstract class _$$GradeSelectedImplCopyWith<$Res> {
  factory _$$GradeSelectedImplCopyWith(
    _$GradeSelectedImpl value,
    $Res Function(_$GradeSelectedImpl) then,
  ) = __$$GradeSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String grade});
}

/// @nodoc
class __$$GradeSelectedImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$GradeSelectedImpl>
    implements _$$GradeSelectedImplCopyWith<$Res> {
  __$$GradeSelectedImplCopyWithImpl(
    _$GradeSelectedImpl _value,
    $Res Function(_$GradeSelectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? grade = null}) {
    return _then(
      _$GradeSelectedImpl(
        null == grade
            ? _value.grade
            : grade // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$GradeSelectedImpl implements GradeSelected {
  const _$GradeSelectedImpl(this.grade);

  @override
  final String grade;

  @override
  String toString() {
    return 'RegisterEvent.gradeSelected(grade: $grade)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GradeSelectedImpl &&
            (identical(other.grade, grade) || other.grade == grade));
  }

  @override
  int get hashCode => Object.hash(runtimeType, grade);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GradeSelectedImplCopyWith<_$GradeSelectedImpl> get copyWith =>
      __$$GradeSelectedImplCopyWithImpl<_$GradeSelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String email,
      String password,
      String confirmPassword,
    )
    step1Submitted,
    required TResult Function() pickGradeRequested,
    required TResult Function(String grade) gradeSelected,
    required TResult Function(String schoolName, String grade) step2Submitted,
  }) {
    return gradeSelected(grade);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String confirmPassword)?
    step1Submitted,
    TResult? Function()? pickGradeRequested,
    TResult? Function(String grade)? gradeSelected,
    TResult? Function(String schoolName, String grade)? step2Submitted,
  }) {
    return gradeSelected?.call(grade);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String confirmPassword)?
    step1Submitted,
    TResult Function()? pickGradeRequested,
    TResult Function(String grade)? gradeSelected,
    TResult Function(String schoolName, String grade)? step2Submitted,
    required TResult orElse(),
  }) {
    if (gradeSelected != null) {
      return gradeSelected(grade);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Step1Submitted value) step1Submitted,
    required TResult Function(PickGradeRequested value) pickGradeRequested,
    required TResult Function(GradeSelected value) gradeSelected,
    required TResult Function(Step2Submitted value) step2Submitted,
  }) {
    return gradeSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Step1Submitted value)? step1Submitted,
    TResult? Function(PickGradeRequested value)? pickGradeRequested,
    TResult? Function(GradeSelected value)? gradeSelected,
    TResult? Function(Step2Submitted value)? step2Submitted,
  }) {
    return gradeSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Step1Submitted value)? step1Submitted,
    TResult Function(PickGradeRequested value)? pickGradeRequested,
    TResult Function(GradeSelected value)? gradeSelected,
    TResult Function(Step2Submitted value)? step2Submitted,
    required TResult orElse(),
  }) {
    if (gradeSelected != null) {
      return gradeSelected(this);
    }
    return orElse();
  }
}

abstract class GradeSelected implements RegisterEvent {
  const factory GradeSelected(final String grade) = _$GradeSelectedImpl;

  String get grade;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GradeSelectedImplCopyWith<_$GradeSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Step2SubmittedImplCopyWith<$Res> {
  factory _$$Step2SubmittedImplCopyWith(
    _$Step2SubmittedImpl value,
    $Res Function(_$Step2SubmittedImpl) then,
  ) = __$$Step2SubmittedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String schoolName, String grade});
}

/// @nodoc
class __$$Step2SubmittedImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$Step2SubmittedImpl>
    implements _$$Step2SubmittedImplCopyWith<$Res> {
  __$$Step2SubmittedImplCopyWithImpl(
    _$Step2SubmittedImpl _value,
    $Res Function(_$Step2SubmittedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? schoolName = null, Object? grade = null}) {
    return _then(
      _$Step2SubmittedImpl(
        null == schoolName
            ? _value.schoolName
            : schoolName // ignore: cast_nullable_to_non_nullable
                as String,
        null == grade
            ? _value.grade
            : grade // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$Step2SubmittedImpl implements Step2Submitted {
  const _$Step2SubmittedImpl(this.schoolName, this.grade);

  @override
  final String schoolName;
  @override
  final String grade;

  @override
  String toString() {
    return 'RegisterEvent.step2Submitted(schoolName: $schoolName, grade: $grade)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Step2SubmittedImpl &&
            (identical(other.schoolName, schoolName) ||
                other.schoolName == schoolName) &&
            (identical(other.grade, grade) || other.grade == grade));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schoolName, grade);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Step2SubmittedImplCopyWith<_$Step2SubmittedImpl> get copyWith =>
      __$$Step2SubmittedImplCopyWithImpl<_$Step2SubmittedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String email,
      String password,
      String confirmPassword,
    )
    step1Submitted,
    required TResult Function() pickGradeRequested,
    required TResult Function(String grade) gradeSelected,
    required TResult Function(String schoolName, String grade) step2Submitted,
  }) {
    return step2Submitted(schoolName, grade);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String confirmPassword)?
    step1Submitted,
    TResult? Function()? pickGradeRequested,
    TResult? Function(String grade)? gradeSelected,
    TResult? Function(String schoolName, String grade)? step2Submitted,
  }) {
    return step2Submitted?.call(schoolName, grade);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String confirmPassword)?
    step1Submitted,
    TResult Function()? pickGradeRequested,
    TResult Function(String grade)? gradeSelected,
    TResult Function(String schoolName, String grade)? step2Submitted,
    required TResult orElse(),
  }) {
    if (step2Submitted != null) {
      return step2Submitted(schoolName, grade);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Step1Submitted value) step1Submitted,
    required TResult Function(PickGradeRequested value) pickGradeRequested,
    required TResult Function(GradeSelected value) gradeSelected,
    required TResult Function(Step2Submitted value) step2Submitted,
  }) {
    return step2Submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Step1Submitted value)? step1Submitted,
    TResult? Function(PickGradeRequested value)? pickGradeRequested,
    TResult? Function(GradeSelected value)? gradeSelected,
    TResult? Function(Step2Submitted value)? step2Submitted,
  }) {
    return step2Submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Step1Submitted value)? step1Submitted,
    TResult Function(PickGradeRequested value)? pickGradeRequested,
    TResult Function(GradeSelected value)? gradeSelected,
    TResult Function(Step2Submitted value)? step2Submitted,
    required TResult orElse(),
  }) {
    if (step2Submitted != null) {
      return step2Submitted(this);
    }
    return orElse();
  }
}

abstract class Step2Submitted implements RegisterEvent {
  const factory Step2Submitted(final String schoolName, final String grade) =
      _$Step2SubmittedImpl;

  String get schoolName;
  String get grade;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Step2SubmittedImplCopyWith<_$Step2SubmittedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterState {
  int get currentStep =>
      throw _privateConstructorUsedError; // To track the current registration step
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get showGradePicker =>
      throw _privateConstructorUsedError; // To control the bottom sheet
  String? get selectedGrade =>
      throw _privateConstructorUsedError; // Store the selected grade
  // Add fields to hold data from step 1 and step 2 if needed
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get schoolName => throw _privateConstructorUsedError;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
    RegisterState value,
    $Res Function(RegisterState) then,
  ) = _$RegisterStateCopyWithImpl<$Res, RegisterState>;
  @useResult
  $Res call({
    int currentStep,
    bool isLoading,
    bool isError,
    String message,
    bool showGradePicker,
    String? selectedGrade,
    String? email,
    String? password,
    String? schoolName,
  });
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? message = null,
    Object? showGradePicker = null,
    Object? selectedGrade = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? schoolName = freezed,
  }) {
    return _then(
      _value.copyWith(
            currentStep:
                null == currentStep
                    ? _value.currentStep
                    : currentStep // ignore: cast_nullable_to_non_nullable
                        as int,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            isError:
                null == isError
                    ? _value.isError
                    : isError // ignore: cast_nullable_to_non_nullable
                        as bool,
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
            showGradePicker:
                null == showGradePicker
                    ? _value.showGradePicker
                    : showGradePicker // ignore: cast_nullable_to_non_nullable
                        as bool,
            selectedGrade:
                freezed == selectedGrade
                    ? _value.selectedGrade
                    : selectedGrade // ignore: cast_nullable_to_non_nullable
                        as String?,
            email:
                freezed == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String?,
            password:
                freezed == password
                    ? _value.password
                    : password // ignore: cast_nullable_to_non_nullable
                        as String?,
            schoolName:
                freezed == schoolName
                    ? _value.schoolName
                    : schoolName // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegisterStateImplCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$RegisterStateImplCopyWith(
    _$RegisterStateImpl value,
    $Res Function(_$RegisterStateImpl) then,
  ) = __$$RegisterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int currentStep,
    bool isLoading,
    bool isError,
    String message,
    bool showGradePicker,
    String? selectedGrade,
    String? email,
    String? password,
    String? schoolName,
  });
}

/// @nodoc
class __$$RegisterStateImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterStateImpl>
    implements _$$RegisterStateImplCopyWith<$Res> {
  __$$RegisterStateImplCopyWithImpl(
    _$RegisterStateImpl _value,
    $Res Function(_$RegisterStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? message = null,
    Object? showGradePicker = null,
    Object? selectedGrade = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? schoolName = freezed,
  }) {
    return _then(
      _$RegisterStateImpl(
        currentStep:
            null == currentStep
                ? _value.currentStep
                : currentStep // ignore: cast_nullable_to_non_nullable
                    as int,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        isError:
            null == isError
                ? _value.isError
                : isError // ignore: cast_nullable_to_non_nullable
                    as bool,
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
        showGradePicker:
            null == showGradePicker
                ? _value.showGradePicker
                : showGradePicker // ignore: cast_nullable_to_non_nullable
                    as bool,
        selectedGrade:
            freezed == selectedGrade
                ? _value.selectedGrade
                : selectedGrade // ignore: cast_nullable_to_non_nullable
                    as String?,
        email:
            freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String?,
        password:
            freezed == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String?,
        schoolName:
            freezed == schoolName
                ? _value.schoolName
                : schoolName // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$RegisterStateImpl implements _RegisterState {
  const _$RegisterStateImpl({
    this.currentStep = 1,
    this.isLoading = false,
    this.isError = false,
    this.message = '',
    this.showGradePicker = false,
    this.selectedGrade,
    this.email,
    this.password,
    this.schoolName,
  });

  @override
  @JsonKey()
  final int currentStep;
  // To track the current registration step
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isError;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final bool showGradePicker;
  // To control the bottom sheet
  @override
  final String? selectedGrade;
  // Store the selected grade
  // Add fields to hold data from step 1 and step 2 if needed
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? schoolName;

  @override
  String toString() {
    return 'RegisterState(currentStep: $currentStep, isLoading: $isLoading, isError: $isError, message: $message, showGradePicker: $showGradePicker, selectedGrade: $selectedGrade, email: $email, password: $password, schoolName: $schoolName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterStateImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.showGradePicker, showGradePicker) ||
                other.showGradePicker == showGradePicker) &&
            (identical(other.selectedGrade, selectedGrade) ||
                other.selectedGrade == selectedGrade) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.schoolName, schoolName) ||
                other.schoolName == schoolName));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentStep,
    isLoading,
    isError,
    message,
    showGradePicker,
    selectedGrade,
    email,
    password,
    schoolName,
  );

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      __$$RegisterStateImplCopyWithImpl<_$RegisterStateImpl>(this, _$identity);
}

abstract class _RegisterState implements RegisterState {
  const factory _RegisterState({
    final int currentStep,
    final bool isLoading,
    final bool isError,
    final String message,
    final bool showGradePicker,
    final String? selectedGrade,
    final String? email,
    final String? password,
    final String? schoolName,
  }) = _$RegisterStateImpl;

  @override
  int get currentStep; // To track the current registration step
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  String get message;
  @override
  bool get showGradePicker; // To control the bottom sheet
  @override
  String? get selectedGrade; // Store the selected grade
  // Add fields to hold data from step 1 and step 2 if needed
  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get schoolName;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
