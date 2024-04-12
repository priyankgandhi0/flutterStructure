import 'package:flutter_structure/core/constants/app_colors.dart';
import 'package:flutter_structure/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/routes/routes.dart';
import '../../../gen/assets.gen.dart';
import '../../../widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: AppButton(
        onTap: () {
          Routes.appPushScreen(context, Routes.login);
        },
        text: 'LET’S STARTED',
        fontColor: Colors.white,
        radius: 10,
        boxShadow: [],
        fontSize: 20,
        btnHeight: 50,
        bgColor: primaryColor,
      ).paddingSymmetric(horizontal: 15, vertical: 25),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.imgFlutter.path,
                height: 325,
                width: double.infinity,
              ).paddingOnly(top: 50),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: 'Welcome to'.normalText(
                        fontSize: 25,
                        maxLines: 2,
                        fontWeight: FontWeight.w400,
                        fontColor: Colors.black,
                        textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: 'Codonnier'.normalText(
                        fontSize: 25,
                        maxLines: 2,
                        fontWeight: FontWeight.w400,
                        fontColor: appBlueColor,
                        textAlign: TextAlign.center),
                  ),
                ],
              ),*/
              70.spaceH(),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Welcome to',
                  style: GoogleFonts.saira(
                      color: Colors.black,
                      fontSize: 31,
                      fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Flutter',
                        style: GoogleFonts.saira(
                          color: primaryColor,
                            fontSize: 31,
                            fontWeight: FontWeight.w600)),

                  ],
                ),
              ),
              10.spaceH(),
              'We always satisfy the client with our best service, and we are always ready for our client So you can see our services now to get our services, hope you like it'
                  .normalText(
                  fontSize: 13,

                  fontWeight: FontWeight.w500,
                  fontColor: Colors.black,
                  textAlign: TextAlign.center
              )
            ],
          ).paddingSymmetric(horizontal: 15),
        ),
      ),
    );
  }
}
