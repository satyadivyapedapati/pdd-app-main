import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_disease_detector/pages/home/home_screen.dart';
import 'package:plant_disease_detector/utils/constants.dart';

import '../controllers/auth_controller.dart';
import '../utils/widgets/common_widget.dart';
import 'app_intro_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      AuthController.to.isFirstTime
          ? Get.offAllNamed(AppIntroScreen.routeName)
          : Get.offAllNamed(HomeScreen.routeName);
    });
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/plant.png'),
          Center(
            child: const TitleText(
              title: 'Plant Disease Detector',
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
            ],
          )
        ],
      ),
         Positioned(
          bottom: -1,
          width: Get.width,
          child: Image.asset(
            'assets/images/splashbg.png',
            width: 97,
          ),
        ),
        ],
      )
    );
  }
}
