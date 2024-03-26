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

  Widget _sizedBoxBtnSignUp() {
    return SizedBox(
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
    );
  }

  SafeArea _safeArea() {
    return SafeArea(
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
              color: const Color.fromRGBO(211, 211, 211, .6),
              border: Border.all(
                color: Colors.black54,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Container(
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
    );
  }

  Row _row() {
    return Row(
      children: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 30,
          ),
        ),
        Spacer(),
        // Container(
        //   child: SvgPicture.asset(
        //     'assets/images/blob1.svg',
        //     height: 256.0,
        //     width: 256.0,
        //   ),
        // ),
      ],
    );
  }

  Widget _altSafeArea() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 30,
            ),
            child: Text(
              'Create Account',
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
              'Sign Up for ORCHARD GUARD',
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
          ValueListenableBuilder<bool>(
            valueListenable: isObsecured,
            builder: (context, value, child) {
              return CustomTextFieldAlt(
                controller: _passController,
                isObsecured: value,
                labelText: 'Password',
                isRequired: true,
                prefixIcon: const Icon(Icons.lock_outline),
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
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: Text(
                _errorText!,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          const SizedBox(
            height: 48,
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
            child: _sizedBoxBtnSignUp(),
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

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 120,
      automaticallyImplyLeading: false, // Don't show the leading button
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 30,
            ),
          ),
          Spacer(),
          // SvgPicture.asset(
          //   'assets/images/blob1.svg',
          //   height: 256.0,
          //   width: 256.0,
          //   allowDrawingOutsideViewBox: true,
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return false
        ? _safeArea()
        : Scaffold(
            // appBar: _appBar(),
            body: SafeArea(child: _altSafeArea()),
            bottomNavigationBar: BottomAppBar(
              elevation: 0,
              color: Colors.transparent,
              child: GestureDetector(
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
                    text: "Already have an account? ",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Login here',
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
