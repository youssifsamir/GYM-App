// ignore_for_file: use_key_in_widget_constructors

//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '/provider/nutrition.dart';

//widgets
import '/widgets/slider.dart';
import '/widgets/mediumslider2.dart';

class MealObj {
  final String name, duration, img, calories, protien, carbs, sugar, fats;
  const MealObj({
    required this.img,
    required this.name,
    required this.duration,
    required this.calories,
    required this.protien,
    required this.carbs,
    required this.sugar,
    required this.fats,
  });
}

class NutritionScreen extends StatelessWidget {
  static const routeName = './nutrition.dart';

  final List<MealObj> meals = const [
    MealObj(
      img: './assets/images/meal3.png',
      name: 'Grilled Chicken',
      duration: '15 mins',
      calories: '490',
      protien: '4.6',
      carbs: '2.2',
      sugar: '1.7',
      fats: '0.4',
    ),
    MealObj(
      img: './assets/images/meal5.png',
      name: 'Meat & Soutè',
      duration: '10 mins',
      calories: '49',
      protien: '4.6',
      carbs: '2.2',
      sugar: '1.7',
      fats: '0.4',
    ),
    MealObj(
      img: './assets/images/meal8.png',
      name: 'Vegi & Chicken',
      duration: '10 mins',
      calories: '49',
      protien: '12',
      carbs: '2.2',
      sugar: '1.7',
      fats: '0.4',
    ),
  ];

  final List<MealObj> coachMeals = const [
    MealObj(
      img: './assets/images/meal6.png',
      name: 'Chicken & Rice',
      duration: '15 mins',
      calories: '49',
      protien: '4.6',
      carbs: '2.2',
      sugar: '1.7',
      fats: '0.4',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NutritionProvider>(context);
    return ListView(
      padding: const EdgeInsets.only(top: 70, left: 20),
      children: <Widget>[
        //text1 & icon1
        Row(
          children: const <Widget>[
            //text 1
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                'Nutrition & Calories',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Rubik',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 60),

            //icon1
            Icon(
              Icons.add,
              size: 30,
              color: Colors.orange,
            ),
          ],
        ),
        const SizedBox(height: 30),
        SliderWidget(),
        const SizedBox(height: 40),

        //text2, text3
        Row(
          children: const <Widget>[
            //text2
            Text(
              'Meals By You',
              style: TextStyle(
                fontSize: 17,
                wordSpacing: 2,
                fontFamily: 'Rubik',
                color: Colors.white,
              ),
            ),
            SizedBox(width: 200),

            //text3
            Padding(
              padding: EdgeInsets.only(top: 7),
              child: Text(
                'View all',
                style: TextStyle(
                  color: Colors.white38,
                  fontFamily: 'iosReg',
                  fontSize: 13,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 25),

        //slider1
        SizedBox(
          height: 270,
          child: MediumSlider2(
            meals: provider.filter == 1
                ? meals
                : provider.filter == 2
                    ? coachMeals
                    : [],
          ),
        ),

        const SizedBox(height: 50),

        //text4, text5
        Row(
          children: const <Widget>[
            //text4
            Text(
              'Coach Specials',
              style: TextStyle(
                fontSize: 17,
                wordSpacing: 2,
                fontFamily: 'Rubik',
                color: Colors.white,
              ),
            ),
            SizedBox(width: 185),

            //text5
            Padding(
              padding: EdgeInsets.only(top: 7),
              child: Text(
                'View all',
                style: TextStyle(
                  color: Colors.white38,
                  fontFamily: 'iosReg',
                  fontSize: 13,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 25),

        //slider2
        SizedBox(
          height: 270,
          child: MediumSlider2(
            meals: coachMeals,
          ),
        ),

        const SizedBox(height: 70),
      ],
    );
  }
}
