import 'package:flutter/material.dart';

class Sizes {
  static BuildContext? context;
  static double height = MediaQuery.of(context!).size.height;
  static double width = MediaQuery.of(context!).size.width;
}
