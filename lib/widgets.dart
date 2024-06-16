import 'package:flutter/material.dart';

class Screens extends StatelessWidget {
  final Color color;
  final String title;
  const Screens({super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: color,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 26, letterSpacing: 1.3),
          )
        ],
      ),
    );
  }
}
