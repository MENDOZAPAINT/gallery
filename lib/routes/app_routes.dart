import 'package:flutter/material.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/user/user_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String user = '/user';

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const MyHomePage(),
        user: (context) => const UserPage(),
      };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('Ruta no encontrada'),
        ),
      ),
    );
  }
}
