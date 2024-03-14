import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:plant_disease_detector/utils/constants.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             Container(
        padding:  EdgeInsets.only(top: MediaQuery.of(context).padding.top+16, bottom: 16),
          width: Get.width,
            decoration: BoxDecoration(
         color:const Color(0xFF0D6526),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          GestureDetector(
            onTap: (){
           Get.back();
            },
            child: Icon(Icons.arrow_back,
            color: Colors.white,
            )
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              space1C,
              Text('Notification',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
            ),

            ],
          ),

          SizedBox()
            ],
          ),
        ),
        ),
            space4C,

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3,),
              child: Card(
                elevation: 5,
                shape: BeveledRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),

                shadowColor: Colors.white,
                child: Container(
                  height: 66,
                  width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    space3R,
                    Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                                 child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset('assets/images/incomebg.png')),
                                ),
                                space4R,
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          space4C,
                           Text("Jenny Roy", style: TextStyle(fontSize: 18.0,color: Colors.black,fontWeight: FontWeight.w700),
          ),
          space1C,
                           Text("Date: 10-08-2022", style: TextStyle(fontSize: 10.0,color: Colors.black,fontWeight: FontWeight.w400),
          ),
                        ],
                      ),
                  ],
                ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8,),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        space3C,
                         Container(
                        height: 18,
                        width: 74,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Color(value)
                          color: kTextFieldBackground
                        ),
                        child: Center(
                          child: Text('Pending',
                      style: TextStyle(
                          fontSize: 8,
                          color: Color(0xFF0D6526)
                      ),
                      ),
                        ),
                      ),
          space1C,
                         Text("Time: 10:30 PM", style: TextStyle(fontSize: 10.0,color: Colors.black,fontWeight: FontWeight.w500),
          ),
                      ],
                    ),
                 ),
              ]),
          
                ),
              ),
            ),
         
          ],
        ),
      ),
    );
  }
}