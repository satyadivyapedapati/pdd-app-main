import 'package:flutter/material.dart';
import 'package:plant_disease_detector/pages/login/login_form.dart';
import 'package:plant_disease_detector/utils/widgets/appbar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Image.asset('images/onscreen.png').color,
      body: const SafeArea(
        child: LoginForm(),
      ),
    );
  }
}
