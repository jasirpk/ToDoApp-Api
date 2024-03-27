import 'package:flutter/material.dart';
import 'package:todo_api/Screeens/splash.dart';

void main() {
  runApp(const ToDo_Api());
}

class ToDo_Api extends StatelessWidget {
  const ToDo_Api({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent)),
      home: SplashScreen(),
    );
  }
}
