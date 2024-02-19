// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

//packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//providers
import '/provider/workout.dart';

//widgets
import '/widgets/boxcard.dart';

class MediumSlider extends StatelessWidget {
  final int category;
  final List<WorkoutObj> workouts;
  const MediumSlider({
    required this.category,
    required this.workouts,
  });

  @override
  Widget build(BuildContext context) {
    return workouts.isEmpty
        ? Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 45),
                FaIcon(
                  category == 0
                      ? FontAwesomeIcons.heartCrack
                      : FontAwesomeIcons.solidFaceSadCry,
                  size: 40,
                  color: Colors.white,
                ),
                const SizedBox(height: 35),
                Text(
                  category == 0
                      ? 'You have no favorite workouts.'
                      : category == 1
                          ? 'You have no customized workouts.'
                          : 'You have no workouts here.',
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'iosReg',
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  category == 0
                      ? 'Add your favorite workouts now !'
                      : category == 1
                          ? 'Create your own workouts now !'
                          : 'Register with a coach now !',
                  style: const TextStyle(
                    fontSize: 14,
                    wordSpacing: 1.5,
                    fontFamily: 'iosReg',
                    color: Colors.orange,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          )
        : GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 20,
              childAspectRatio: 1.15,
              maxCrossAxisExtent: 500,
            ),
            itemBuilder: (BuildContext context, int index) {
              return BoxCardWidget(
                img: workouts[index].img,
                txt: workouts[index].txt,
                subtxt: workouts[index].subtxt,
              );
            },
            itemCount: workouts.length,
          );
  }
}
