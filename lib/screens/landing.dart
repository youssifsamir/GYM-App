// ignore_for_file: use_key_in_widget_constructors

//packages
import 'package:flutter/material.dart';

//screens
import '/screens/tabs.dart';
import '/screens/signup.dart';

//widgets
import '/widgets/landingview.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          //slider
          LandingView(),
          //logo
          Positioned(
            right: 20,
            top: 75,
            child: Image.asset(
              './assets/images/logo.png',
              width: 50,
            ),
          ),
          //buttons
          Positioned(
            bottom: 65,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //signup
                GestureDetector(
                  onTap: () => Navigator.popAndPushNamed(
                      context, SignupScreen.routeName),
                  child: Container(
                    height: 50,
                    width: 170,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(131, 255, 153, 0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontFamily: 'ios',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                //login
                GestureDetector(
                  onTap: () =>
                      Navigator.popAndPushNamed(context, TabScreen.routeName),
                  child: Container(
                    height: 50,
                    width: 170,
                    decoration: const BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'ios',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
