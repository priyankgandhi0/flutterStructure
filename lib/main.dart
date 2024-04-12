

import 'package:flutter_structure/ui/auth/welcome/welcome_screen.dart';
import 'package:flutter_structure/utils/preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/env/build_env.dart';
import 'config/routes/routes.dart';
import 'config/theme/app_theme.dart';
import 'core/constants/app_bloc_providers.dart';
import 'core/constants/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await EasyLocalization.ensureInitialized();
  // EasyLocalization.logger.enableLevels = [
  //   LevelMessages.error,
  //   LevelMessages.warning
  // ];
  BuildEnv.init(
      buildEnvironment: BuildEnvironment.production, baseUrl: liveUrl);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarDividerColor: Colors.white,
    systemNavigationBarColor: Colors.black,
  ));
  // restClient = RestClient(baseUrl: env?.baseUrl ?? "", token: token);
  await preferences.init();
  await preferences.putAppDeviceInfo();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.providers,
      child: MaterialApp(
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        home: WelcomeScreen(),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        routes: Routes.getPage,
        initialRoute: Routes.getInitialRoute(),
        builder: (context, child) {
          final originalTextScaleFactor = MediaQuery.of(context).textScaleFactor;
          final boldText = MediaQuery.boldTextOverride(context);
          final newMediaQueryData = MediaQuery.of(context).copyWith(
            textScaleFactor: originalTextScaleFactor.clamp(0.8, 1.0),
            boldText: boldText,
          );

          return MediaQuery(
            data: newMediaQueryData,
            child: child!,
          );
        },
      ),
    );
  }
}
