// ignore_for_file: use_key_in_widget_constructors

//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//providers
import '/provider/workout.dart';

//widgets
import '/widgets/largeslider.dart';
import '/widgets/smallslider.dart';
import '/widgets/mediumslider.dart';

class WorkoutScreen extends StatefulWidget {
  static const routeName = './workouts.dart';

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 60),

          //searchbar
          Center(
            child: Container(
              width: 360,
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0.15),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: Row(
                children: const <Widget>[
                  SizedBox(width: 25),

                  //search icon
                  FaIcon(
                    size: 18,
                    color: Colors.white,
                    FontAwesomeIcons.magnifyingGlass,
                  ),
                  SizedBox(width: 12.5),

                  //hintext
                  Text(
                    'Search workout...',
                    style: TextStyle(
                      fontSize: 14.35,
                      wordSpacing: 2,
                      fontFamily: 'iosReg',
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),

          //text1
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Trendy Workouts  🔥',
              style: TextStyle(
                fontSize: 17,
                wordSpacing: 2,
                fontFamily: 'Rubik',
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),

          //slider1
          SizedBox(
            width: 400,
            height: 250,
            child: LargeSlider(),
          ),

          const SizedBox(height: 25),

          //text2
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Consumer<WorkoutProvider>(
              builder: (context, provider, _) => Row(
                children: <Widget>[
                  SizedBox(
                    width: 152,
                    child: Text(
                      provider.categories[provider.category],
                      style: const TextStyle(
                        fontSize: 17,
                        wordSpacing: 2,
                        fontFamily: 'Rubik',
                        color: Colors.white,
                      ),
                    ),
                  ),

                  //dropdown menu
                  PopupMenuButton(
                    offset: const Offset(-100, -10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.black,
                    icon: const Icon(
                      size: 32,
                      color: Colors.white,
                      Icons.arrow_drop_down_sharp,
                    ),
                    itemBuilder: (_) => [
                      PopupMenuItem(
                        onTap: () => provider.setCategory(0),
                        height: 55,
                        child: const Center(
                          child: Text(
                            'Favorites',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'iosReg',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () => provider.setCategory(1),
                        height: 55,
                        child: const Center(
                          child: Text(
                            'My Workouts',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'iosReg',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () => provider.setCategory(2),
                        height: 55,
                        child: const Center(
                          child: Text(
                            "Home Workouts",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'iosReg',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () => provider.setCategory(3),
                        height: 55,
                        child: const Center(
                          child: Text(
                            'Coach Workouts',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'iosReg',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 108),

                  //text3
                  const Padding(
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
            ),
          ),
          const SizedBox(height: 10),

          //slider2
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              height: 220,
              child: Consumer<WorkoutProvider>(
                builder: (context, provider, _) => MediumSlider(
                  category: provider.category,
                  workouts: provider.category == 0
                      ? provider.favorites
                      : provider.category == 1
                          ? provider.myworkouts
                          : provider.category == 2
                              ? provider.homeworkouts
                              : provider.coachworkouts,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),

          //text3
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Need help with our machines ?',
              style: TextStyle(
                fontSize: 17,
                wordSpacing: 2,
                fontFamily: 'Rubik',
                color: Colors.white,
              ),
            ),
          ),

          //slider3
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              height: 700,
              child: SmallSlider(),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
