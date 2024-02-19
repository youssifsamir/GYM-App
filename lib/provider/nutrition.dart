import 'package:flutter/material.dart';

class NutritionProvider with ChangeNotifier {
  int filter = 1;

  void setFilter(int n) {
    filter = n;
    notifyListeners();
  }

  int getFilter() {
    return filter;
  }
}
