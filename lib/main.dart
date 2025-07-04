import 'package:flutter/material.dart';
import 'package:get_calley_app/screens/language_selection_screen.dart';
import 'package:get_calley_app/screens/login_screen.dart';
import 'package:get_calley_app/screens/welcome_signup_screen.dart';
import 'package:get_calley_app/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Calley',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      home: LanguageSelectionScreen(), // Changed from initialRoute
      routes: {
        '/welcome': (context) => WelcomeSignupScreen(),
        '/login': (context) => const LoginScreen(),

      },
    );
  }
}