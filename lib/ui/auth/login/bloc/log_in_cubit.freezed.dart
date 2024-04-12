// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_in_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LogInState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isRemember => throw _privateConstructorUsedError;
  bool get showPassword => throw _privateConstructorUsedError;
  ResponseItem? get responseItem => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LogInStateCopyWith<LogInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogInStateCopyWith<$Res> {
  factory $LogInStateCopyWith(
          LogInState value, $Res Function(LogInState) then) =
      _$LogInStateCopyWithImpl<$Res, LogInState>;
  @useResult
  $Res call(
      {String email,
      String password,
      bool isLoading,
      bool isRemember,
      bool showPassword,
      ResponseItem? responseItem,
      String message});
}

/// @nodoc
class _$LogInStateCopyWithImpl<$Res, $Val extends LogInState>
    implements $LogInStateCopyWith<$Res> {
  _$LogInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? isLoading = null,
    Object? isRemember = null,
    Object? showPassword = null,
    Object? responseItem = freezed,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRemember: null == isRemember
          ? _value.isRemember
          : isRemember // ignore: cast_nullable_to_non_nullable
              as bool,
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      responseItem: freezed == responseItem
          ? _value.responseItem
          : responseItem // ignore: cast_nullable_to_non_nullable
              as ResponseItem?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogInStateImplCopyWith<$Res>
    implements $LogInStateCopyWith<$Res> {
  factory _$$LogInStateImplCopyWith(
          _$LogInStateImpl value, $Res Function(_$LogInStateImpl) then) =
      __$$LogInStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      bool isLoading,
      bool isRemember,
      bool showPassword,
      ResponseItem? responseItem,
      String message});
}

/// @nodoc
class __$$LogInStateImplCopyWithImpl<$Res>
    extends _$LogInStateCopyWithImpl<$Res, _$LogInStateImpl>
    implements _$$LogInStateImplCopyWith<$Res> {
  __$$LogInStateImplCopyWithImpl(
      _$LogInStateImpl _value, $Res Function(_$LogInStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? isLoading = null,
    Object? isRemember = null,
    Object? showPassword = null,
    Object? responseItem = freezed,
    Object? message = null,
  }) {
    return _then(_$LogInStateImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRemember: null == isRemember
          ? _value.isRemember
          : isRemember // ignore: cast_nullable_to_non_nullable
              as bool,
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      responseItem: freezed == responseItem
          ? _value.responseItem
          : responseItem // ignore: cast_nullable_to_non_nullable
              as ResponseItem?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LogInStateImpl implements _LogInState {
  const _$LogInStateImpl(
      {this.email = '',
      this.password = '',
      this.isLoading = false,
      this.isRemember = false,
      this.showPassword = false,
      this.responseItem,
      this.message = ''});

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isRemember;
  @override
  @JsonKey()
  final bool showPassword;
  @override
  final ResponseItem? responseItem;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'LogInState(email: $email, password: $password, isLoading: $isLoading, isRemember: $isRemember, showPassword: $showPassword, responseItem: $responseItem, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogInStateImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isRemember, isRemember) ||
                other.isRemember == isRemember) &&
            (identical(other.showPassword, showPassword) ||
                other.showPassword == showPassword) &&
            (identical(other.responseItem, responseItem) ||
                other.responseItem == responseItem) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, isLoading,
      isRemember, showPassword, responseItem, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogInStateImplCopyWith<_$LogInStateImpl> get copyWith =>
      __$$LogInStateImplCopyWithImpl<_$LogInStateImpl>(this, _$identity);
}

abstract class _LogInState implements LogInState {
  const factory _LogInState(
      {final String email,
      final String password,
      final bool isLoading,
      final bool isRemember,
      final bool showPassword,
      final ResponseItem? responseItem,
      final String message}) = _$LogInStateImpl;

  @override
  String get email;
  @override
  String get password;
  @override
  bool get isLoading;
  @override
  bool get isRemember;
  @override
  bool get showPassword;
  @override
  ResponseItem? get responseItem;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$LogInStateImplCopyWith<_$LogInStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
