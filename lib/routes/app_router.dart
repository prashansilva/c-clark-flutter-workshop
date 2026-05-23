import 'package:flutter/material.dart';
import '../core/constants/constants.dart';
import '../core/extensions/context_extensions.dart';
import '../features/main/presentation/screens/main_screen.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
      case AppRoutes.splash:
        return _buildRoute(settings, const SplashScreen());
      case AppRoutes.onboarding:
        return _buildRoute(settings, const OnboardingScreen());
      case AppRoutes.main:
        return _buildRoute(settings, const MainShellScreen());
      default:
        return _buildRoute(settings, const _RouteNotFoundScreen());
    }
  }

  static MaterialPageRoute<dynamic> _buildRoute(
    RouteSettings settings,
    Widget page,
  ) {
    return MaterialPageRoute<dynamic>(settings: settings, builder: (_) => page);
  }
}

class _RouteNotFoundScreen extends StatelessWidget {
  const _RouteNotFoundScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Route Not Found')),
      body: const Center(child: Text(AppStrings.somethingWentWrong)),
    );
  }
}
