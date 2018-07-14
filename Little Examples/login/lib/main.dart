import 'package:flutter/material.dart';
import 'package:login/login_ui/login_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login",
      theme: ThemeData.light(),
      home: Login(),
    );
  }
}