import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_disease_detector/utils/constants.dart';

class LoginIntro extends StatelessWidget {
  const LoginIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Welcome Back',
            style: GoogleFonts.outfit(
              color: kmaindarkColor,
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
