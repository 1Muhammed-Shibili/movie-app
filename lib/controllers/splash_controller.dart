import 'package:get/get.dart';
import 'dart:async';

import 'package:movie_app/screens/home_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() {
    Timer(Duration(seconds: 3), () {
      Get.off(HomeScreen());
    });
  }
}
