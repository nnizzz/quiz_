import 'package:flutter/material.dart';
import 'package:flutter_application_1/quizapp/intro_scrn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  intross(),
      debugShowCheckedModeBanner: false,
    );
  }
}