import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/gradient_container.dart';
import 'package:flutter_quiz/questions_screen.dart';
import 'package:flutter_quiz/results_screen.dart';
import 'package:flutter_quiz/start_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  @override
  void initState() {
    super.initState();
  }

  void changeScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void selectedAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  @override
  Widget build(context) {
    Widget? screenWidget;
    if (activeScreen == "start-screen") {
      screenWidget = StartScreen(changeScreen);
    } else if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(
        onSelectedAnswer: selectedAnswer,
      );
    } else if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(
        results: selectedAnswers,
      );
    }

    return GradientContainer(
      children: Center(
        child: screenWidget,
      ),
    );
  }
}
