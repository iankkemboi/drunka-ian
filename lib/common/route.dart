import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:drunka/login/views/login_screen.dart';
import 'package:drunka/main.dart';
import 'package:drunka/dashboard/views/dashboard_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return  MaterialPageRoute(
            builder: (_)=> HomePage()
        );
      case '/loginPage' :
        return MaterialPageRoute(
            builder: (_)=> LoginPage()
        ) ;
      case '/dashboardPage' :
        return MaterialPageRoute(
            builder: (_)=> DashboardPage()
        ) ;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}