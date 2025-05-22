import 'package:flutter/material.dart';
import '../presentation/pages/login/login_page.dart';
import '../presentation/pages/home/home_page.dart';
import '../presentation/pages/signup/signup_page.dart';

class AppRoutes {
  static const String login = '/';
  static const String home = '/home';
  static const String signup = '/signup'; // nova rota

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case signup: // caso cadastro
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('Rota não encontrada: ${settings.name}'),
                ),
              ),
        );
    }
  }
}
