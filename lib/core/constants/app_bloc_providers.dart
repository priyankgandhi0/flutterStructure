import 'package:flutter_structure/ui/auth/home/bloc/home_cubit.dart';
import 'package:flutter_structure/ui/auth/login/bloc/log_in_cubit.dart';
import 'package:flutter_structure/ui/auth/register/bloc/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/auth/welcome/bloc/welcome_cubit.dart';

class AppBlocProviders {
  AppBlocProviders._();

  static List<BlocProvider> providers = [
    BlocProvider<WelcomeCubit>(
      create: (BuildContext context) => WelcomeCubit(),
    ),
    BlocProvider<LogInCubit>(
      create: (BuildContext context) => LogInCubit(),
    ),
    BlocProvider<RegisterCubit>(
      create: (BuildContext context) => RegisterCubit(),
    ),
    BlocProvider<HomeCubit>(
      create: (BuildContext context) => HomeCubit(),
    ),
  ];
}
