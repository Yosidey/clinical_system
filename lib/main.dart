import 'package:clinical_system/screens/login/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(const HomeApp());

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "HomeApp",
      home: LoginPage(),
    );
  }
}

