import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_disease_detector/controllers/home_controller.dart';
import 'package:plant_disease_detector/pages/home/home_screen.dart';
import 'package:plant_disease_detector/services/enums.dart';
import 'package:plant_disease_detector/pages/home/home_page.dart' as HP;

class ParentPageWithNav extends StatelessWidget {
  const ParentPageWithNav({required this.child, this.backgroundColor, Key? key})
      : super(key: key);
  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    Get.put<HomeController>(HomeController());
    return WillPopScope(
      onWillPop: () async {
        print('Working!!!');
        if (HomeController.to.isMenuOpen.value) {
          HomeController.to.changeMenuOpenActivity();
          return false;
        }
        return true;
      },
      child: Scaffold(
        
        backgroundColor: backgroundColor ?? const Color(0xffF9FCFF),
        body: Stack(
          children: [
            child,
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                 borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
                ),
                child: Row(
                  children: [
                    HP.MenuItem(
                      menuName: 'Dashboard',
                      isActive: false,
                      onTap: () {
                        HomeController.to
                            .changeMenuItemActivity(MenuItemEnum.dashboard);
                        if (HomeController.to.getMenuItemEnum ==
                            MenuItemEnum.dashboard) {
                          Get.back();
                        }
                        if (Get.currentRoute != HomeScreen.routeName) {
                          Get.offAllNamed(HomeScreen.routeName);
                        }
                      },
                    ),
                    HP.MenuItem(
                      isActive: false,
                      menuName: 'Orders',
                      onTap: () {
                        HomeController.to
                            .changeMenuItemActivity(MenuItemEnum.search);
                        if (HomeController.to.getMenuItemEnum ==
                            MenuItemEnum.search) {
                          Get.back();
                        }
                        if (Get.currentRoute != HomeScreen.routeName) {
                          Get.offAllNamed(HomeScreen.routeName);
                        }
                      },
                    ),
                    HP.MenuItem(
                      isActive: false,
                      menuName: 'Wallet',
                      onTap: () {
                        HomeController.to
                            .changeMenuItemActivity(MenuItemEnum.statistics);
                        if (HomeController.to.getMenuItemEnum ==
                            MenuItemEnum.statistics) {
                          Get.back();
                        }
                        if (Get.currentRoute != HomeScreen.routeName) {
                          Get.offAllNamed(HomeScreen.routeName);
                        }
                      },
                    ),
                    HP.MenuItem(
                      isActive: false,
                      menuName: 'Profile',
                      onTap: () {
                        HomeController.to
                            .changeMenuItemActivity(MenuItemEnum.profile);
                        if (HomeController.to.getMenuItemEnum ==
                            MenuItemEnum.profile) {
                          Get.back();
                        }
                        if (Get.currentRoute != HomeScreen.routeName) {
                          Get.offAllNamed(HomeScreen.routeName);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            // const HP.SideMenuBar()
          ],
        ),
      ),
    );
  }
}
