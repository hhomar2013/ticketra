import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:it_tickets/Core/Helpers/cash_helper.dart';
import 'package:it_tickets/Core/Routing/routes.dart';
import 'package:it_tickets/Core/theming/app_transitions.dart';
import 'package:it_tickets/features/auth/ui/screens/login_screen.dart';
import 'package:it_tickets/features/home/ui/screens/home_screen.dart';
import 'package:it_tickets/features/home/ui/screens/splash_screen.dart';
import 'package:it_tickets/features/onboarding/onboarding_screen.dart';

class AppRouter {
  final token = CacheHelper.getData2(key: 'token');
   late bool isLoggedIn = token != null && token != '';
  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(
            nextWidget: isLoggedIn
                ? const HomeScreen()
                : const LoginScreen(),
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
