import 'package:flutter/material.dart';

class FontProvider extends ChangeNotifier {
  double fontSize = 16.0; // Default font size

  void setSmall() {
    fontSize = 12;
    notifyListeners();
  }

  void setMedium() {
    fontSize = 16;
    notifyListeners();
  }

  void setLarge() {
    fontSize = 20;
    notifyListeners();
  }
}
