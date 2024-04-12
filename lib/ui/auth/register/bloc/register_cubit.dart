import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../api/repo/auth_repo.dart';
import '../../../../config/routes/routes.dart';
import '../../../../model/response_item.dart';
import '../../../../model/user_data_model.dart';
import '../../../../utils/extensions.dart';
import '../../../../utils/preference.dart';

part 'register_state.dart';

part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  void clearData() {
    emit(state.copyWith(
        responseItem: null,
        message: '',
        userName: '',
        showPassword: false,
        email: '',
        isLoading: false,
        password: '',
        confirmPassword: '',
        phoneNumber: '',
        countryCode: '',
        country: '',
        isRemember: false));
  }

  setCountryCode(String countryFlagCode,String countryCode) {
    emit(
      state.copyWith(countryFlagCode: countryFlagCode,countryCode: countryCode),
    );
    // update();
  }

  void userRegister(BuildContext context) async {
    if(_validation()){
      emit(state.copyWith(isLoading: true, responseItem: null, message: ''));
      try {
        ResponseItem result = ResponseItem(
            data: null, status: false, message: '');
        // ResponseItem data = await AuthRepo.userLogin(
        //     email: state.email.trim(), password: state.password);
        result = await AuthRepo.userRegister(
            email: state.email.trim(),
            password: state.password,
            countryCode: state.countryCode,
            phoneNumber: state.phoneNumber,
            userName: state.userName);
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

  bool _validation() {
    if (state.userName.isEmpty) {
      emit(state.copyWith(message: 'Please Enter UserName'));
      return false;
    } else if (state.email.isEmpty) {
      emit(state.copyWith(message: 'Please Enter Email'));
      return false;
    } else if (!isEmailValid(state.email)) {
      emit(state.copyWith(message: 'Please Enter Valid Email'));
      return false;
    } else if (state.password.isEmpty) {
      emit(state.copyWith(message: 'Please Enter Password'));
      return false;
    } else if (state.confirmPassword.isEmpty) {
      emit(state.copyWith(message: 'Please Enter Confirm Password'));
      return false;
    } else if (state.password != state.confirmPassword) {
      emit(state.copyWith(message: 'Password and Confirm Password Not Match'));
      return false;
    }
    return true;
  }

  void changeData({
    String? userName,
    String? email,
    String? password,
    String? confirmPassword,
    String? phoneNumber,
    String? countryCode,
    bool? showPassword,
    bool? remember,
  }) {
    emit(
      state.copyWith(
        userName: userName ?? state.userName,
        email: email ?? state.email,
        password: password ?? state.password,
        showPassword: showPassword ?? state.showPassword,
        isRemember: remember ?? state.isRemember,
        confirmPassword: confirmPassword ?? state.confirmPassword,
        phoneNumber: phoneNumber ?? state.phoneNumber,
        countryCode: countryCode ?? state.countryCode,
        message: '',
        responseItem: null,
      ),
    );
  }
}
