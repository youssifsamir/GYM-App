//packages
import 'package:flutter/material.dart';

class AnalysisProvider with ChangeNotifier {
  int filter = 0, filter2 = 1;

  void setFilter(int n) {
    filter = n;
    notifyListeners();
  }

  void setFilter2(int n) {
    filter2 = n;
    notifyListeners();
  }
}
