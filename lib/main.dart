import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plant_disease_detector/controllers/bindings/auth_binding.dart';
import 'package:plant_disease_detector/pages/login/login_screen.dart';
import 'package:plant_disease_detector/pages/login/search_screen.dart';
import 'package:plant_disease_detector/pages/login/search_results.dart';
import 'package:plant_disease_detector/pages/splash_screen.dart';
import 'pages/app_intro_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AddaBari',
      // theme: appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: AuthBinding(),
      getPages: [
         GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
         GetPage(
          name: AppIntroScreen.routeName,
          page: () => const AppIntroScreen(),
        ),
        
        GetPage(
          name: LoginScreen.routeName,
          page: () => const LoginScreen(),
        ),
        GetPage(
           name: SearchScreen.routeName,
           page: () => const SearchScreen(),           
        ), 
        // GetPage(
        //   name: SearchResultScreen.routeName,
        //   page: () => SearchResultScreen(searchResults: []), 
        // ),
       
        
      ],
    );
  }
}
