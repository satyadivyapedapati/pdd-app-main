import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_disease_detector/pages/login/reset_password.dart';
import 'package:plant_disease_detector/utils/widgets/appbar.dart';

import '../../utils/constants.dart';

class VerifyPassword extends StatefulWidget {
  const VerifyPassword({super.key});

  @override
  State<VerifyPassword> createState() => _VerifyPasswordState();
}

class _VerifyPasswordState extends State<VerifyPassword> {

late FocusNode text1, text2, text3, text4;
 late String text1Value,
      text2Value,
      text3Value,
      text4Value;

       @override
  void initState() {
    text1 = FocusNode();
    text2 = FocusNode();
    text3 = FocusNode();
    text4 = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    text1.dispose();
    text2.dispose();
    text3.dispose();
    text4.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  Color(0xFFFFF2EE),
      body:    Column(
        children: [
          AppBarWithSearch(
            hasBackArrow: true,
          ),
           
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
      children: [
        SizedBox(height: 32),

        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                // textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Enter 4 digit Code',
                  style: GoogleFonts.outfit(
                    color: kmaindarkColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  children: const [
                    TextSpan(
                      text: '\nCode is sent to',
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                          color: Color(0xFF3A4346),
                      ),
                    ),
                    TextSpan(
                      text: ' 01965366147',
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                          color: Color(0xFF3A4346),
                      ),
                    ),
                  ],
                ),
            ),
             ImageIcon(
                  AssetImage("assets/icons/duration.png"),
                  color: kPrimaryColor,
                  size: 20,
             ),
          ],
        ),
       
        SizedBox(height: 32),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
          children: [
                    
                SizedBox(
                  width: size.width * .12,
                  height: size.width * .12,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      fillColor:  Colors.white,
                      focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    focusNode: text1,
                    validator: (value) {
                      if (value == null || value.length != 1) {
                        return 'Invalid code';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (value.length == 1) {
                        text1Value = value;
                        FocusScope.of(context).requestFocus(text2);
                      }
                    },
                  ),
                ),
              
                SizedBox(
                  width: size.width * .12,
                  height: size.width * .12,
                  child: TextFormField(
                     decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      fillColor:  Colors.white,
                      focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    focusNode: text2,
                    validator: (value) {
                      if (value == null || value.length != 1) {
                        return 'Invalid code';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (value.length == 1) {
                        text2Value = value;
                        FocusScope.of(context).requestFocus(text3);
                      }
                    },
                  ),
                ),
              
                SizedBox(
                  width: size.width * .12,
                  height: size.width * .12,
                  child: TextFormField(
                     decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      fillColor:  Colors.white,
                      focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    focusNode: text3,
                    validator: (value) {
                      if (value == null || value.length != 1) {
                        return 'Invalid code';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (value.length == 1) {
                        text3Value = value;
                        FocusScope.of(context).requestFocus(text4);
                      }
                    },
                  ),
                ),
              
                SizedBox(
                  width: size.width * .12,
                  height: size.width * .12,
                  child: TextFormField(
                     decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      fillColor:  Colors.white,
                      focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    focusNode: text4,
                    validator: (value) {
                      if (value == null || value.length != 1) {
                        return 'Invalid code';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (value.length == 1) {
                        text4Value = value;
                        FocusScope.of(context).requestFocus(FocusNode());
                      }
                    },
                  ),
                ),
            
          ],
        ),

             SizedBox(height: 32),

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
                    ResetPassword()
                     ));
                  },
                  child: const Text('Submit')),
              ),
            ),

               SizedBox(height: 32),

             RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Didn’t receive the OTP?",
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black),
                children: [
                  TextSpan(
                    text: ' Resend',
                    style: TextStyle(
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