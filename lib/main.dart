import 'package:flutter/material.dart';
import 'package:clinical_system/screens/welcome/welcome_screen.dart';


void main() => runApp(const HomeApp());

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "HomeApp",
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}
