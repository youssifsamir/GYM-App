// ignore_for_file: use_key_in_widget_constructors

//packages
import 'package:flutter/material.dart';
//widgets
import '/widgets/flipcard.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = './profile.dart';
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 55),
      children: [
        //text 1, icon1
        Row(
          children: const <Widget>[
            //text 1
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Account Details',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Rubik',
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 190),

            //icon1
            Icon(
              Icons.settings,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),

        const SizedBox(height: 30),

        //flipcard
        FlipCardWidget(),

        const SizedBox(height: 20),

        //membership
        Container(
          height: 65,
          margin: const EdgeInsets.symmetric(horizontal: 10.5),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromARGB(12, 255, 255, 255),
          ),
          child: Row(
            children: <Widget>[
              const SizedBox(width: 35),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  SizedBox(height: 12),
                  Text(
                    'Membership',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '3 Months',
                    style: TextStyle(
                      color: Colors.white54,
                      fontFamily: 'Open Sans',
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              const SizedBox(width: 120),
              const Text(
                'CURRENT PLAN',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontFamily: 'Open Sans',
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),
        Image.asset(
          height: 250,
          './assets/images/x.gif',
        ),

        const Center(
          child: Text(
            'TO BE DEVELOPED...',
            style: TextStyle(
              fontFamily: 'Rubik',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
