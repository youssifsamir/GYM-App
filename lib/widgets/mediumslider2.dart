// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

//packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//screens
import '/screens/meal.dart';
import '/screens/nutritions.dart';

//widgets
import '/widgets/mediumbox.dart';

class MediumSlider2 extends StatelessWidget {
  final List<MealObj> meals;
  const MediumSlider2({required this.meals});

  @override
  Widget build(BuildContext context) {
    return meals.isEmpty
        ? Center(
            child: Column(
              children: const <Widget>[
                SizedBox(height: 45),
                FaIcon(
                  FontAwesomeIcons.solidFaceSadCry,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(height: 35),
                Text(
                  'You have no customized meals',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'iosReg',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Create your own meals now !',
                  style: TextStyle(
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
              mainAxisSpacing: 35,
              mainAxisExtent: 185,
              maxCrossAxisExtent: 500,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  MealScreen.routeName,
                  arguments: meals[index],
                ),
                child: MediumCardWidget(
                  img: meals[index].img,
                  name: meals[index].name,
                  duration: meals[index].duration,
                  calories: meals[index].calories,
                  protien: meals[index].protien,
                  carbs: meals[index].carbs,
                  fat: meals[index].fats,
                  sugar: meals[index].sugar,
                ),
              );
            },
            itemCount: meals.length,
          );
  }
}
