import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return   Scaffold(
      backgroundColor:  Color(0xFFFFF2EE),
      body: 
      Column(
        children: [
             AppBarWithSearch(
            hasBackArrow: true,
          ),
           
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(
              text: 'Did You Forget Your\n Password?',
              style: GoogleFonts.outfit(
                color: kmaindarkColor,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              children: [
                TextSpan(
                  text: '\nLorem ipsum dolor sit amet consectetur adipisicing elit Dolore harum.',
                  style: GoogleFonts.outfit(
                    height: 1.5,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF3A4346),
                  ),
                ),
              ],
            ),
        ),
        SizedBox(height: 32),
           CustomTextField(
              controller: _controller,
              labelText: 'Email or Phone',
              hintText: '+880 1234 567855',
              isRequired: true,
               prefixIcon: Align(
          widthFactor:1,
          heightFactor:1,
         child: GestureDetector(
          onTap: (){
          },
           child: ImageIcon(
              AssetImage("assets/icons/calender.png"),
         ),
         ),

        ),
            ),

             SizedBox(height: 16),

            SizedBox(
              width: Get.width,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: GestureDetector(
                  onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    VerifyPassword()
                    // ForgetScreen()
                     ));
                  },
                  child: const Text('Send')),
              ),
            ),

               SizedBox(height: 40),

             RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Already have the account?",
                style:  GoogleFonts.outfit(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                     color: Color(0xFF3A4346),
                    ),
                children: [
                  TextSpan(
                    text: ' Sign In',
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
      ],
    ),
          ),
        
        ],
      ),
    );
  
  }
}