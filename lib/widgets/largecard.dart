// ignore_for_file: use_key_in_widget_constructors

//packages
import 'package:flutter/material.dart';

class LargeCard extends StatelessWidget {
  final String img, txt, subtxt;

  const LargeCard({
    required this.img,
    required this.txt,
    required this.subtxt,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          //image
          Image.asset(
            img,
            fit: BoxFit.cover,
          ),

          //image shadow
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black87,
                  Colors.black87,
                  Colors.black87,
                  Colors.black54,
                  Colors.black45,
                  Colors.transparent,
                ],
              ),
            ),
          ),

          //text
          Positioned(
            left: 20,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //text1
                Text(
                  subtxt,
                  style: const TextStyle(
                    color: Color.fromARGB(116, 255, 255, 255),
                    fontSize: 13,
                    fontFamily: 'iosReg',
                  ),
                ),
                const SizedBox(height: 2),
                //text2
                Text(
                  txt,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontFamily: 'iosReg',
                  ),
                ),
              ],
            ),
          ),

          //playButton
          Positioned(
            right: 30,
            bottom: 27,
            child: IconButton(
              onPressed: () {},
              color: Colors.white,
              icon: const Icon(
                size: 60,
                Icons.play_circle_fill_rounded,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
