// ignore_for_file: use_key_in_widget_constructors

//packages
import 'package:flutter/material.dart';

class SemiCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: SizedBox(
        width: 260,
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              './assets/images/bf2.jpg',
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
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            //text
            Positioned(
              left: 15,
              bottom: 17,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Breakfast',
                    style: TextStyle(
                      color: Color.fromARGB(116, 255, 255, 255),
                      fontSize: 14,
                      fontFamily: 'iosReg',
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Egg & Toast',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'iosReg',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
