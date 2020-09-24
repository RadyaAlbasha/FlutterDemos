import 'package:flutter/material.dart';
import 'option.dart';

class Question{
  final String title;
  final Color color;
  final List<Option> options;

  Question(this.title,this.color, this.options);

}