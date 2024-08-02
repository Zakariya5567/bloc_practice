import "package:flutter/material.dart";

abstract class ColorEvents {}

class ColorChangeEvent extends ColorEvents {
  final Color color;
  String colorName;
  ColorChangeEvent(this.color, this.colorName);
}
