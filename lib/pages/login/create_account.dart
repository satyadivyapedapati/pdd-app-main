import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
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

  Future<void> createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/auth.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              margin:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
              decoration: BoxDecoration(
                // pythocolor: const Color.fromRGBO(211, 211, 211, .6),
                border: Border.all(
                  color: Colors.black54,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Sign Up for Apple Disease Detection',
                        style: GoogleFonts.outfit(
                          color: kmaindarkColor,
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
                            icon: Icon(!value ? Icons.visibility : Icons.visibility_off),
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
                          backgroundColor: Colors.blue.shade800,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
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
                              color: Colors.black),
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
      ),
    );
  }
}
