import 'package:flutter/material.dart';
import 'package:flutter_core/flutter_core.dart';

import 'app_config.dart';
import 'constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.instance.configApp(env: Env.dev);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo App',
      theme: ThemeConstants.get(context),
      onGenerateRoute: RouteConfig.instance.routes,
      onGenerateInitialRoutes: (_) => [
        RouteConfig.instance.routeWithName(
          routeName: RouteConstants.employee,
        ),
      ],
      builder: EasyLoading.init(),
    );
  }
}
