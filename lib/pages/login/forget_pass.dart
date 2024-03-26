import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_disease_detector/pages/login/login_screen.dart';
import 'package:plant_disease_detector/pages/login/verify_pass.dart';
import 'package:plant_disease_detector/utils/constants.dart';
import 'package:plant_disease_detector/utils/widgets/appbar.dart';
import 'package:plant_disease_detector/utils/widgets/common_widget.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Already have an account? ",
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black),
              children: [
                TextSpan(
                  text: 'Login here',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const AppBarWithSearch(
            hasBackArrow: true,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  text: TextSpan(
                    text: 'Forgot Your Password?',
                    style: GoogleFonts.gabarito(
                      color: kmaindarkColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                    ),
                    children: [
                      TextSpan(
                        text:
                            '\n\nYou can reset your password by providing your email address',
                        style: GoogleFonts.gabarito(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              CustomTextFieldAlt(
                controller: _controller,
                labelText: 'Email',
                hintText: 'Enter your email',
                isRequired: true,
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              const SizedBox(height: 32),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: SizedBox(
                  width: Get.width,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.blue.shade800,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyPassword()
                              // ForgetScreen()
                              ),
                        );
                      },
                      child: const Text(
                        'Send',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
