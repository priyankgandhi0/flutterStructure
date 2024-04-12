import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../api/repo/auth_repo.dart';
import '../../../../config/routes/routes.dart';
import '../../../../model/response_item.dart';
import '../../../../model/user_data_model.dart';
import '../../../../utils/extensions.dart';
import '../../../../utils/preference.dart';

part 'log_in_state.dart';

part 'log_in_cubit.freezed.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(const LogInState());

  void clearData() {
    emit(state.copyWith(
        responseItem: null,
        message: '',
        showPassword: false,
        email: '',
        isLoading: false,
        password: '',
        isRemember: false));
  }

  void changeData(
      {String? email, String? password, bool? showPassword, bool? remember}) {
    emit(
      state.copyWith(
        email: email ?? state.email,
        password: password ?? state.password,
        showPassword: showPassword ?? state.showPassword,
        isRemember: remember ?? state.isRemember,
        message: '',
        responseItem: null,
      ),
    );
  }

  bool _validation() {
    if (state.email.isEmpty) {
      emit(state.copyWith(message: 'Please Enter Email'));
      return false;
    } else if (!isEmailValid(state.email)) {
      emit(state.copyWith(message: 'Please Enter Valid Email'));
      return false;
    } else if (state.password.isEmpty) {
      emit(state.copyWith(message: 'Please Enter Password'));
      return false;
    }
    return true;
  }

  void userLogin(BuildContext context) async {
    if(_validation()){
      emit(state.copyWith(isLoading: true, responseItem: null, message: ''));
      try {
        ResponseItem result = ResponseItem(data: null, status: false, message: '');
        // ResponseItem data = await AuthRepo.userLogin(
        //     email: state.email.trim(), password: state.password);
        result = await AuthRepo.userLogin(
            email: state.email.trim(), password: state.password);
        if (result.status) {
          if (result.data != null) {
            UserDataModel userModel = UserDataModel.fromJson(result.toJson());
            preferences.saveUserItem(userModel);
            Routes.appPushScreen(context, Routes.home);
          }
        }
        emit(state.copyWith(
          isLoading: false,
          responseItem: result,
          message: result.message,
        ));
      } catch (e) {
        emit(state.copyWith(message: e.toString(), isLoading: false));
      }
    }
  }
}
