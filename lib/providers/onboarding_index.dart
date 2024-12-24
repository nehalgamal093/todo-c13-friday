import 'package:flutter/material.dart';


class OnBoardingIndexProvider extends ChangeNotifier {
  int currIndex = 0;

  void changeIndex(int index) {
    currIndex = index;
    notifyListeners();
  }
}
