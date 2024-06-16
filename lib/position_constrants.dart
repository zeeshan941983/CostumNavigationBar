import 'package:custom_nav/app_config.dart';
import 'package:custom_nav/widgets.dart';
import 'package:flutter/material.dart';

double animatedPositionLeftValue(int index) {
  switch (index) {
    case 0:
      return AppSize.blockSizeHorizontal * 8.2;
    case 1:
      return AppSize.blockSizeHorizontal * 29;
    case 2:
      return AppSize.blockSizeHorizontal * 50;

    case 3:
      return AppSize.blockSizeHorizontal * 71;
  }
  return 0;
}

final List<Color> gradiant = [
  Colors.yellow.withOpacity(0.8),
  Colors.yellow.withOpacity(0.5),
  Colors.transparent
];

final List<Widget> listScreen = [
  Screens(color: Colors.deepPurple, title: "Home Page"),
  Screens(color: Colors.yellow, title: "Search Page"),
  Screens(color: Colors.blue, title: "Activity Page"),
  Screens(color: Colors.red.shade50, title: "Profile Page"),
];
