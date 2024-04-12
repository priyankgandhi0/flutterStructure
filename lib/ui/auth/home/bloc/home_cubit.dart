import 'package:bloc/bloc.dart';
import 'package:flutter_structure/api/repo/main_repo.dart';
import 'package:flutter_structure/model/services_list_model.dart';
import 'package:flutter_structure/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../api/repo/auth_repo.dart';
import '../../../../config/routes/routes.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../model/response_item.dart';
import '../../../../model/services_model.dart';
import '../../../../utils/preference.dart';
import '../../../../widgets/common_dialog.dart';

part 'home_state.dart';

part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void initializeData(BuildContext context) {
    // Initialize static data for servicesModel
   /* List<ServicesModel> staticServices = [
      ServicesModel(image: Assets.images.imgUiLogo.path, title: 'UI/UX design'),
      ServicesModel(
          image: Assets.images.imgIosApp.path, title: 'iOS App Development'),
      ServicesModel(
          image: Assets.images.imgAndroidApp.path,
          title: 'Android App Development'),
      ServicesModel(
          image: Assets.images.imgFlutterApp.path,
          title: 'Flutter App Development'),
      ServicesModel(
          image: Assets.images.imgWebServices.path,
          title: 'Web Development Services'),
      ServicesModel(
          image: Assets.images.imgOffshare.path,
          title: 'Offshore Software Development'),
    ];
    emit(state.copyWith(servicesModel: staticServices));*/
    callGetServices(context);
  }

  void openBottomSheet(BuildContext context, ServiceData serviceData) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.0.spaceH(),
                Center(
                  child: Container(
                    width: 65,
                    height: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: commentFiledBGColor),
                  ),
                ),
                15.spaceH(),
                Row(
                  children: [
                    'Service Type: '.normalText(
                        fontWeight: FontWeight.w600,
                        fontColor: appBlackColor,
                        fontSize: 16),
                    '${serviceData.serviceName}'.normalText(
                        fontWeight: FontWeight.w400,
                        fontColor: bgLightGreyColor,
                        fontSize: 16)
                  ],
                ).paddingSymmetric(horizontal: 20),
                10.spaceH(),
                Row(
                  children: [
                    'Experience: '.normalText(
                        fontWeight: FontWeight.w600,
                        fontColor: appBlackColor,
                        fontSize: 16),
                    '${serviceData.serviceExperiance}'.normalText(
                        fontWeight: FontWeight.w400,
                        fontColor: bgLightGreyColor,
                        fontSize: 16)
                  ],
                ).paddingSymmetric(horizontal: 20),
                10.spaceH(),
                Row(
                  children: [
                    'Project worked: '.normalText(
                        fontWeight: FontWeight.w600,
                        fontColor: appBlackColor,
                        fontSize: 16),
                    '${serviceData.serviceCompletes}'.normalText(
                        fontWeight: FontWeight.w400,
                        fontColor: bgLightGreyColor,
                        fontSize: 16)
                  ],
                ).paddingSymmetric(horizontal: 20),
                15.spaceH(),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: commentFiledBGColor),
                  ),
                ),
                10.spaceH(),
                'Information'
                    .normalText(
                        fontWeight: FontWeight.w600,
                        fontColor: appBlackColor,
                        fontSize: 16)
                    .paddingSymmetric(horizontal: 20),
                5.spaceH(),
                '${serviceData.serviceInformation}'
                    .normalTextAssistant(
                        fontWeight: FontWeight.w400,
                        fontColor: bgLightGreyColor,
                        fontSize: 16)
                    .paddingSymmetric(horizontal: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  void clearData() {
    // emit(state.copyWith(
    //     responseItem: null,
    //     message: '',
    //     showPassword: false,
    //     email: '',
    //     isLoading: false,
    //     password: '',
    //     isRemember: false));
  }


  void callGetServices(BuildContext context) async {

      emit(state.copyWith(isLoading: true, responseItem: null, message: ''));
      try {
        ResponseItem result = ResponseItem(data: null, status: false, message: '');
        // ResponseItem data = await AuthRepo.userLogin(
        //     email: state.email.trim(), password: state.password);
        result = await MainRepo.getAllServices();
        if (result.status) {
          if (result.data != null) {
            ServicesListModel servicesListModel = ServicesListModel.fromJson(result.toJson());
            emit(state.copyWith(servicesListData: servicesListModel.data!));
            print(servicesListModel);
            // Routes.appPushScreen(context, Routes.home);
          }
        }
        emit(state.copyWith(
          isLoading: false,
          responseItem: result,
          // message: result.message,
        ));
      } catch (e) {
        emit(state.copyWith(message: e.toString(), isLoading: false));

    }
  }

  void logout(BuildContext context) {
    // scaffoldKey.currentState!.closeDrawer();
    emit(state);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CommonDialog(
          dialogBackColor: Colors.white,
          tittleText: "Log out",
          buttonText: "Confirm",
          buttonCancelText: "Cancel",
          descriptionText: "Are you sure you want to logout?",
          cancelOnTap: () => Navigator.pop(context),
          onTap: () {
            Navigator.pop(context);
            preferences.clearUserInfo();
            Routes.appPopAllScreen(context, Routes.welcome);
            // Get.offAllNamed(Routes.onBoarding);
          },
          alignment: Alignment.center,
        );
      },
    );
  }
/*void changeData(
      {String? email, String? password, bool? showPassword, bool? remember}) {
  //   emit(
  //     state.copyWith(
  //       email: email ?? state.email,
  //       password: password ?? state.password,
  //       showPassword: showPassword ?? state.showPassword,
  //       isRemember: remember ?? state.isRemember,
  //       message: '',
  //       responseItem: null,
  //     ),
  //   );
  // }

}*/
}
