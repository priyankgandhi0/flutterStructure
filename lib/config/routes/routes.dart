import 'package:flutter_structure/ui/auth/home/home_screen.dart';
import 'package:flutter_structure/ui/auth/register/register_screen.dart';
import 'package:flutter_structure/ui/auth/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../../core/constants/user_type.dart';
import '../../ui/auth/login/login_screen.dart';
import '../../utils/preference.dart';

class Routes {
  Routes._();

  // Auth

  static const String welcome = "/welcome";
  static const String splash = "/splash";
  static const String login = "/login";
  static const String register = "/register";

  static const String forgot = "/forgot";

  // Main
  static const String home = "/home";

  static Map<String, Widget Function(BuildContext)> getPage = {
    // Auth
    welcome: (context) =>  WelcomeScreen(),
    splash: (context) =>  Container(),
    login: (context) =>  LogInScreen(),
    register: (context) => RegisterScreen(),
    home: (context) =>  HomeScreen(),

  };

  static String getInitialRoute() {
    if (preferences.getBool(SharedPreference.isLogIn) ?? false) {
        return Routes.home;
    } else {
      return Routes.welcome;
    }
  }

  static appPushScreen(BuildContext context, String route, {Object? argument}) {
    Navigator.pushNamed(
      context,
      route,
      arguments: argument,
    );
  }

  static appBackScreen(BuildContext context) {
    Navigator.pop(context);
  }

  static appPopAllScreen(BuildContext context, String route,
      {Object? argument}) {
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }
}
