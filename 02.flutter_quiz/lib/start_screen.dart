import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          height: 300,
          color: const Color.fromARGB(120, 255, 255, 255),
        ),
        // Opacity(
        //   opacity: 0.5,
        //   child: Image.asset(
        //     "assets/images/quiz-logo.png",
        //     height: 300,
        //   ),
        // ),
        const SizedBox(
          height: 35,
        ),
        Text(
          "Learn flutter the fun way!",
          style: GoogleFonts.lato(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        OutlinedButton.icon(
          onPressed: () {
            startQuiz();
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          icon: const Icon(
            Icons.arrow_circle_right_sharp,
            color: Colors.white,
          ),
          label: const Text(
            "Start Quiz",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
