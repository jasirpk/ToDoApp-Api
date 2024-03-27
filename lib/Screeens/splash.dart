import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_api/Screeens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    got0List();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/images/Animation - 1711475544104.json'),
      ),
    );
  }

  Future<void> got0List() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => Home_Screen(),
      ),
    );
  }
}
