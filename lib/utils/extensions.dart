import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../core/constants/app_colors.dart';


extension AddSpace on num {
  SizedBox spaceH() {
    return SizedBox(height: toDouble());
  }

  SizedBox spaceW() {
    return SizedBox(width: toDouble());
  }
}

extension WidgetExt on Widget {
  Widget onTap(GestureTapCallback onTap) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: this,
    );
  }

  Widget onClick(GestureTapCallback onClick) {
    return GestureDetector(
      onTap: onClick,
      child: this,
    );
  }

  get center {
    return Center(
      child: this,
    );
  }
}

/// Padding
/*extension WidgetPadding on Widget {
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      child: this,
    );
  }

  Widget paddingOnly(
      {double top = 0, double bottom = 0, double left = 0, double right = 0}) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
      ),
      child: this,
    );
  }

  Widget paddingAll({double all = 0}) {
    return Padding(
      padding: EdgeInsets.all(
        all,
      ),
      child: this,
    );
  }
}*/

extension ContextExtension on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showAppSnackBar(
      {required String message}) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: primaryColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

extension StringExtension on String {
  String? get appendZeroPrefix {
    return length <= 1 ? "0$this" : this;
  }

  List<double> get toDoubleList {
    return replaceAll('[', '')
        .replaceAll(']', '')
        .split(',')
        .map((e) => e.isEmpty ? 0.1 : double.parse(e))
        .toList();
  }
}

extension DurationExtension on Duration {
  String get formattedTime {
    int sec = inSeconds % 60;
    int min = (inSeconds / 60).floor();
    return "${min.toString().appendZeroPrefix}:${sec.toString().appendZeroPrefix}";
  }
}

extension AppStyle on String {
  Text boldText(
      {FontWeight? fontWeight,
      double? fontSize,
      double? fontHeight,
      Color? color,
      TextOverflow? overflow,
      TextDecoration? decoration,
      int? maxLines,
      FontStyle? fontStyle,
      TextAlign? textAlign}) {
    return Text(this,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: GoogleFonts.montserrat(
            fontStyle: fontStyle,
            height: fontHeight ?? 0,
            color: color ?? Colors.white,
            // fontFamily: Assets.fonts.sFProNormal,
            fontSize: fontSize ?? 50,
            decoration: decoration,
            decorationColor: color ?? Colors.black,
            fontWeight: fontWeight));
  }
  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }
  Text normalText(
      {FontWeight? fontWeight,
      TextDecoration? decoration,
      double? fontSize,
      Color? fontColor,
      TextOverflow? overflow,
        int? maxLines,
      TextAlign? textAlign}) {
    return Text(this,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        style: GoogleFonts.saira(
            color: fontColor ?? appBlackColor,
            decorationColor: fontColor ?? Colors.black,
            decoration: decoration,
            fontSize: fontSize ?? 20,
            fontWeight: fontWeight));
  }
  Text normalTextAssistant(
      {FontWeight? fontWeight,
      TextDecoration? decoration,
      double? fontSize,
      Color? fontColor,
      TextOverflow? overflow,
        int? maxLines,
      TextAlign? textAlign}) {
    return Text(this,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        style: GoogleFonts.assistant(
            color: fontColor ?? Colors.white,
            decorationColor: fontColor ?? Colors.black,
            decoration: decoration,
            fontSize: fontSize ?? 20,
            fontWeight: fontWeight));
  }
}
extension DateTimeOB on DateTime {
  DateTime getLocalDateTime() {
    String dateUtc = DateFormat('yyyy-MM-dd HH:mm:ss').format(this);
    var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateUtc, true);
    var dateLocal = dateTime.toLocal();
    return dateLocal;
  }

  int getDateForChatListGroup() {
    return DateTime(year, month, day, 0, 0, 0)
        .getLocalDateTime()
        .millisecondsSinceEpoch;
  }

  String timeDifferenceForChatListGroup() {
    DateTime currentDate = DateTime.now();

    var different = currentDate.difference(this.getLocalDateTime());

    if (different.inDays > 365) return DateFormat("dd MMMM, yyyy").format(this);

    if (different.inDays >= 1) return DateFormat("dd MMMM, EEEE").format(this);

    if (different.inDays == 0) return "Today";

    return DateFormat("dd MMMM, yyyy").format(this);
  }

  String timeAgo() {
    return DateFormat("h:mm a").format(this);
  }
}

String convertDateFormat(String dateString) {
  // Parse the input string date
  DateTime date = DateTime.parse(dateString);

  // Define the desired output format
  final DateFormat formatter = DateFormat('ddMMMyyyy');

  // Format the date according to the desired format
  String formattedDate = formatter.format(date);

  return formattedDate;
}

String formatDateTime(DateTime dateTime) {
  // Define the desired output format
  final DateFormat formatter = DateFormat('dd MMM yyyy');

  // Format the DateTime object according to the desired format
  String formattedDate = formatter.format(dateTime);

  return formattedDate;
}

String convertTimeToAmPm(String timeString) {
  // Define the input and output formats
  final DateFormat inputFormat = DateFormat('HH:mm:ss');
  final DateFormat outputFormat = DateFormat('hh:mm a');

  // Parse the input time string
  final DateTime dateTime = inputFormat.parse(timeString);

  // Format the DateTime object to AM/PM format
  final String formattedTime = outputFormat.format(dateTime);

  return formattedTime;
}

extension WidgetPaddingX on Widget {
  Widget paddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(
          padding:
          EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: this);

  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
          padding: EdgeInsets.only(
              top: top, left: left, right: right, bottom: bottom),
          child: this);

  Widget get paddingZero => Padding(padding: EdgeInsets.zero, child: this);
}



void printData({required dynamic tittle, dynamic val}) {
  log("$tittle:-$val");
}

bool isEmailValid(String email) {
  RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regex.hasMatch(email);
}