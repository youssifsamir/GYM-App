//packages
import 'package:flutter/material.dart';

class WorkoutObj {
  final int category;
  final String img, txt, subtxt;
  WorkoutObj({
    required this.img,
    required this.txt,
    required this.subtxt,
    required this.category,
  });
}

class WorkoutProvider with ChangeNotifier {
  int category = 2;

  final List<String> _categories = [
    'Favorites',
    'My Workouts',
    'Home Workouts',
    'Coach Workouts',
  ];

  final List<WorkoutObj> _favorites = [];

  final List<WorkoutObj> _myworkouts = [];

  final List<WorkoutObj> _homeworkouts = [
    WorkoutObj(
      img: './assets/images/abs1.jpg',
      txt: '20 mins',
      subtxt: 'Abs Builder',
      category: 1,
    ),
    WorkoutObj(
      img: './assets/images/push2.jpg',
      txt: '10 mins',
      subtxt: 'Pushups',
      category: 1,
    ),
    WorkoutObj(
      img: './assets/images/squats.webp',
      txt: '15 mins',
      subtxt: 'Squats',
      category: 1,
    ),
  ];

  final List<WorkoutObj> _coachworkouts = [];

  void setCategory(int n) {
    category = n;
    notifyListeners();
  }

  List<WorkoutObj> get homeworkouts {
    return [..._homeworkouts];
  }

  List<WorkoutObj> get favorites {
    return [..._favorites];
  }

  List<WorkoutObj> get myworkouts {
    return [..._myworkouts];
  }

  List<WorkoutObj> get coachworkouts {
    return [..._coachworkouts];
  }

  List<String> get categories {
    return [..._categories];
  }
}
