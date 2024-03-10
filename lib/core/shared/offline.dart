import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Offline extends StatelessWidget {
  const Offline({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset("assets/animation/offline.json",
            repeat: false, frameRate: const FrameRate(60)));
  }
}
