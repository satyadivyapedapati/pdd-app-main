import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_disease_detector/pages/home/end-user/landing_page.dart';
import 'package:plant_disease_detector/pages/login/create_account.dart';
import 'package:plant_disease_detector/utils/widgets/common_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = false; // Changed to false initially
  }

 Widget _form() {
  return Form(
    key: _formKey,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Your other form fields
          CustomTextField(
            controller: _emailController,
            labelText: 'Email',
            hintText: 'hello@sample.com',
            isRequired: true,
            prefixIcon: Align(
              widthFactor: 1,
              heightFactor: 1,
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.email,
                ),
              ),
            ),
          ),
          CustomTextField(
            controller: _passwordController,
            labelText: 'Password',
            isRequired: true,
            isObsecured: !passwordVisible, // Pass the visibility status
            suffixIcon: IconButton(
              icon: Icon(
                passwordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible; // Toggle visibility
                });
              },
            ),
          ),
          const SizedBox(height: 8),
          // Your other buttons
          SizedBox(
            width: Get.width,
            height: 48,
            child: ElevatedButton(
              onPressed: _signInWithEmailAndPassword,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.blue.shade800,
              ),
              child: const TitleText(
                title: "Login",
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Your other widgets
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateAccount(),
                ),
              );
            },
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black45,
                ),
                children: [
                  TextSpan(
                    text: 'Sign up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


  Future<void> _signInWithEmailAndPassword() async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
    
    if (userCredential.user != null && userCredential.user!.emailVerified) {
      // If login is successful and email is verified, navigate to the landing page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LandingScreen()),
      );
    } else {
      // If email is not verified, show an error message
      _showError('Please verify your email before logging in.');
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      _showError('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      _showError('Wrong password provided for that user.');
    } else {
      _showError('Error signing in, please try again later.');
    }
  } catch (e) {
    _showError('Error signing in, please try again later.');
  }
}


  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/auth.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            height: Get.height - 100,
            margin:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(211, 211, 211, .6),
              border: Border.all(
                color: Colors.black54,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: _form(),
            
          ),
        ),
      ),
    );
  }
}
