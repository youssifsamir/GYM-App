// ignore_for_file: use_key_in_widget_constructors

//packages
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:water_bottle/water_bottle.dart';

//widgets
import '/widgets/card.dart';
import '/widgets/semicard.dart';
import '/widgets/statusbar.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = './home.dart';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? countdownTimer;
  Duration myDuration = const Duration(hours: 3);
  GlobalKey plainBottleRef = GlobalKey<WaterBottleState>();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 60),

          //avatar, welcome, name
          Row(
            children: <Widget>[
              const SizedBox(width: 20),

              //avatar
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('./assets/images/avatar.jpeg'),
              ),

              const SizedBox(width: 12),

              //welcome, name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  //welcome
                  Text(
                    'WELCOME BACK,',
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: 'ios',
                      color: Colors.white54,
                    ),
                  ),

                  SizedBox(height: 4),

                  //name
                  Text(
                    'YOUSSIF SAMIR',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'ios',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 120),

              //notification bell
              IconButton(
                onPressed: () {},
                splashRadius: 0.1,
                icon: const Icon(
                  size: 28,
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          //status bar
          Container(
            height: 115,
            margin: const EdgeInsets.only(left: 10),
            child: StatusBar(),
          ),

          const SizedBox(height: 40),

          //text1
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Today's Workout",
              style: TextStyle(
                fontSize: 17,
                wordSpacing: 2,
                fontFamily: 'Rubik',
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),

          //card1
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CardWidget(),
          ),

          const SizedBox(height: 35),

          //text2, text3
          Row(
            children: <Widget>[
              const SizedBox(width: 25),

              //text2
              SizedBox(
                width: 149,
                child: Text(
                  "Next Meal  $hours : $minutes: $seconds",
                  style: const TextStyle(
                    fontSize: 13.5,
                    wordSpacing: 2,
                    fontFamily: 'Rubik',
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 107),

              // //text3
              const Text(
                "Daily Water Goal",
                style: TextStyle(
                  fontSize: 13,
                  wordSpacing: 2,
                  fontFamily: 'Rubik',
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          //card2, waterbottle
          Row(
            children: <Widget>[
              const SizedBox(width: 15),

              //card2
              SemiCardWidget(),
              const SizedBox(width: 10),

              //waterbottle
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: 95,
                    height: 150,
                    child: WaterBottle(
                      key: plainBottleRef,
                      waterColor: Colors.blue,
                      capColor: Colors.blueGrey,
                      bottleColor: Colors.lightBlue,
                    ),
                  ),
                  const Positioned(
                    top: 65,
                    left: 32.5,
                    child: Text(
                      '57%',
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'ios',
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 51.5),
        ],
      ),
    );
  }
}
