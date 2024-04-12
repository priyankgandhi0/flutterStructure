import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';




class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(const WelcomeState());
}

class WelcomeState extends StatefulWidget {
  const WelcomeState({super.key});

  @override
  State<WelcomeState> createState() => _WelcomeStateState();
}

class _WelcomeStateState extends State<WelcomeState> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
