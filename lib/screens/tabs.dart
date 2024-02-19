// ignore: depend_on_referenced_packages

//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//providers
import '/provider/bottombar.dart';

//screens
import 'home.dart';
import 'profile.dart';
import 'anaylsis.dart';
import 'workouts.dart';
import 'nutritions.dart';

// ignore: use_key_in_widget_constructors
class TabScreen extends StatefulWidget {
  static const routeName = "./tabs.dart";

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<dynamic> body = [
    HomeScreen(),
    NutritionScreen(),
    AnalysisScreen(),
    ProfileScreen(),
    WorkoutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 12, 12),

      body: Consumer<BottomAppBarProvider>(
        builder: (context, screen, _) => body[screen.getCurrentIndex],
      ),

      //Floating Action Button
      floatingActionButton: Consumer<BottomAppBarProvider>(
        builder: (context, provider, _) => FloatingActionButton(
          onPressed: () => setState(
            () => provider.updateBody(4),
          ),
          elevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          backgroundColor: Colors.orange,
          child: const FaIcon(FontAwesomeIcons.dumbbell),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //BottomApp Bar
      bottomNavigationBar: Consumer<BottomAppBarProvider>(
        builder: (context, i, _) => BottomAppBar(
          elevation: 50,
          notchMargin: 5,
          shape: const CircularNotchedRectangle(),
          color: const Color.fromARGB(255, 12, 12, 12),
          child: Row(
            children: <Widget>[
              const SizedBox(width: 25),

              //home
              IconButton(
                splashRadius: 0.01,
                color: i.getCurrentIndex == 0 ? Colors.orange : Colors.white,
                onPressed: () => i.updateBody(0),
                icon: i.getCurrentIndex == 0
                    ? const FaIcon(FontAwesomeIcons.house)
                    : const Icon(
                        size: 34,
                        Icons.home_outlined,
                      ),
              ),
              const SizedBox(width: 22.5),

              //diet
              IconButton(
                splashRadius: 0.01,
                icon: Icon(
                  size: 28,
                  i.getCurrentIndex == 1
                      ? Icons.fastfood_rounded
                      : Icons.fastfood_outlined,
                ),
                onPressed: () => i.updateBody(1),
                color: i.getCurrentIndex == 1 ? Colors.orange : Colors.white,
              ),
              const SizedBox(width: 97.5),

              //analytics
              IconButton(
                splashRadius: 0.01,
                icon: const Icon(
                  size: 29,
                  Icons.graphic_eq_rounded,
                ),
                onPressed: () => i.updateBody(2),
                color: i.getCurrentIndex == 2 ? Colors.orange : Colors.white,
              ),
              const SizedBox(width: 25),

              //profile
              IconButton(
                splashRadius: 0.01,
                padding: const EdgeInsets.all(0),
                icon: Icon(
                  size: 37,
                  i.getCurrentIndex == 3
                      ? Icons.person_rounded
                      : Icons.person_outline_rounded,
                ),
                onPressed: () => i.updateBody(3),
                color: i.getCurrentIndex == 3 ? Colors.orange : Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
