import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';



class AppProgress extends StatelessWidget {
  const AppProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Expanded(
                    child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.25),
                  ),
                ))
              ],
            ),
            const CircularProgressIndicator(
              color: primaryColor,
              strokeWidth: 5,
            )
          ],
        )));
  }
}
