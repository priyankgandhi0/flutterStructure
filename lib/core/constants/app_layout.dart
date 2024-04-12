import 'package:flutter/material.dart';

import 'app_colors.dart';



UnderlineInputBorder startupTextFieldBorder(double? radius) {
  return UnderlineInputBorder(
      // borderRadius: BorderRadius.circular(5),
      // gapPadding: 0,
      borderSide: const BorderSide(color: hintTextColor, width: 2.0));
}

UnderlineInputBorder startupTextFieldFocusBorder(double? radius) {
  return UnderlineInputBorder(
      // borderRadius: BorderRadius.circular(7),
      // gapPadding: 0,
      borderSide: BorderSide(color: appBlackColor, width: 2.0));
}

OutlineInputBorder startupTextFieldOuterBorder(double? radius) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 10),
      gapPadding: 0,
      borderSide: const BorderSide(color: tabIndictorColor));
}

OutlineInputBorder startupTextFieldFocusOuterBorder(double? radius) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 10),
      gapPadding: 0,
      borderSide: BorderSide(color: appBlackColor));
}

Border boxBorder([Color? strokeColor]) {
  return Border.all(
    color: strokeColor ?? Colors.white,
    width: 2,
  );
}

List<BoxShadow> boxShadow() {
  return [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 10,
      offset: const Offset(0, 2),
    ),
  ];
}
