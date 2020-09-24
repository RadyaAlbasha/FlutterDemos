import 'package:flutter/material.dart';

class Counter extends ChangeNotifier{
  int number = 0;
  increment(){
    number++;
    notifyListeners(); //update data in classes use provider
  }
}