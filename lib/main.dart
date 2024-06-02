import 'package:flutter/material.dart';
import 'package:login_app/register.dart';
import 'package:login_app/login.dart';
import 'package:login_app/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system, // Automatically switch theme based on system settings
      home: MyLogin(),
      routes: {
        'register': (context) => MyRegister(),
        'login': (context) => MyLogin(),
        'dashboard': (context) => DashboardScreen(),

      },
    );
  }
}

