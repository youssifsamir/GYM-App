// ignore_for_file: use_key_in_widget_constructors

//packages
import 'package:flutter/material.dart';

//widgets
import '/widgets/smallbox.dart';

class MachineObj {
  final String img, txt;
  MachineObj({required this.img, required this.txt});
}

class SmallSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<MachineObj> machines = [
      MachineObj(img: './assets/images/legpress.png', txt: 'Leg Press '),
      MachineObj(img: './assets/images/chestpress.png', txt: 'Chest Press '),
      MachineObj(
        img: './assets/images/shoulderpress.png',
        txt: 'Shoulder Press ',
      ),
      MachineObj(img: './assets/images/legpress.png', txt: 'Trepbob Press '),
      MachineObj(img: './assets/images/chestpress.png', txt: 'Soptop Press '),
    ];
    return GridView.builder(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 25, right: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 35,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: SmallBox(
            machine: machines[index],
          ),
        );
      },
      itemCount: machines.length,
    );
  }
}
