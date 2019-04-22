import 'package:flutter/material.dart';
import 'package:shopping_app/colors.dart';
import 'package:shopping_app/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shopping App',
      home: LoginPage(),
      theme: ThemeData(
        accentColor: primaryColor,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
