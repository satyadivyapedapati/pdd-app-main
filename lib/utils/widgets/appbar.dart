import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import 'common_widget.dart';

class AppBarWithSearch extends StatelessWidget {
  const AppBarWithSearch({
    this.title,
    this.isSearchShow = true,
    this.isBarShow = true,
    this.hasStyle = true,
    this.hasBackArrow = true,
    this.onCartTapped,
    Key? key,
  }) : super(key: key);
  final String? title;
  final bool isSearchShow;
  final bool isBarShow;
  final bool hasStyle;
  final bool hasBackArrow;
  final Function()? onCartTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Color(0xEEF0FE),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // hasBackArrow
                    //     ? Get.back()
                    //     : HomeController.to.changeMenuOpenActivity();
               Get.back();
                  },
                  // child: hasBackArrow
                  //     ? const Icon(
                  //         Icons.arrow_back_rounded,
                  //         color: Colors.black,
                  //       )
                  //     : Image.asset(
                  //         'assets/icons/menu.png',
                  //         height: 20,
                  //       ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: 
                  Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                        )
                  ),
                ),

               title == null
                    ? SizedBox(width: 15,)
                    : SizedBox(
                        height: 20,
                        child: Center(
                          child: TitleText(
                            title: title!,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),

          SizedBox(height: 20,)
             
              ],
            ),
          ),
          space2C,
          space2C,

        ],
      ),
    );
  }
}

