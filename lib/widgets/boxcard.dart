// ignore_for_file: use_key_in_widget_constructors

//packages
import 'package:flutter/material.dart';

class BoxCardWidget extends StatelessWidget {
  final String img, txt, subtxt;

  const BoxCardWidget({
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
                  Colors.black54,
                  Colors.black45,
                  Colors.transparent,
                ],
              ),
            ),
          ),

          //text1, text2, icon
          Positioned(
            left: 12,
            bottom: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //text1, icon
                Row(
                  children: <Widget>[
                    //text1
                    Text(
                      txt,
                      style: const TextStyle(
                        color: Color.fromARGB(116, 255, 255, 255),
                        fontSize: 14,
                        fontFamily: 'iosReg',
                      ),
                    ),
                    const SizedBox(width: 3),

                    //icon
                    const Icon(
                      size: 15,
                      Icons.timer_outlined,
                      color: Color.fromARGB(116, 255, 255, 255),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                //text2
                Text(
                  subtxt,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontFamily: 'iosReg',
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
