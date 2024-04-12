import 'package:flutter_structure/utils/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/routes/routes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../country_picker/country.dart';
import '../../../country_picker/country_picker.dart';
import '../../../country_picker/utils.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/app_progress.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/start_up_text_field.dart';
import 'bloc/register_cubit.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state.message.isNotEmpty) {
                context.showAppSnackBar(message: state.message);
              }
              if (state.responseItem != null && state.responseItem!.status) {
                // Routes.appPopAllScreen(context, Routes.bottomBarScreen);
                context.read<RegisterCubit>().clearData();
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
                          'Sign Up'.normalText(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          'Please enter your information and create an account'.normalText(
                            fontSize: 16,
                            fontColor: appBlackColor.withOpacity(0.8),
                            fontWeight: FontWeight.w400,
                          ),
                          35.spaceH(),
                          BlocBuilder<RegisterCubit, RegisterState>(
                            buildWhen: (previous, current) =>
                            previous.userName != current.userName,
                            builder: (context, state) {
                              return StartUpTextField(
                                height: 60,
                                hint: 'Enter Username',
                                inputType: TextInputType.emailAddress,
                                isOuterBolder: true,

                                onchange: (value) {
                                  context.read<RegisterCubit>().changeData(userName: value);
                                },
                                prefixIcon: Assets.icons.icUser
                                    .svg(fit: BoxFit.scaleDown, color: appBlackColor)
                                    .paddingOnly(right: 10,left: 10),
                              );
                            },
                          ),
                          25.spaceH(),
                          BlocBuilder<RegisterCubit, RegisterState>(
                            buildWhen: (previous, current) =>
                            previous.email != current.email,
                            builder: (context, state) {
                              return StartUpTextField(
                                height: 60,
                                hint: 'Enter Email',
                                inputType: TextInputType.emailAddress,
                                isOuterBolder: true,

                                onchange: (value) {
                                  context.read<RegisterCubit>().changeData(email: value);
                                },
                                prefixIcon: Assets.icons.icEmail
                                    .svg(fit: BoxFit.scaleDown, color: appBlackColor)
                                    .paddingOnly(right: 10,left: 10),
                              );
                            },
                          ),
                          25.spaceH(),
                          BlocBuilder<RegisterCubit, RegisterState>(
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
                                  context.read<RegisterCubit>().changeData(password: value);
                                },

                                isSuffixIconShow: true,
                                prefixIcon: Assets.icons.icLock
                                    .svg(fit: BoxFit.scaleDown, color: appBlackColor)
                                    .paddingOnly(right: 10,left: 10),
                              );
                            },
                          ),
                          25.spaceH(),
                          BlocBuilder<RegisterCubit, RegisterState>(
                            buildWhen: (previous, current) =>
                            previous.confirmPassword != current.confirmPassword,
                            builder: (context, state) {
                              return StartUpTextField(
                                height: 60,
                                hint: 'Enter Confirm Password',
                                inputType: TextInputType.emailAddress,
                                obSecureText: true,

                                isOuterBolder: true,
                                onchange: (value) {
                                  context.read<RegisterCubit>().changeData(confirmPassword: value);
                                },

                                isSuffixIconShow: true,
                                prefixIcon: Assets.icons.icLock
                                    .svg(fit: BoxFit.scaleDown, color: appBlackColor)
                                    .paddingOnly(right: 10,left: 10),
                              );
                            },
                          ),
                          25.spaceH(),
                          BlocBuilder<RegisterCubit, RegisterState>(
                            buildWhen: (previous, current) {
                              return previous.countryCode != current.countryCode;
                            },
                            builder: (context, state) {
                              return StartUpTextField(
                                // controller: ctrl.phoneNumberCtrl,
                                height: 60,
                                onchange: (value) {
                                  context.read<RegisterCubit>().changeData(phoneNumber: value);
                                },
                                isOuterBolder: true,
                                inputType: TextInputType.number,
                                maxLines: 1,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                hint: 'Enter Phone Number',
                                borderLineColor: Colors.transparent,
                                suffixPadding: 10,
                                prefixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Utils.countryCodeToEmoji(state.countryFlagCode).normalText(
                                        fontColor: appBlackColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                                    13.spaceW(),
                                    Assets.icons.icLine.svg(color: appBlackColor),
                                    14.spaceW(),
                                  ],
                                ).onClick(() {
                                  showCountryPicker(
                                    context: context,
                                    showPhoneCode: true, // optional. Shows phone code before the country name
                                    onSelect: (Country country) {
                                      context.read<RegisterCubit>().setCountryCode(country.countryCode,country.phoneCode);
                                    },
                                  );
                                }).paddingOnly(left: 15),
                                bgColor: Colors.white,
                                // topText: 'Phone No.',
                              );
                            },
                          ),
                          45.spaceH(),
                          AppButton(
                            onTap: () {
                              hideKeyboard(context);
                              context.read<RegisterCubit>().userRegister(context);
                              // Routes.appPushScreen(context, Routes.home);
                            },
                            text: 'Sign Up',
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
                              text: 'Already have an account?',
                              style: GoogleFonts.saira(
                                  color: appBlackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                              children: <TextSpan>[
                                TextSpan(
                                    recognizer: TapGestureRecognizer()..onTap = () {
                                      hideKeyboard(context);
                                      Routes.appPopAllScreen(context, Routes.login);
                                      print('Tap Here onTap');
                                    },
                                    text: ' Log In',
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
                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) =>
                    state.isLoading ? const AppProgress() : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
        )
    );
  }
}
