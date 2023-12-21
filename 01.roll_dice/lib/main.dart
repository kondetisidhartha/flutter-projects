import "package:flutter/material.dart";
import "package:roll_dice/gradient_container.dart";

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      // backgroundColor: Color.fromARGB(255, 124, 128, 168),
      // Scaffold doesnt provide any gradient color
      // so we need to use Container
      body: GradientContainer(
        gradientColors: [
          Color.fromARGB(255, 3, 3, 94),
          Color.fromARGB(255, 7, 7, 168),
        ],
      ),
    ),
  ));
}
