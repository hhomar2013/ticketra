import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snackify/enums/snack_enums.dart';
import 'package:snackify/snackify.dart';

void CustomSnackBar(BuildContext context) {
  Snackify.show(
    context: context,
    type: SnackType.warning,
    title: const Text(
        'Logout ✔️',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
    ),
    subtitle: const Text(
      'Come back soon 👋👌',
      style: TextStyle(color: Colors.white),
    ),
    position: SnackPosition.bottom,
    backgroundGradient: const LinearGradient(
      colors: [
        Color(0xFF232526), // رمادي داكن جداً (Zara Style)
        Color(0xFF414345), // أفتح قليلاً لإعطاء عمق
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    duration: const Duration(seconds: 3),
  );
}