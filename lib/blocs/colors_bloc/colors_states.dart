import 'package:flutter/material.dart';

abstract class ColorsState {}

class ColorInitialState extends ColorsState {
  Color color = Colors.teal;
  String colorName = "Teal";
  ColorInitialState(this.color, this.colorName);
}

class ColorUpdateState extends ColorsState {
  Color color = Colors.teal;
  String colorName = "Teal";
  ColorUpdateState(this.color, this.colorName);
}
