import 'package:c_clark_workshop/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'core/config/app_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.instance.init();

  runApp(
    MultiProvider(providers: AppProviders.providers, child: const MyApp()),
  );
}
