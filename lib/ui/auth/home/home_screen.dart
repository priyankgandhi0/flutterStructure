import 'package:flutter_structure/model/services_model.dart';
import 'package:flutter_structure/ui/auth/home/bloc/home_cubit.dart';
import 'package:flutter_structure/utils/extensions.dart';
import 'package:flutter_structure/widgets/common_dialog.dart';
import 'package:flutter_structure/widgets/home_image.dart';
import 'package:flutter_structure/widgets/start_up_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/request_conts.dart';
import '../../../config/routes/routes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/app_progress.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().initializeData(context);
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: primaryColor,
      //   leadingWidth: double.infinity,
      //   title: 'Home'.normalText(),
      //   leading: StartUpTextField(
      //     height: 55,
      //     hint: 'Search services',
      //     inputType: TextInputType.emailAddress,
      //     radius: 30,
      //     isOuterBolder: true,
      //
      //     onchange: (value) {
      //       // context.read<LogInCubit>().changeData(email: value);
      //     },
      //     prefixIcon: Assets.icons.icSearch
      //         .svg(fit: BoxFit.scaleDown, color: appBlackColor)
      //         .paddingOnly(right: 10,left: 20),
      //   ),
      // ),
      body: BlocListener<HomeCubit, HomeState>(listener: (context, state) {
        if (state.message.isNotEmpty) {
          context.showAppSnackBar(message: state.message);
        }
        if (state.responseItem != null && state.responseItem!.status) {
          // Routes.appPopAllScreen(context, Routes.bottomBarScreen);
          context.read<HomeCubit>().clearData();
        }
      }, child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                color: primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    35.spaceH(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        'Home'
                            .normalText(
                            fontColor: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24)
                            .paddingOnly(left: 20),
                        Assets.icons.icLogout
                            .svg(height: 30, width: 30)
                            .paddingOnly(right: 20)
                            .onClick(() {
                          context.read<HomeCubit>().logout(context);
                        }),
                      ],
                    ),
                    10.spaceH(),
                    StartUpTextField(
                      height: 55,
                      hint: 'Search services',
                      inputType: TextInputType.emailAddress,
                      radius: 30,
                      isOuterBolder: true,
                      onchange: (value) {
                        // context.read<LogInCubit>().changeData(email: value);
                      },
                      prefixIcon: Assets.icons.icSearch
                          .svg(fit: BoxFit.scaleDown, color: appBlackColor)
                          .paddingOnly(right: 10, left: 20),
                    ).paddingSymmetric(horizontal: 15),
                    Expanded(
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.elliptical(25, 30),
                                topLeft: Radius.elliptical(25, 30))),
                        child: SingleChildScrollView(
                          child: Column(
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
                              10.spaceH(),
                              'Our services'.normalTextAssistant(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontColor: Colors.black,
                              ),

                              BlocBuilder<HomeCubit, HomeState>(
                                builder: (context, state) {
                                  return ListView.builder(
                                    // controller: scrollUserController,
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                    itemCount: state.servicesListData.length,
                                    physics: PageScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      var serviceData =
                                      state.servicesListData[index];
                                      return Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: commentFiledBGColor),
                                            borderRadius:
                                            BorderRadius.circular(15)),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  15.spaceW(),
                                                  HomeImage.networkImage(
                                                    path: '${ApiUrl
                                                        .imagePath}${serviceData
                                                        .serviceImage}',
                                                    height: 50,
                                                    width: 50,
                                                    radius: BorderRadius.circular(50),
                                                    fit: BoxFit.fill,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  15.spaceW(),
                                                  Expanded(
                                                    child: '${serviceData
                                                        .serviceName}'
                                                        .normalText(
                                                        fontSize: 16,
                                                        overflow:
                                                        TextOverflow
                                                            .ellipsis,
                                                        fontColor:
                                                        appBlackColor,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Assets.icons.icRightArrow
                                                .svg()
                                                .paddingOnly(
                                                right: 15, left: 10),
                                          ],
                                        ),
                                      ).onClick(() {
                                        context
                                            .read<HomeCubit>()
                                            .openBottomSheet(
                                            context, serviceData);
                                      }).paddingSymmetric(vertical: 5);
                                    },
                                  );
                                },
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 20),
                        ),
                      ).paddingOnly(top: 30),
                    ),
                  ],
                ),
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) =>
                state.isLoading ? const AppProgress() : const SizedBox.shrink(),
              ),
            ],
          );
        },
      )),
    );
  }
}
