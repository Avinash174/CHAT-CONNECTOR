import 'dart:developer';

import 'package:connector/apis/apis.dart';
import 'package:connector/helper/dialog.dart';
import 'package:connector/main.dart';
import 'package:connector/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginSCreen extends StatefulWidget {
  const LoginSCreen({super.key});

  @override
  State<LoginSCreen> createState() => _LoginSCreenState();
}

class _LoginSCreenState extends State<LoginSCreen> {
  bool _isAnimate = false;

  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isAnimate = true;
      });
    });
  }

  _handleGoogleClick() {
    Dialogs.showProgressBar(context);
    _signInWithGoogle().then((user) {
      Navigator.pop(context);
      if (user != null) {
        log('\nUser:${user.user}');
        log('\nUserAdditionalnfo:${user.additionalUserInfo}');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      }
    });
  }

  _signOut() async {
    await APIs.auth.signOut();
    await GoogleSignIn().signOut();
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      log('\n_signInWithGoogle:$e');
      Dialogs.showSnackBar(
          context, 'Something Went Wrong(Please,Check Internet Connection!)');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome To Chat Connect'),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            top: mq.height * .15,
            width: mq.width * .5,
            right: _isAnimate ? mq.width * .25 : -mq.width * .5,
            duration: const Duration(seconds: 1),
            child: Image.asset(
              'assets/images/appicon.png',
            ),
          ),
          Positioned(
            bottom: mq.height * .15,
            left: mq.width * .05,
            width: mq.width * .9,
            height: mq.height * .06,
            child: ElevatedButton.icon(
              onPressed: () {
                _handleGoogleClick();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 223, 255, 187),
                  shape: const StadiumBorder()),
              icon: Image.asset(
                'assets/images/google.png',
                height: mq.height * .03,
              ),
              label: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(text: 'Sing In With '),
                    TextSpan(
                      text: 'Google',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
