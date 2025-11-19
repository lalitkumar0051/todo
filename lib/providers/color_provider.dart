import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  bool _isBlue = false; // private variable

  bool get isBlue => _isBlue; // public getter

  void toggleColor() {
    _isBlue = !_isBlue;
    notifyListeners(); // rebuilds listening widgets
  }
}
