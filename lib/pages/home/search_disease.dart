import 'package:flutter/material.dart';
import 'package:plant_disease_detector/utils/constants.dart';
import 'package:plant_disease_detector/utils/widgets/appbar.dart';
import 'package:plant_disease_detector/utils/widgets/common_widget.dart';

class SearchDisease extends StatefulWidget {
  const SearchDisease({super.key});

  @override
  State<SearchDisease> createState() => _SearchDiseaseState();
}

class _SearchDiseaseState extends State<SearchDisease> {
  TextEditingController _searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return 
     Scaffold(
       backgroundColor:  Color(0xFFFFF2EE),
      body: Column(
        children: [
          AppBarWithSearch(
            title: 'Disease Search',
          ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: CustomTextField(
                  controller: _searchcontroller,
                  hintText: 'Search Disease',
                  isRequired: true,
                   prefixIcon: Align(
              widthFactor:1,
              heightFactor:1,
             child: GestureDetector(
              onTap: (){
              },
               child:  ImageIcon(
                AssetImage("assets/icons/search.png"),
                color: Color(0xFF757784),
                size: 17,
             ),
             ),
          ),
                ),
           ),

           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Column(
              children: [
                MainContainer(
                  child: Row(
                    children: [
                        Image.asset("assets/images/onscreen1.png",
            height: 86,
            width: 112,
            ),
            
            space2R,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 TitleText(
                         title: 'Apple Disease-\nBusting ..',
                         color: Colors.black,  
                        fontSize: 14, 
                        fontWeight: FontWeight.w600 
                      ),
                      space2C,
                Container(  
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
                      AssetImage("assets/icons/onscreen1.png"),
                      color: Colors.white,
                      size: 8,
                 ),
                  ),
                                    ),
                                     space1R,
                                      TitleText(
                         title: '4 facts',
                         color: Colors.black,  
                        fontSize: 10, 
                        fontWeight: FontWeight.w500 
                      ),
                                    ],
                                  ),
                                     ),
              ],
            )
                    ],
                  ),
                )
              ],
             ),
           ),
        ],
      ),
    );
 
  }
}