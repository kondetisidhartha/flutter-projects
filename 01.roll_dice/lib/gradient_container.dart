import "package:flutter/material.dart";
import "package:roll_dice/dice_roller.dart";
// import "package:roll_dice/style_text.dart";

class GradientContainer extends StatelessWidget {
  // constructor - passing key to super class - statelesswidget
  // GradientContainer({key}) : super(key: key);
  // const GradientContainer(this.gradientColors, {super.key});
  // by default, named args are optional
  const GradientContainer({super.key, required this.gradientColors});

  GradientContainer.blackToRed({super.key})
      : gradientColors = [Colors.black, Colors.red];

  final List<Color> gradientColors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
