// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

//packages
import 'package:flutter/material.dart';

class StatusObj2 {
  final String num, txt;
  StatusObj2({
    required this.num,
    required this.txt,
  });
}

class StatusBar2 extends StatelessWidget {
  List<StatusObj2> status = [
    StatusObj2(num: '101 g', txt: 'Carbs'),
    StatusObj2(num: '24 g', txt: 'Protien'),
    StatusObj2(num: '12 g', txt: 'Fats'),
    StatusObj2(num: '21 g', txt: 'Sugar'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 20,
        mainAxisExtent: 72.5,
        maxCrossAxisExtent: 500,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.white54,
                Colors.white24,
                Colors.white24,
                Colors.orange,
                Colors.orange,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 28),
              Text(
                status[index].num,
                style: const TextStyle(
                  fontSize: 17,
                  fontFamily: 'Open Sans',
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                status[index].txt,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'iosReg',
                  color: Colors.white60,
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
