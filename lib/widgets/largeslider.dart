// ignore_for_file: use_key_in_widget_constructors

//packages
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

//widgets
import '/widgets/largecard.dart';

class NewWorkoutsObj {
  final String img, txt, subtxt;
  NewWorkoutsObj({
    required this.img,
    required this.txt,
    required this.subtxt,
  });
}

class LargeSlider extends StatelessWidget {
  final List<NewWorkoutsObj> neworkouts = [
    NewWorkoutsObj(
      img: './assets/images/card10.jpg',
      txt: 'Lastman',
      subtxt: 'Triceps & Back',
    ),
    NewWorkoutsObj(
      img: './assets/images/card2.jpg',
      txt: 'Powerhorse',
      subtxt: 'Legs & Abs',
    ),
    NewWorkoutsObj(
      img: './assets/images/card6.jpeg',
      txt: 'Quick Reload',
      subtxt: 'Chest & Biceps',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: neworkouts.map((workout) {
        return LargeCard(
          img: workout.img,
          txt: workout.txt,
          subtxt: workout.subtxt,
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        initialPage: 1,
        viewportFraction: 0.75,
        enlargeCenterPage: true,
        height: double.infinity,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(seconds: 3),
      ),
    );
  }
}
