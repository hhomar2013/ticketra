import 'package:flutter/material.dart';
import 'package:it_tickets/Core/Helpers/extentions.dart';
import 'package:it_tickets/Core/Routing/routes.dart';
import 'package:it_tickets/Core/theming/colors.dart';

class OnboardingImage extends StatefulWidget {
  const OnboardingImage({super.key});

  @override
  State<OnboardingImage> createState() => _OnboardingImageState();
}

class _OnboardingImageState extends State<OnboardingImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset('assets/images/logo.png', width: 400, height: 400),
        ),
        Container(
          width: double.infinity,
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.10, 0.4],
              colors: [
                ColorsManager.mainBlue,
                ColorsManager.mainBlue.withOpacity(0.1),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 150,
          left: 0,
          right: 0,
          child: Column(
            children: const [
              Text(
                'Welcome to Tickera',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Your one-stop solution for IT support tickets',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 15,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                context.pushNamed(Routes.loginScreen);
              },
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: ColorsManager.mainBlue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 12.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
