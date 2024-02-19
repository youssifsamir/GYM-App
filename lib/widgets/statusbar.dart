// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

//packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StatusObj {
  final FaIcon icon;
  final String num, txt;
  StatusObj({
    required this.icon,
    required this.num,
    required this.txt,
  });
}

class StatusBar extends StatelessWidget {
  List<StatusObj> status = [
    StatusObj(
      icon: const FaIcon(
        color: Colors.orange,
        FontAwesomeIcons.personWalking,
      ),
      num: '6,335',
      txt: 'STEPS',
    ),
    StatusObj(
      icon: const FaIcon(
        color: Colors.orange,
        FontAwesomeIcons.heartPulse,
      ),
      num: '125 BPM',
      txt: 'HEARTBEAT',
    ),
    StatusObj(
      icon: const FaIcon(
        color: Colors.orange,
        FontAwesomeIcons.fireFlameCurved,
      ),
      num: '3,115  CAL',
      txt: 'CAL BURNT',
    ),
    StatusObj(
      icon: const FaIcon(
        color: Colors.orange,
        FontAwesomeIcons.bowlRice,
      ),
      num: '1,095  CAL',
      txt: 'CAL INTAKE',
    ),
    StatusObj(
      icon: const FaIcon(
        color: Colors.orange,
        FontAwesomeIcons.bottleWater,
      ),
      num: '10 LITRE',
      txt: 'WATER INTAKE',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 10,
        maxCrossAxisExtent: 500,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.white54,
                Colors.white24,
                Colors.orange,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 18.5),
              status[index].icon,
              const SizedBox(height: 12),
              Text(
                status[index].num,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'ios',
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                status[index].txt,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'iosReg',
                  color: Colors.white24,
                ),
              )
            ],
          ),
        );
      },
      itemCount: status.length,
    );
  }
}
