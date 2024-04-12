part of 'log_in_cubit.dart';

@freezed
class LogInState with _$LogInState {
  const factory LogInState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isLoading,
    @Default(false) bool isRemember,
    @Default(false) bool showPassword,
    ResponseItem? responseItem,
    @Default('') String message,
  }) = _LogInState;


}
