import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashScreenController _controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/icon.jpg', fit: BoxFit.cover),
      ),
    );
  }
}
