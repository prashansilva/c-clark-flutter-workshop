import 'package:c_clark_workshop/routes/app_router.dart';
import 'package:c_clark_workshop/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/constants/constants.dart';
import 'providers/providers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,

      initialRoute: AppRoutes.initial,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
