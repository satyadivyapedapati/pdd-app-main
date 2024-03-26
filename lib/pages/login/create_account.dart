import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plant_disease_detector/pages/home/end-user/landing_page.dart';
import 'package:plant_disease_detector/pages/home/image_picker.dart';
import 'package:plant_disease_detector/pages/login/login_screen.dart';
import 'package:plant_disease_detector/utils/constants.dart';
import 'package:plant_disease_detector/utils/widgets/common_widget.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  ValueNotifier<bool> isObsecured = ValueNotifier<bool>(true);
  String? _errorText;

  void _showErrorNotification(String message) {
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

  Future<void> createUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim(),
      );
      await userCredential.user!.sendEmailVerification();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'weak-password') {
          _errorText = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          _errorText = 'The account already exists for that email.';
        } else {
          _errorText = 'An error occurred, please try again later.';
        }
      });
      _showErrorNotification(_errorText!);
    } catch (e) {
      setState(() {
        _errorText = 'An error occurred, please try again later.';
      });
      _showErrorNotification(_errorText!);
    }
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
          _showErrorNotification(
              'There was an error while signing in with google.');
        }
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: const Color.fromARGB(255, 226, 100, 123), // Custom background color
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              'Continue With Google',
              style: TextStyle(
                color: Colors.white, // White font color
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


  Widget _sizedBoxBtnSignUp() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 48,
      child: ElevatedButton(
        onPressed: createUser,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
           backgroundColor: const Color.fromARGB(255, 226, 100, 123),
        ),
        child: const Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _authBackground() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/1.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
    );
  }

  SafeArea _safeArea() {
    return SafeArea(
      child: Stack(
        children: [
          _authBackground(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5), // White background with opacity
                  border: Border.all(
                    color: Colors.black54,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                               child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Sign Up for Apple Disease Detection',
                          style: GoogleFonts.outfit(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      CustomTextField(
                        controller: _emailController,
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        isRequired: true,
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: isObsecured,
                        builder: (context, value, child) {
                          return CustomTextField(
                            controller: _passController,
                            isObsecured: value,
                            labelText: 'Password',
                            isRequired: true,
                            suffixIcon: IconButton(
                              icon: Icon(
                                  !value ? Icons.visibility : Icons.visibility_off),
                              onPressed: () {
                                isObsecured.value = !isObsecured.value;
                              },
                            ),
                          );
                        },
                      ),
                      if (_errorText != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            _errorText!,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: createUser,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: const Color.fromARGB(255, 226, 100, 123),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _sizedBoxBtnGoogle(),
                      const SizedBox(height: 32),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Do you have already account? ",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color.fromARGB(255, 62, 114, 199)),
                            children: [
                              TextSpan(
                                text: 'Login here',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
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
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _safeArea(),
      // bottomNavigationBar: BottomAppBar(
      //   elevation: 0,
      //   color: Colors.transparent,
      //   child: GestureDetector(
      //     onTap: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => const LoginScreen(),
      //         ),
      //       );
      //     },
      //     child: RichText(
      //       textAlign: TextAlign.center,
      //       text: TextSpan(
      //         text: "Already have an account? ",
      //         style: const TextStyle(
      //             fontWeight: FontWeight.w500,
      //             fontSize: 18,
      //             color: Colors.black),
      //         children: [
      //           TextSpan(
      //             text: 'Login here',
      //             style: TextStyle(
      //               fontSize: 18,
      //               fontWeight: FontWeight.bold,
      //               color: Theme.of(context).primaryColor,
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

