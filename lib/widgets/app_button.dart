import 'package:flutter_structure/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  Color? bgColor;
  Color? fontColor;
  double? fontSize;
  double? btnHeight;
  double? btnWidth;
  double? radius;
  List<BoxShadow>? boxShadow;
  AppButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.bgColor,
      this.btnHeight,
      this.btnWidth,
      this.radius,
      this.boxShadow,
      this.fontSize,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: btnHeight ?? 50,
        width: btnWidth ?? double.infinity,
        decoration: BoxDecoration(
            color: bgColor ?? Colors.white,
            boxShadow: boxShadow??[
              BoxShadow(
                color:  bgColor!.withOpacity(0.5), // Color of the shadow
                spreadRadius:  2, // Spread radius
                blurRadius:  5, // Blur radius
                offset: Offset( 0,  2), // Offset of the shadow
              ),
            ],
            borderRadius: BorderRadius.circular(radius ?? 10)),
        child: text
            .normalText(
                fontSize: fontSize??20,
                fontColor: fontColor ?? primaryColor,
                fontWeight: FontWeight.w500)
            .center,
      ),
    ).paddingOnly(bottom: 10);
  }
}

class AppBorderButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  Color? borderColor;
  Color? fontColor;
  double? btnWidth;
  double? btnHeight;
  double? radius;
  double? borderWidth;
  double? fontSize;
  FontWeight? fontWeight;

  AppBorderButton({
    super.key,
    required this.text,
    required this.onTap,
    this.borderColor,
    this.fontColor,
    this.radius,
    this.fontSize,
    this.btnWidth,
    this.borderWidth,
    this.fontWeight,
    this.btnHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:btnHeight ?? 50,
      width: btnWidth ?? double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10),
          border: Border.all(
              color: borderColor ?? Colors.white, width: borderWidth ?? 2)),
      child: text
          .normalText(fontWeight: fontWeight??FontWeight.w500, fontColor: fontColor,fontSize: fontSize??16)
          .center,
    ).paddingOnly(bottom: 10).onTap(onTap);
  }
}
