// ignore_for_file: use_key_in_widget_constructors

//packages
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FlipCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: FlipCard(
        fill: Fill.fillBack,
        front: Stack(
          children: <Widget>[
            //card
            Shimmer.fromColors(
              baseColor: Colors.orange,
              highlightColor: Colors.amberAccent,
              child: Container(
                height: 210,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            //wave bg
            Opacity(
              opacity: 0.25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('./assets/images/noisy.png'),
              ),
            ),

            //avatar, name, qrcode
            Positioned(
              top: 15,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(width: 20),

                  //avatar
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        width: 2,
                        color: Colors.white54,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        width: 130,
                        height: 130,
                        child: Image.asset(
                          './assets/images/avatar.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 25),

                  //qrcode
                  ClipRRect(
                    child: SizedBox(
                      width: 170,
                      height: 180,
                      child: Image.asset(
                        './assets/images/qrcode.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //member
            Positioned(
              bottom: 44.25,
              left: 68.25,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'MEMBER',
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'ios',
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            //text
            Positioned(
              bottom: 16.5,
              left: 45,
              child: Row(
                children: const <Widget>[
                  Icon(
                    size: 20,
                    Icons.touch_app,
                    color: Colors.white70,
                  ),
                  SizedBox(width: 5),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      'Tap to flip',
                      style: TextStyle(
                        fontFamily: 'iosReg',
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        back: Stack(
          children: <Widget>[
            //card
            Shimmer.fromColors(
              baseColor: Colors.orange,
              highlightColor: Colors.amberAccent,
              child: Container(
                height: 210,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            //xlogo
            Positioned(
              right: 10,
              top: -10,
              child: Opacity(
                opacity: 0.5,
                child: Image.asset('./assets/images/logo.png'),
              ),
            ),

            //wave bg
            Opacity(
              opacity: 0.25,
              child: Image.asset(
                './assets/images/noisy.png',
              ),
            ),

            //texts
            Positioned(
              top: 25,
              left: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: const <Widget>[
                      Text(
                        'Youssif Mohammed Samir',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'iosReg',
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: const <Widget>[
                      FaIcon(
                        size: 19,
                        FontAwesomeIcons.mars,
                        color: Colors.black87,
                      ),
                      SizedBox(width: 10),
                      Text(
                        '21 Years',
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.5),
                  Row(
                    children: const <Widget>[
                      FaIcon(
                        size: 15,
                        color: Colors.black87,
                        FontAwesomeIcons.phone,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '  01015689385',
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.5),
                  Row(
                    children: const <Widget>[
                      Icon(
                        size: 15,
                        Icons.email,
                        color: Colors.black87,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '  youssifsamirr@outlook.com',
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
