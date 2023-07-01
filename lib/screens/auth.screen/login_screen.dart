import 'package:connector/main.dart';
import 'package:flutter/material.dart';

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
              onPressed: () {},
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
