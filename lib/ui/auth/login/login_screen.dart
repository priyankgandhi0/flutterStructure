import 'package:flutter_structure/core/constants/app_colors.dart';
import 'package:flutter_structure/core/constants/constants.dart';
import 'package:flutter_structure/utils/extensions.dart';
import 'package:flutter_structure/widgets/start_up_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/routes/routes.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/app_progress.dart';
import '../../../widgets/app_button.dart';
import 'bloc/log_in_cubit.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LogInCubit, LogInState>(
        listener: (context, state) {
          if (state.message.isNotEmpty) {
            context.showAppSnackBar(message: state.message);
          }
          if (state.responseItem != null && state.responseItem!.status) {
            // Routes.appPopAllScreen(context, Routes.bottomBarScreen);
            context.read<LogInCubit>().clearData();
          }
        },
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        30.spaceH(),
                        Assets.images.imgFlutterLogo.svg().center,
                        55.spaceH(),
                        'Log In'.normalText(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        'Please Log in with your information below'.normalText(
                          fontSize: 16,
                          fontColor: appBlackColor.withOpacity(0.8),
                          fontWeight: FontWeight.w400,
                        ),
                        35.spaceH(),
                        BlocBuilder<LogInCubit, LogInState>(
                          buildWhen: (previous, current) =>
                          previous.email != current.email,
                          builder: (context, state) {
                            return StartUpTextField(
                              height: 60,
                              hint: 'Enter Email',
                              inputType: TextInputType.emailAddress,
                              isOuterBolder: true,

                              onchange: (value) {
                                context.read<LogInCubit>().changeData(email: value);
                              },
                              prefixIcon: Assets.icons.icEmail
                                  .svg(fit: BoxFit.scaleDown, color: appBlackColor)
                                  .paddingOnly(right: 10,left: 10),
                            );
                          },
                        ),
                        25.spaceH(),
                        BlocBuilder<LogInCubit, LogInState>(
                          buildWhen: (previous, current) =>
                          previous.password != current.password,
                          builder: (context, state) {
                            return StartUpTextField(
                              height: 60,
                              hint: 'Enter Password',
                              inputType: TextInputType.emailAddress,
                              obSecureText: true,

                              isOuterBolder: true,
                              onchange: (value) {
                                context.read<LogInCubit>().changeData(password: value);
                              },

                              isSuffixIconShow: true,
                              prefixIcon: Assets.icons.icLock
                                  .svg(fit: BoxFit.scaleDown, color: appBlackColor)
                                  .paddingOnly(right: 10,left: 10),
                            );
                          },
                        ),
                        45.spaceH(),
                        AppButton(
                          onTap: () async {
                            hideKeyboard(context);
                            context.read<LogInCubit>().userLogin(context);
                          },
                          text: 'Log In',
                          boxShadow: [],
                          fontColor: Colors.white,
                          radius: 10,
                          fontSize: 20,
                          btnHeight: 50,
                          bgColor: primaryColor,
                        ),

                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Don’t have an account?',
                            style: GoogleFonts.saira(
                                color: appBlackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                            children: <TextSpan>[
                              TextSpan(
                                  recognizer: TapGestureRecognizer()..onTap = () {
                                    hideKeyboard(context);
                                    Routes.appPopAllScreen(context, Routes.register);
                                    print('Tap Here onTap');
                                  },
                                  text: 'Sign Up',
                                  style: GoogleFonts.saira(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),

                            ],
                          ),
                        ).center,
                      ],
                    ),
                  ),
                ),
                BlocBuilder<LogInCubit, LogInState>(
                  builder: (context, state) =>
                  state.isLoading ? const AppProgress() : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
    );
  }
}