import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          return const SplashScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/bettyboom.png')),
          const SizedBox(
            height: 10,
          ),
          Center(child: Image.asset('assets/images/betty-boop-logo-2.png'))
        ],
      ),
    );
  }
}
