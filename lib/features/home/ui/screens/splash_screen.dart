import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget nextWidget; // الـ Widget اللي المفروض يفتح بعد الـ Splash

  const SplashScreen({super.key, required this.nextWidget});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ننتظر 3 ثواني عشان الـ GIF يتحرك وبعدين نروح للي بعده
    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => widget.nextWidget),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // اللون البرتقالي بتاعك
      body: AnimatedBuilder(
        animation: const AlwaysStoppedAnimation(0), // عشان الـ GIF يتحرك
        builder: (context, child) =>
            Center(child: Image.asset('assets/images/logo.gif')),
      ),
    );
  }
}
