import 'package:flutter/material.dart';
import 'package:plant_disease_detector/utils/constants.dart';
import 'package:plant_disease_detector/utils/widgets/common_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static String routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFFFFF2EE),
       body: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 65,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               
              children: [
               Row(
                children: [
                    CircleAvatar(
                                      radius: 33,
                                        backgroundColor: Color(0xFFC4D0FB),
              backgroundImage: AssetImage("assets/images/manimg.png"),
                                    ),
                    space2R,
               Column(
                 children: [
                   TitleText(
              title: 'Hello Hira  👋',
              color:  Color(0xFF171F46),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              ),
                   TitleText(
              title: 'Welcome back again!',
              color: kparagraphColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              ),
                 ],
               ),
                ],
               ),
                 CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      child:  Center(
                                child:    ImageIcon(
                      AssetImage("assets/icons/notification.png"),
                      color: Color(0xFF171F46),
                      size: 15,
                 ),
                  ),
                                    ),
              ],
             ),
                 SizedBox(height: 24,),
                         Container(
                      height: 146,
                      width: 345,
                       decoration: BoxDecoration(
           gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFFF7B54),
                 Color(0xFFFF7E58),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(16)),
                              ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(children: [
                        Image.asset("assets/images/dashboardd.png",
           height: 122,
           width: 122,
            fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    TitleText(
                           title: 'Upcoming Quiz',
                           color: Colors.white,  
                          fontSize: 12, 
                          fontWeight: FontWeight.w700 
                        ),
                          SizedBox(height: 8,),
                    TitleText(
                           title: 'Science Smarts: A\nBrain-Busting Quiz',
                           color: Colors.white,  
                          fontSize: 16, 
                          fontWeight: FontWeight.w600 
                        ),
                        SizedBox(height: 8,),
                          Container(  
            height: 30,  
            width: 80,  
              decoration: BoxDecoration(  
                borderRadius: BorderRadius.circular(20),  
                color: Color.fromRGBO(255, 255, 255, 0.3),  
              ),
        
              child:   Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   ImageIcon(
                      AssetImage("assets/icons/play.png"), 
                      color: Colors.white, 
                      size: 18,  
                 ),
                 space1R,
                  TitleText(
                             title: 'Play Now',
                             color: Colors.white,  
                            fontSize: 10, 
                            fontWeight: FontWeight.w500 
                          ),
                ],
              ),
                 ),  
                ],
              ),
            )
                      ]),
                    ),
                    ),
              SizedBox(height: 22,),
              TitleText(
                           title: 'Popular Categories',
                           color: kmaindarkColor,  
                          fontSize: 16, 
                          fontWeight: FontWeight.w500 
                        ),
                        SizedBox(height: 12,),
              Row(
                children: [
                   Column(
                     children: [
                       CircleAvatar(
                                        radius: 33,
              backgroundImage: AssetImage("assets/icons/row1.png"),
                                      ),
                                       SizedBox(height: 8,),
                                        TitleText(
                           title: 'All Quiz',
                           color: kPrimaryColor,  
                          fontSize: 12, 
                          fontWeight: FontWeight.w400 
                        ),
                     ],
                   ),
                   space3R,
                   Column(
                     children: [
                       CircleAvatar(
                                        radius: 33,
              backgroundImage: AssetImage("assets/icons/row1.png"),
                                      ),
                                       SizedBox(height: 8,),
                                        TitleText(
                           title: 'All Quiz',
                           color: kPrimaryColor,  
                          fontSize: 12, 
                          fontWeight: FontWeight.w400 
                        ),
                     ],
                   ),
                   space3R,
                   Column(
                     children: [
                       CircleAvatar(
                                        radius: 33,
              backgroundImage: AssetImage("assets/icons/row1.png"),
                                      ),
                                       SizedBox(height: 8,),
                                        TitleText(
                           title: 'All Quiz',
                           color: kPrimaryColor,  
                          fontSize: 12, 
                          fontWeight: FontWeight.w400 
                        ),
                     ],
                   ),
                   space3R,
                   Column(
                     children: [
                       CircleAvatar(
                                        radius: 33,
              backgroundImage: AssetImage("assets/icons/row1.png"),
                                      ),
                                       SizedBox(height: 8,),
                                        TitleText(
                           title: 'All Quiz',
                           color: kPrimaryColor,  
                          fontSize: 12, 
                          fontWeight: FontWeight.w400 
                        ),
                     ],
                   ),
               
                ],
              ),
space5C,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   TitleText(
                           title: 'Recent Quiz',
                           color: kmaindarkColor,  
                          fontSize: 16, 
                          fontWeight: FontWeight.w500 
                        ),
                         TitleText(
                           title: 'See More',
                           color: Color(0xFF757784),  
                          fontSize: 12, 
                          fontWeight: FontWeight.w500 
                        ),
                ],
              ),
              space4C,
              Row(
                children: [
                  Container(
                    height: 162,
                    width: 139,
                     decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset("assets/images/recentquiz.png",
            height: 98,
            ),
            
                   Positioned(
                    bottom: -13,
                    left: 8,
                    child:  Align
                    (
                      child: Container(  
                              height: 25,  
                              width: 65,  
                                  decoration: BoxDecoration(  
                                    borderRadius: BorderRadius.circular(20),  
                                    color: Color(0xFFFDF0ED),  
                                  ),
                            
                                  child:   Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Color(0xFFFF8FA2),
                                      child:  Center(
                                child:    ImageIcon(
                      AssetImage("assets/icons/qsn.png"),
                      color: Colors.white,
                      size: 8,
                 ),
                  ),
                                    ),
                                     space1R,
                                      TitleText(
                         title: '15 Qs',
                         color: Colors.black,  
                        fontSize: 10, 
                        fontWeight: FontWeight.w500 
                      ),
                                    ],
                                  ),
                                     ),
                    ),  
                  ),
          
              ],
            ),
            space3C,
             TitleText(
                         title: 'Science Smarts: A\nBrain-Busting ..',
                         color: Colors.black,  
                        fontSize: 14, 
                        fontWeight: FontWeight.w600 
                      ),
          ],
        ),
                  ), 
                ],
              ),

              SizedBox(height: 52,),
              
            ],
           ),
         ),
       ),
    );
  }
}
