import 'package:flutter/material.dart';
import 'package:intro_flutter/home_screen.dart';
import 'package:intro_flutter/pages/counter_screen_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen()
    );
  }
}