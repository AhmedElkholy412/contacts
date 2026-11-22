import 'package:contact/screens/home_screen.dart';
import 'package:contact/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       initialRoute: SplashScreen().routeName,
       routes: {
         SplashScreen().routeName: (context) => SplashScreen(),
         HomeScreen().routeName: (context) => HomeScreen(),
       },
    );
  }
}


