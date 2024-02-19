// ignore_for_file: use_key_in_widget_constructors

//packages
import 'package:flutter/material.dart';

//widgets
import '/widgets/smallslider.dart';

class SmallBox extends StatelessWidget {
  final MachineObj machine;
  const SmallBox({required this.machine});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: 150,
        height: 150,
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            //image
            Positioned(
              top: 25,
              left: 13,
              child: SizedBox(
                width: 130,
                child: Image.asset(
                  machine.img,
                  fit: BoxFit.cover,
                ),
              ),
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
                    Colors.black38,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                  ],
                  // colors: [
                  //   Colors.white10,
                  //   Colors.transparent,
                  //   Colors.transparent,
                  // ],
                ),
              ),
            ),

            //text
            Positioned(
              bottom: 15,
              left: 15,
              child: Text(
                machine.txt,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Rubik',
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
