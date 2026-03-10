import 'package:flutter/material.dart';
import 'package:it_tickets/features/onboarding/widgets/onboarding_image.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: const OnboardingImage()));
  }
}
