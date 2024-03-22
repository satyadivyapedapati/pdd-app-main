import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_disease_detector/pages/home/end-user/landing_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plant_disease_detector/pages/home/image_picker.dart';
import 'package:plant_disease_detector/pages/login/create_account.dart';
import 'package:plant_disease_detector/pages/login/forget_pass.dart';
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: ElevatedButton(
                onPressed: () async {
                  final googleAcc = await GoogleSignIn().signIn();
                  final googleAuth = await googleAcc?.authentication;

                  final cred = GoogleAuthProvider.credential(
                    accessToken: googleAuth?.accessToken,
                    idToken: googleAuth?.idToken,
                  );

                 final userCred =
                      await FirebaseAuth.instance.signInWithCredential(cred);

                  if (userCred.user != null) {
                    _showSuccessNotification('Google sign in successful');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LandingScreen()),
                    );
                  } else {
                    // If email is not verified, show an error message
                    _showError(
                        'There was an error while signing in with google.');
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  'Continue With Google',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateAccount(),
                  ),
                );
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(
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
          MaterialPageRoute(builder: (context) => const ImagePickerScreen()),
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

  void _showSuccessNotification(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.greenAccent,
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }

  Scaffold _oldScaffold() {
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

  Widget _sizedBoxBtnSignIn() {
    return SizedBox(
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
    );
  }

  Widget _sizedBoxBtnGoogle() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 48,
      child: ElevatedButton(
          onPressed: () async {
            final googleAcc = await GoogleSignIn().signIn();
            final googleAuth = await googleAcc?.authentication;

            final cred = GoogleAuthProvider.credential(
              accessToken: googleAuth?.accessToken,
              idToken: googleAuth?.idToken,
            );

            final userCred =
                await FirebaseAuth.instance.signInWithCredential(cred);

            if (userCred.user != null) {
              _showSuccessNotification('Google sign in successful');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ImagePickerScreen(),
                ),
              );
            } else {
              // If email is not verified, show an error message
              _showError('There was an error while signing in with google.');
            }
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.grey.shade100,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset('assets/images/google-logo.png'),
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                'Continue With Google',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )),
    );
  }

  Widget _altSafeArea() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 48,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 30,
            ),
            child: Text(
              'Login',
              textAlign: TextAlign.start,
              style: GoogleFonts.gabarito(
                fontWeight: FontWeight.w800,
                fontSize: 40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 30,
            ),
            child: Text(
              'Welcome to ORCHARD GUARD',
              textAlign: TextAlign.start,
              style: GoogleFonts.gabarito(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          CustomTextFieldAlt(
            controller: _emailController,
            labelText: 'Email',
            hintText: 'Enter your email',
            isRequired: true,
            prefixIcon: const Icon(Icons.email_outlined),
          ),
          CustomTextFieldAlt(
            controller: _passwordController,
            isObsecured: !passwordVisible,
            labelText: 'Password',
            isRequired: true,
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgetScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password',
                    textAlign: TextAlign.end,
                    style: GoogleFonts.gabarito(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.indigo.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: _sizedBoxBtnSignIn(),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Row(
              children: <Widget>[
                Expanded(child: Divider()),
                SizedBox(
                  width: 8,
                ),
                Text("OR"),
                SizedBox(
                  width: 8,
                ),
                Expanded(child: Divider()),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: _sizedBoxBtnGoogle(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return false
        ? _oldScaffold()
        : Scaffold(
            body: SafeArea(child: _altSafeArea()),
            bottomNavigationBar: BottomAppBar(
              elevation: 0,
              color: Colors.transparent,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateAccount(),
                    ),
                  );
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Signup here',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
