// ignore_for_file: use_key_in_widget_constructors

//packages
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '/provider/nutrition.dart';

class SliderWidget extends StatefulWidget {
  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double x = 0;
  bool drag = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NutritionProvider>(context);

    return Container(
      height: 40,
      margin: const EdgeInsets.only(right: 20),
      decoration: const BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Stack(
        children: <Widget>[
          //animation
          AnimatedPositioned(
            left: x,
            curve: Curves.easeInOutCubicEmphasized,
            duration: Duration(milliseconds: drag ? 0 : 500),
            height: 40,
            width: 120,
            child: GestureDetector(
              onPanEnd: (details) => setState(
                () {
                  x > 67.5 && x < 165
                      ? x = 115
                      : x > 115
                          ? x = 230
                          : x = 0;
                  provider.setFilter(
                    x == 0
                        ? 1
                        : x == 115
                            ? 2
                            : 3,
                  );
                },
              ),
              onPanUpdate: (details) => setState(
                () {
                  drag = true;
                  x = max(
                    0,
                    (x + details.delta.dx) > 230 ? 230 : x + details.delta.dx,
                  );
                  provider.setFilter(
                    x == 0
                        ? 1
                        : x == 115
                            ? 2
                            : 3,
                  );
                },
              ),
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
            ),
          ),

          //texts
          GestureDetector(
            onTapDown: (details) => setState(
              () {
                drag = false;
                details.globalPosition.dx > 230
                    ? x = 230
                    : details.globalPosition.dx > 134 &&
                            details.globalPosition.dx < 230
                        ? x = 115
                        : x = 0;

                provider.setFilter(
                  x == 0
                      ? 1
                      : x == 115
                          ? 2
                          : 3,
                );
              },
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 32.5),

                  //breakfast
                  Text(
                    'Breakfast',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'iosReg',
                      color: x == 0 ? Colors.white : Colors.white24,
                    ),
                  ),
                  const SizedBox(width: 60),

                  //lunch
                  Text(
                    'Lunch',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'iosReg',
                      color: x == 115 ? Colors.white : Colors.white24,
                    ),
                  ),
                  const SizedBox(width: 60),

                  //dinner
                  Text(
                    'Dinner',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'iosReg',
                      color: x == 230 ? Colors.white : Colors.white24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
