import 'package:drunka/question/viewmodel/question_repository.dart';
import 'package:drunka/dashboard/viewmodel/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drunka/common/theme.dart';
import 'package:drunka/login/model/user_repository.dart';
import 'package:drunka/login/views/login_screen.dart';
import 'package:drunka/dashboard/views/dashboard_screen.dart';
import 'package:drunka/common/route.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserRepository.instance()),
        ChangeNotifierProvider(create: (_) => CategoryRepository()),
        ChangeNotifierProvider(create: (_) => QuestionRepository()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        title: 'Product App',
        theme: appTheme,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      // ignore: missing_return
      builder: (context, UserRepository user, _) {
        switch (user.status) {

          case Status.Uninitialized:
            //TODO : SPLASH SCREEN
            return LoginPage();

          case Status.Unauthenticated:
            return LoginPage();

          case Status.Authenticating:
            return LoginPage();

          case Status.Authenticated:
            return DashboardPage();
        }
      },
    );
  }
}
