import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimation extends StatelessWidget {
  final double size;

  const LoadingAnimation({super.key, this.size = 90});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Lottie.asset(
        'assets/lottie/loadingdot.json',
        fit: BoxFit.contain,
        repeat: true,
        animate: true,
      ),
    );
  }
}
