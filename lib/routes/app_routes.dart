import 'package:coleta_portel/presentation/pages/forgot%20password/forgot_password_page.dart';
import 'package:coleta_portel/presentation/pages/login/login_page.dart';
import 'package:coleta_portel/presentation/pages/start/start_page.dart';
import 'package:coleta_portel/presentation/pages/signup/signup_page.dart'; // nova página
import 'package:flutter/material.dart';

class AppRoutes {
  static const String start = '/start';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgotpassword';
  static const String AdminDashboard = '/admindashboard';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case start:
        return MaterialPageRoute(builder: (_) => StartPage());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case AdminDashboard:
        return MaterialPageRoute(builder: (_) => const AdminDashboardPage());
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
