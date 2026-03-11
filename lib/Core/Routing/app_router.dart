import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:it_tickets/Core/Helpers/cash_helper.dart';
import 'package:it_tickets/Core/Routing/routes.dart';
import 'package:it_tickets/Core/theming/app_transitions.dart';
import 'package:it_tickets/features/auth/ui/screens/login_screen.dart';
import 'package:it_tickets/features/home/ui/screens/home_screen.dart';
import 'package:it_tickets/features/onboarding/onboarding_screen.dart';

class AppRouter {
  late String token = CacheHelper.getData2(key: 'token');
  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => AnimatedSplashScreen(
            backgroundColor: Colors.white,
            splashIconSize: 400,
            duration: 3000,
            animationDuration: const Duration(seconds: 1),
            splash: Image.asset('assets/images/logo.gif'),
            nextRoute: token == ''
                ? Routes.onBoardingScreen
                : Routes.homeScreen,
            nextScreen: const SizedBox(),
          ),
        );

      case Routes.onBoardingScreen:
        return AppTransitions.slideFade(const OnboardingScreen());

      case Routes.loginScreen:
        return AppTransitions.slideFade(const LoginScreen());

      case Routes.homeScreen:
        return AppTransitions.slideFade(const HomeScreen());
      default:
        return AppTransitions.slideFade(const HomeScreen());
    }
  }
}
