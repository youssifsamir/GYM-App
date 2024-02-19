// ignore_for_file: use_key_in_widget_constructors

//packages
import 'package:flutter/material.dart';

class MediumCardWidget extends StatelessWidget {
  final String img, name, duration, calories, protien, carbs, fat, sugar;

  const MediumCardWidget({
    required this.img,
    required this.name,
    required this.duration,
    required this.protien,
    required this.calories,
    required this.carbs,
    required this.sugar,
    required this.fat,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      child: Stack(
        children: <Widget>[
          //backbox
          Opacity(
            opacity: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.black87,
                    Colors.black45,
                    Colors.black45,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          //image
          SizedBox(
            width: 300,
            child: Image.asset(img, fit: BoxFit.cover),
          ),

          //text1, text2, icon
          Positioned(
            left: 15,
            bottom: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //text1
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 19,
                    fontFamily: 'iosReg',
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),

                //text12 icon
                Row(
                  children: <Widget>[
                    //text1
                    Text(
                      duration,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'iosReg',
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 3),

                    //icon1
                    const Icon(
                      size: 15,
                      Icons.timer_outlined,
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 68),
                    //icon
                    const Icon(
                      size: 25,
                      color: Colors.white,
                      Icons.keyboard_double_arrow_right,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
