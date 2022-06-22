import 'package:flutter/material.dart';

class CounterController extends ChangeNotifier {
  int count = 0;

  void add() {
    count++;
    notifyListeners();
  }

  void minus(){
    count--;
    notifyListeners();
  }
}