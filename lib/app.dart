import 'package:c_clark_workshop/providers/theme_provider.dart';
import 'package:c_clark_workshop/routes/app_router.dart';
import 'package:c_clark_workshop/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/constants/constants.dart';
import 'core/services/navigation_service.dart';
import 'core/theme/app_theme.dart';
import 'providers/providers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      navigatorKey: NavigationService.instance.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeProvider.themeMode,
      initialRoute: AppRoutes.initial,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
