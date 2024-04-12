import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final TextStyle _textStyle = GoogleFonts.roboto();

  static TextTheme get lightTextTheme => TextTheme(
        bodyLarge: const TextStyle(color: appBlackColor),
        bodyMedium: const TextStyle(color: appBlackColor),
        bodySmall: const TextStyle(color: appBlackColor),
        labelLarge: const TextStyle(color: appBlackColor),
        labelMedium: const TextStyle(color: appBlackColor),
        labelSmall: const TextStyle(color: appBlackColor),
        headlineLarge: const TextStyle(color: appBlackColor),
        headlineMedium: const TextStyle(color: appBlackColor),
        headlineSmall: const TextStyle(color: appBlackColor),
        displayLarge: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: appBlackColor,
        ),
        displaySmall: GoogleFonts.roboto(
          fontSize: 16,
          color: appBlackColor,
        ),
      );

  // static TextTheme get darkTextTheme => TextTheme(
  //   bodyLarge: const TextStyle(color: white),
  //   bodyMedium: const TextStyle(color: white),
  //   bodySmall: const TextStyle(color: white),
  //   labelLarge: const TextStyle(color: white),
  //   labelMedium: const TextStyle(color: white),
  //   labelSmall: const TextStyle(color: white),
  //   headlineLarge: const TextStyle(color: white),
  //   headlineMedium: const TextStyle(color: white),
  //   headlineSmall: const TextStyle(color: white),
  //   displayLarge: GoogleFonts.inter(
  //     fontSize: 16,
  //     fontWeight: FontWeight.w700,
  //     color: white,
  //   ),
  //   displaySmall: GoogleFonts.inter(
  //     fontSize: 16,
  //     color: white,
  //   ),
  // );
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: primaryColor,
    primaryColorLight: createMaterialColor(primaryColor),
    primarySwatch: createMaterialColor(primaryColor),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: primaryColor,
        selectionColor: primaryColor.withOpacity(0.5),
        selectionHandleColor: primaryColor),
    primaryColorDark: primaryColor,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
      },
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 8,
    ),
    splashColor: primaryColor,
    scaffoldBackgroundColor: scaffoldLightBgColor,
    iconTheme: const IconThemeData(
      color: primaryColor,
    ),
    textTheme: GoogleFonts.robotoTextTheme(lightTextTheme),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: white,
      filled: true,
      focusColor: primaryColor,
      labelStyle: const TextStyle(
        color: white,
        fontSize: 24,
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          width: 1,
          color: textFieldBorderColor.withOpacity(0.2),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          width: 1,
          color: textFieldBorderColor.withOpacity(0.2),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          width: 1,
          color: textFieldBorderColor.withOpacity(0.2),
        ),
      ),
      hintStyle: _textStyle.copyWith(
        color: hintTextColor,
        fontSize: 24,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              side: BorderSide.none,
            )),
            overlayColor:
                MaterialStateProperty.all(primaryColor.withOpacity(0.2)))),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: primaryColor,
        minimumSize: const Size(88, 36),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0),
          ),
          side: BorderSide.none,
        ),
        textStyle: const TextStyle(
          color: white,
          fontSize: 24,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      elevation: 0,
      surfaceTintColor: primaryColor,splashFactory: InkSplash.splashFactory,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
        side: BorderSide(color: primaryColor, width: 1),
      ),
      side: const BorderSide(color: primaryColor),
      textStyle: const TextStyle(
          color: primaryColor, fontSize: 20, fontWeight: FontWeight.w700),
    )),
    disabledColor: Colors.blueGrey,
  );

// static ThemeData darkTheme = ThemeData(
//   useMaterial3: true,
//   primaryColor: primaryColor,
//   primarySwatch: createMaterialColor(primaryColor),
//   primaryColorLight: createMaterialColor(primaryColor),
//   primaryColorDark: primaryColor,
//   textSelectionTheme: TextSelectionThemeData(
//       cursorColor: primaryColor,
//       selectionColor: primaryColor.withOpacity(0.5),
//       selectionHandleColor: primaryColor),
//   pageTransitionsTheme: const PageTransitionsTheme(
//     builders: {
//       TargetPlatform.android: CupertinoPageTransitionsBuilder(),
//       TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
//     },
//   ),
//   splashColor: primaryColor,
//   textTheme: GoogleFonts.robotoTextTheme(darkTextTheme),
//   scaffoldBackgroundColor: darkBgColor,
//   iconTheme: const IconThemeData(color: white),
//   inputDecorationTheme: InputDecorationTheme(
//     fillColor: darkTextFieldFillColor,
//     focusColor: primaryColor,
//     labelStyle: const TextStyle(
//       color: black,
//       fontSize: 24,
//     ),
//     focusedBorder: const OutlineInputBorder(
//       borderRadius: BorderRadius.all(Radius.circular(5)),
//       borderSide: BorderSide(
//         color: primaryColor,
//       ),
//     ),
//     border: const OutlineInputBorder(
//       borderRadius: BorderRadius.all(Radius.circular(5)),
//       borderSide: BorderSide(
//         width: 1,
//         color: darkTextFieldBorderColor,
//       ),
//     ),
//     enabledBorder: const OutlineInputBorder(
//       borderRadius: BorderRadius.all(Radius.circular(5)),
//       borderSide: BorderSide(
//         width: 1,
//         color: darkTextFieldBorderColor,
//       ),
//     ),
//     disabledBorder: const OutlineInputBorder(
//       borderRadius: BorderRadius.all(Radius.circular(5)),
//       borderSide: BorderSide(
//         width: 1,
//         color: darkTextFieldBorderColor,
//       ),
//     ),
//     hintStyle: _textStyle.copyWith(
//       color: hintColor,
//       fontSize: 24,
//     ),
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       disabledBackgroundColor: Colors.grey,
//       disabledForegroundColor: Colors.white38,
//       foregroundColor: textFieldBorderColor,
//       shadowColor: black.withOpacity(0.25),
//       backgroundColor: darkBgColor,
//       minimumSize: const Size(88, 36),
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(5),
//         ),
//         side: BorderSide(
//           color: darkTextFieldBorderColor,
//           width: 1,
//         ),
//       ),
//       textStyle: const TextStyle(
//         color: white,
//         fontSize: 24,
//       ),
//     ),
//   ),
//   textButtonTheme: TextButtonThemeData(
//     style: TextButton.styleFrom(
//       foregroundColor: white,
//     ),
//   ),
// );
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
