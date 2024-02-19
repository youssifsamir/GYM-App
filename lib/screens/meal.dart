// ignore_for_file: use_key_in_widget_constructors

//packages
import 'package:flutter/material.dart';

//screens
import 'nutritions.dart';

//widgets
import '/widgets/statusbar2.dart';

class MealScreen extends StatelessWidget {
  static const routeName = './meal.dart';

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as MealObj;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 12, 12, 12),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SizedBox(
        height: 1000,
        width: 500,
        child: Stack(
          children: <Widget>[
            const Positioned(
              left: -100,
              top: -280,
              child: Opacity(
                opacity: 0.35,
                child: CircleAvatar(
                  radius: 300,
                  backgroundColor: Colors.orange,
                ),
              ),
            ),
            Container(
              height: 350,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 105),
              child: Image.asset(meal.img, fit: BoxFit.cover),
            ),
            Positioned(
              left: 20,
              bottom: 75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${meal.calories} Calories',
                    style: const TextStyle(
                      fontSize: 17,
                      fontFamily: 'Open Sans',
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${meal.name} Breasts',
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontFamily: 'iosReg',
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing.\nLorem Ipsum has been the industry's standard dummy text\nthe 1500s, when an unknown printer took a galley of type\nit to make a type specimen book.",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'iosReg',
                      color: Colors.white54,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 90,
                    width: 350,
                    child: StatusBar2(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
