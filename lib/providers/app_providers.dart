import 'package:c_clark_workshop/providers/theme_provider.dart';
import 'package:c_clark_workshop/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  AppProviders._();

  static List<SingleChildWidget> get providers {
    return [
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(),
      ),
      ChangeNotifierProvider<UserProvider>(
        create: (_) => UserProvider(),
      )
    ];
  }
}
