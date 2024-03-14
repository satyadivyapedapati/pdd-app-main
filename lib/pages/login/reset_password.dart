import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:plant_disease_detector/pages/login/create_account.dart';
import 'package:plant_disease_detector/utils/widgets/appbar.dart';
import 'package:plant_disease_detector/utils/widgets/common_widget.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _confirmpasscontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              text: 'Reset Password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
              children: const [
                TextSpan(
                  text: '\nLorem ipsum dolor sit amet consectetur adipisicing elit Dolore harum.',
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
        ),
        SizedBox(height: 32),
           CustomTextField(
              controller: _passwordcontroller,
              labelText: 'Password',
              isRequired: true,
               suffixIcon: Align(
          widthFactor:1,
          heightFactor:1,
         child: GestureDetector(
          onTap: (){
          },
           child: ImageIcon(
              AssetImage("assets/icons/password.png"),
         ),
         ),

        ),
            ),
           CustomTextField(
              controller: _confirmpasscontroller,
              labelText: 'Confirm Password',
              isRequired: true,
               suffixIcon: Align(
          widthFactor:1,
          heightFactor:1,
         child: GestureDetector(
          onTap: (){
          },
           child: ImageIcon(
              AssetImage("assets/icons/password.png"),
         ),
         ),

        ),
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
                    CreateAccount()
                
                     ));
                  },
                  child: const Text('Update')),
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