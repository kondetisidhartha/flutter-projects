import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  // constructors in immutable class must be const
  const StyleText(this.outputText, {super.key});
  // variables in immutable class must be final
  final String outputText;

  @override
  Widget build(context) {
    return Text(
      outputText,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28,
      ),
    );
  }
}
