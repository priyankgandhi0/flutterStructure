
part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default('') String userName,
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isLoading,
    @Default(false) bool isRemember,
    @Default(false) bool showPassword,
    ResponseItem? responseItem,
    @Default('') String message,
    @Default('') String phoneNumber,
    @Default('') String confirmPassword,
    @Default('US')String countryFlagCode,
    @Default('+1')String countryCode,
    @Default('')String country,

  }) = _RegisterState;
}
