import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/application/home/home_controller.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      context.read<HomeController>().loadHome();
      Navigator.pushNamed(context, home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child:
                  Image.asset('assets/images/Animation - 1710444458468.gif')),
        ],
      ),
    );
  }
}
