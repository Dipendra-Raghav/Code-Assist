import 'package:code_assist/features/auth/screens/login_screen.dart';
import 'package:code_assist/theme/pallete.dart';
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
      title: 'Code Assist',
      theme: Pallete.darkModeAppTheme,
      home: const LoginScreen(),
    );
  }
}
