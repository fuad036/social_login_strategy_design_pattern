import 'package:flutter/material.dart';
import 'package:social_login_strategy/social_login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social login strategy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SocialLoginScreen(),
    );
  }
}
