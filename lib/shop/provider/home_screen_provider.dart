import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  bool? isEligible;
  String? eligibleMessage = "";
  int getage = 0;

  checkEligiblity(int age) {
    if (age >= 18) {
      getage = age;
      isEligible = true;
      eligibleMessage = "You are eligible";
      notifyListeners();
    } else {
      getage = age;
      isEligible = false;
      eligibleMessage = "You are not eligible";
      notifyListeners();
    }
  }
}
