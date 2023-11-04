import 'package:flutter/material.dart';
import 'package:travelapp/screens/dashboard.dart';
import 'package:travelapp/screens/login.dart';
import 'package:travelapp/screens/splash_screen.dart';

void main() {
  runApp(const Travelbuddy());
}

class Travelbuddy extends StatelessWidget {
  const Travelbuddy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
