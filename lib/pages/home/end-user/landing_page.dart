import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_disease_detector/pages/home/home_screen.dart';
import 'package:plant_disease_detector/pages/home/image_picker.dart';
import 'package:plant_disease_detector/pages/login/login_screen.dart';
import 'package:plant_disease_detector/utils/constants.dart';
import 'package:plant_disease_detector/utils/widgets/appbar.dart';
import 'package:plant_disease_detector/utils/widgets/common_widget.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  Container _imgRecognition() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(
            211, 211, 211, .6), //here i want to add opacity
        border: Border.all(
          color: Colors.black54,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  //  VerifyScreen()
                  // ForgetScreen()
                  const ImagePickerScreen(),
            ),
          );
        },
        child: Column(
          children: [
            const Text(
              'Image Recognition',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Upload images of your apple crops for disease identification',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade900,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Start Image Recognition',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green.shade800,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _infoHub() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(
            211, 211, 211, .6), //here i want to add opacity
        border: Border.all(
          color: Colors.black54,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            const Text(
              'Information Hub',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Explore articles and resources related to apple crop diseases.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade900,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Go to information hub',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green.shade800,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/image-recognition-page.jpg"),
              fit: BoxFit.cover,
              opacity: 0.9,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              const Text(
                'Welcome to the Apple Crop Disease Identification App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                'Identify diseases affecting your apple orchards with ease.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _imgRecognition(),
              _infoHub(),
              space5C
            ],
          ),
        ),
      ),
      // backgroundColor: Colors.white,
    );
  }
}
