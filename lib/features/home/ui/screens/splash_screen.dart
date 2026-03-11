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
    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => widget.nextWidget),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: const AlwaysStoppedAnimation(0),
        builder: (context, child) =>
            Center(child: Image.asset('assets/images/logo.gif')),
      ),
    );
  }
}
