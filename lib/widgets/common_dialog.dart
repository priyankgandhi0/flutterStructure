import 'package:flutter_structure/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/routes/routes.dart';
import '../../core/constants/app_colors.dart';
import '../utils/preference.dart';
import 'app_button.dart';

class CommonDialog extends StatelessWidget {
  CommonDialog(
      {Key? key,
      required this.alignment,
      this.bottomMargin,
      this.tittleText,
      this.tittleColor,
      this.onTap,
      this.cancelOnTap,
      this.buttonCancelText,
      this.buttonText,
      this.descriptionText,
      this.dialogBackColor,
      this.topMargin,
      this.rowMargin,
      this.mainContent})
      : super(key: key);

  final AlignmentGeometry alignment;
  final double? bottomMargin;
  final Widget? mainContent;
  final double? topMargin;
  final double? rowMargin;
  final Color? dialogBackColor;
  final String? tittleText;
  final String? descriptionText;
  final String? buttonCancelText;
  final String? buttonText;
  final Color? tittleColor;
  Function? onTap;
  Function? cancelOnTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Align(
        alignment: alignment,
        child: IntrinsicHeight(
          child: Container(
              margin: EdgeInsets.only(
                  left: 25,
                  right: 25,
                  bottom: bottomMargin ?? 40,
                  top: topMargin ?? 0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: dialogBackColor ?? Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  5.spaceH(),
                  (tittleText ?? "").normalText(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontColor: tittleColor ?? appBlackColor),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: (descriptionText ?? "").boldText(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        textAlign: TextAlign.center,
                        color: appBlackColor),
                  ),
                  15.spaceH(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: AppBorderButton(
                        borderColor: primaryColor,
                        borderWidth: 1,
                        fontColor: primaryColor,
                        text: buttonCancelText ?? "",
                        onTap: () {
                          cancelOnTap!();
                        },
                      )),
                      20.spaceW(),
                      Expanded(
                        child: AppButton(
                          text: buttonText ?? "",
                          onTap: () {
                            onTap!();
                          },
                          boxShadow: [],
                          bgColor: primaryColor,
                          fontColor: Colors.white,
                        ),
                      ),
                    ],
                  ).paddingOnly(bottom: 10, right: 16, left: 16),
                  10.spaceH()
                ],
              ).paddingOnly(top: rowMargin ?? 10)),
        ),
      ),
    );
  }
}

/*void showAlertWith1Button(
    {String? title,
      bool barrierDismissible = true,
    required String message,
    required String buttonText,
    required ValueChanged onChanged}) {
  Get.dialog(

      CupertinoAlertDialog(
    title: Column(
      children: <Widget>[
        Text(title ?? 'Chef Pop'),
      ],
    ),
    content: Text(
      message,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
    ),
    actions: <Widget>[
      CupertinoDialogAction(
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: () {
          Get.back();
          onChanged(0);
        },
      ),
    ],
  ),barrierDismissible: barrierDismissible);
}*/



