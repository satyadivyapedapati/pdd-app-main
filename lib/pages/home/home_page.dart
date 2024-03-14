import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_disease_detector/pages/dashboard/ui/dashboard.dart';


import '../../controllers/home_controller.dart';
import '../../services/enums.dart';
import '../../utils/constants.dart';


class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<HomeController>(HomeController());
    return WillPopScope(
      onWillPop: () async {
        if (HomeController.to.isMenuOpen.value) {
          HomeController.to.changeMenuOpenActivity();
          return false;
        }
        if (HomeController.to.menuItemEnum.value != MenuItemEnum.dashboard) {
          HomeController.to.changeMenuItemActivity(MenuItemEnum.dashboard);
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF9FCFF),
        body: Stack(
          children: [
            Obx(() {
              if (HomeController.to.getMenuItemEnum == MenuItemEnum.dashboard) {
               return const DashboardScreen();
              } else if (HomeController.to.getMenuItemEnum ==
                  MenuItemEnum.search) {
                // return const OrderScreen();
              } else if (HomeController.to.getMenuItemEnum ==
                  MenuItemEnum.statistics) {
                // return const WalletScreen();
              } else if (HomeController.to.getMenuItemEnum ==
                  MenuItemEnum.profile) {
                // return const ProfileScreen();
              }
              return const Center(
                child: Text('404'),
              );
            }
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.white,
                 borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
                ),
                child: Row(
                  children: [
                    Obx(() {
                      return MenuItem(
                        menuName: 'Dashboard',
                        isActive: HomeController.to.getMenuItemEnum ==
                            MenuItemEnum.dashboard,
                        onTap: () {
                          if (HomeController.to.getMenuItemEnum ==
                              MenuItemEnum.dashboard) {
                            // print('Dashboard');
                          }
                          HomeController.to
                              .changeMenuItemActivity(MenuItemEnum.dashboard);
                        },
                      );
                    }),
                    Obx(() {
                      return MenuItem(
                        isActive: HomeController.to.getMenuItemEnum ==
                            MenuItemEnum.search,
                        menuName: 'Search',
                        onTap: () {
                          if (HomeController.to.getMenuItemEnum ==
                              MenuItemEnum.search) {
                            print('Orders');
                          }
                          HomeController.to
                              .changeMenuItemActivity(MenuItemEnum.search);
                        },
                      );
                    }),
                    Obx(() {
                      return MenuItem(
                        isActive: HomeController.to.getMenuItemEnum ==
                            MenuItemEnum.statistics,
                        menuName: 'statistics',
                        onTap: () {
                          // if (HomeController.to.getMenuItemEnum ==
                          //     MenuItemEnum.statistics) {
                          //   print('Wallet');
                          // }
                          // HomeController.to
                          //     .changeMenuItemActivity(MenuItemEnum.statistics);
                        },
                      );
                    }),
                    Obx(() {
                      return MenuItem(
                        isActive: HomeController.to.getMenuItemEnum ==
                            MenuItemEnum.profile,
                        menuName: 'Profile',
                        onTap: () {
                          if (HomeController.to.getMenuItemEnum ==
                              MenuItemEnum.profile) {
                            print('Profile');
                          }
                          HomeController.to
                              .changeMenuItemActivity(MenuItemEnum.profile);
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
            
            // const SideMenuBar(),
          ],
        ),
      ),
    );
  }
}

// class SideMenuBar extends StatelessWidget {
//   const SideMenuBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Obx(
//           () => AnimatedPositioned(
//             top: 0,
//             // left: HomeController.to.isMenuOpen.value
//             //     ? Get.width * .8
//             //     : -Get.width,
//             right: HomeController.to.isMenuOpen.value ? 0 : -Get.width,
//             duration: const Duration(milliseconds: 50),
//             child: GestureDetector(
//               onTap: () {
//                 HomeController.to.changeMenuOpenActivity();
//               },
//               child: Container(
//                 height: Get.height,
//                 width: Get.width,
//                 decoration: BoxDecoration(
//                     color: const Color(0xff77DC86).withOpacity(.74)
//                     // gradient: LinearGradient(
//                     //   // colors: [
//                     //   //   const Color(0xff77DC86).withOpacity(.74),
//                     //   //   Colors.transparent,
//                     //   // ],
//                     //   colors: [
//                     //     Colors.transparent,
//                     //     const Color(0xff77DC86).withOpacity(.74),
//                     //   ],
//                     // ),
//                     ),
//               ),
//             ),
//           ),
//         ),
//         Obx(
//           () => AnimatedPositioned(
//             top: 0,
//             left: HomeController.to.isMenuOpen.value ? 0 : -Get.width,
//             duration: const Duration(milliseconds: 200),
//             child: Stack(
//               children: [
//                 Container(
//                   height: Get.height - 80,
//                   width: Get.width * .85,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.horizontal(
//                       right: Radius.circular(2),
//                     ),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: MediaQuery.of(context).padding.top + 20,
//                       ),
//                       Column(
//                         children: [
//                           Material(
//                             borderRadius: BorderRadius.circular(100),
//                             color: Colors.white,
//                             elevation: 4,
//                             child: Padding(
//                               padding: const EdgeInsets.all(2.0),
//                               child: SizedBox(
//                                 height: 100,
//                                 width: 100,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(100),
//                                   child:
//                                       Image.asset('assets/images/product.png'),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const TitleText(
//                             title: 'Adam Smith',
//                             fontSize: 24,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           PrimaryButton(
//                             label: 'Try Sheba Plus',
//                             primary: const Color(0xff5FC502),
//                             height: 25,
//                             borderRadiusAll: 5,
//                             contentPadding: 0,
//                             marginVertical: 8,
//                             marginHorizontal: 0,
//                             fontSize: 12,
//                             width: 120,
//                             onPressed: () {},
//                           ),
//                           HorizontalDivider(
//                             color: kPrimaryColor,
//                             thickness: .4,
//                             horizontalMargin: 16,
//                           ),
//                         ],
//                       ),
//                       Expanded(
//                         child: SingleChildScrollView(
//                           child: Column(
//                             children: [
//                               ExpandableItem(
//                                 label: 'Customer Services',
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SideSubMenuItem(
//                                       label: 'Buy Health Product',
//                                       onTap: () {
//                                         // if (Get.currentRoute !=
//                                         //     HealthcareScreen.routeName) {
//                                         //   Get.toNamed(
//                                         //       HealthcareScreen.routeName);
//                                         // }
//                                         HomeController.to
//                                             .changeMenuOpenActivity();
//                                       },
//                                     ),
//                                     SideSubMenuItem(
//                                       label: 'Buy Medicine',
//                                       onTap: () {
//                                         // if (Get.currentRoute !=
//                                         //     MedicineScreen.routeName) {
//                                         //   Get.toNamed(MedicineScreen.routeName);
//                                         // }
//                                         HomeController.to
//                                             .changeMenuOpenActivity();
//                                       },
//                                     ),
//                                     SideSubMenuItem(
//                                       label: 'Book a Lab Test',
//                                       onTap: () {
//                                         // if (Get.currentRoute !=
//                                         //     LabScreen.routeName) {
//                                         //   Get.toNamed(LabScreen.routeName);
//                                         // }
//                                         HomeController.to
//                                             .changeMenuOpenActivity();
//                                       },
//                                     ),
//                                     SideSubMenuItem(
//                                       label: 'Book a Doctor',
//                                       onTap: () {
//                                         // if (Get.currentRoute !=
//                                         //     DoctorScreen.routeName) {
//                                         //   Get.toNamed(DoctorScreen.routeName);
//                                         // }
//                                         HomeController.to
//                                             .changeMenuOpenActivity();
//                                       },
//                                     ),
//                                     SideSubMenuItem(
//                                       label: 'Offers and Promotions',
//                                       onTap: () {
//                                         HomeController.to
//                                             .changeMenuOpenActivity();
//                                       },
//                                     ),
//                                     SideSubMenuItem(
//                                       label: 'Refer & Earn',
//                                       onTap: () {
//                                         HomeController.to
//                                             .changeMenuOpenActivity();
//                                       },
//                                     ),
//                                     SideSubMenuItem(
//                                       label: 'Health Article',
//                                       onTap: () {
//                                         HomeController.to
//                                             .changeMenuOpenActivity();
//                                       },
//                                     ),
//                                     SideSubMenuItem(
//                                       label: 'Book',
//                                       onTap: () {
//                                         HomeController.to
//                                             .changeMenuOpenActivity();
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               ExpandableItem(
//                                 label: 'For Doctor',
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SideSubMenuItem(
//                                       label: 'Create Your Sheba Profile',
//                                       onTap: () {},
//                                     ),
//                                     SideSubMenuItem(
//                                       label: 'Sign In',
//                                       onTap: () {},
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               ExpandableItem(
//                                 label: 'For Lab',
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SideSubMenuItem(
//                                       label: 'Create Your Sheba Profile',
//                                       onTap: () {},
//                                     ),
//                                     SideSubMenuItem(
//                                       label: 'Sign In',
//                                       onTap: () {},
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               ExpandableItem(
//                                 label: 'Help',
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SideSubMenuItem(
//                                       label: 'FAQ',
//                                       onTap: () {},
//                                     ),
//                                     SideSubMenuItem(
//                                       label: 'Return Policy',
//                                       onTap: () {},
//                                     ),
//                                     SideSubMenuItem(
//                                       label: 'Privacy Policy',
//                                       onTap: () {},
//                                     ),
//                                     SideSubMenuItem(
//                                       label: 'Terms & Conditions',
//                                       onTap: () {},
//                                     ),
//                                     SideSubMenuItem(
//                                       label: 'Corporate Witness',
//                                       onTap: () {},
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               ExpandableItem(
//                                 label: 'Partners with us',
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SideSubMenuItem(
//                                       label: 'Sell with Us',
//                                       onTap: () {},
//                                     ),
//                                     SideSubMenuItem(
//                                       label: 'Franchise',
//                                       onTap: () {},
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               ExpandableItem(
//                                 label: 'Become A Affiliator',
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SideSubMenuItem(
//                                       label: 'Create Your Affiliate Profile',
//                                       onTap: () {},
//                                     ),
//                                     SideSubMenuItem(
//                                       label: 'Sign In',
//                                       onTap: () {},
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.center,
//                         child: PrimaryButton(
//                           label: 'Log Out',
//                           primary: Colors.white,
//                           labelColor: kPrimaryColor,
//                           borderColor: kPrimaryColor,
//                           height: 36,
//                           borderRadiusAll: 6,
//                           contentPadding: 0,
//                           marginVertical: 20,
//                           marginHorizontal: 0,
//                           fontSize: 14,
//                           width: 160,
//                           onPressed: () {},
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   top: MediaQuery.of(context).padding.top,
//                   left: 0,
//                   child: IconButton(
//                     onPressed: () {
//                       HomeController.to.changeMenuOpenActivity();
//                     },
//                     padding: EdgeInsets.zero,
//                     icon: const Icon(Icons.close),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class ExpandableItem extends StatefulWidget {
  const ExpandableItem({
    Key? key,
    required this.label,
    required this.child,
    this.isOdd = false,
    this.labelColor,
    this.labelFontWeight,
    this.childHorizontalPadding,
  }) : super(key: key);
  final String label;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  final double? childHorizontalPadding;
  final Widget child;
  final bool? isOdd;

  @override
  _ExpandableItemState createState() => _ExpandableItemState();
}

class _ExpandableItemState extends State<ExpandableItem> {
  bool _isExpandable = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpandable = !_isExpandable;
              });
            },
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      color: _isExpandable
                          ? widget.labelColor ?? kPrimaryColor
                          : widget.labelColor ?? kTextColor,
                      fontWeight: _isExpandable
                          ? widget.labelFontWeight ?? FontWeight.w600
                          : widget.labelFontWeight ?? FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                _isExpandable
                    ? Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: kPrimaryColor,
                      )
                    : Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: kTextColor,
                      ),
              ],
            ),
          ),
          space2C,
          Visibility(
            visible: _isExpandable,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: widget.childHorizontalPadding ?? 8.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: widget.child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SideSubMenuItem extends StatelessWidget {
  const SideSubMenuItem({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Text(
          label,
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 12,
            height: 1.5,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    this.isActive = false,
    required this.menuName,
    required this.onTap,
  }) : super(key: key);
  final bool isActive;
  final String menuName;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: 30,
              height: 4,
              decoration: BoxDecoration(
                color: isActive ? kPrimaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const Spacer(),
            Image.asset(
              'assets/icons/${isActive ? '${menuName.toLowerCase()}-active' : menuName.toLowerCase()}.png',
              width: 20,
            ),
            space1C,
            // Text(
            //   menuName,
            //   style: TextStyle(
            //     color: isActive ? kPrimaryColor : kTextColorLite,
            //     fontSize: 11,
            //     fontWeight: FontWeight.w500,
            //   ),
            // ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
