import 'package:flutter/material.dart';
import '../core/constants/constants.dart';
import '../core/extensions/context_extensions.dart';
import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
        return _buildRoute(settings, const _RouteNotFoundScreen());
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
