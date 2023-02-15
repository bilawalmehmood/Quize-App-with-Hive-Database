// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quize_app/models/question_list.dart';
import 'package:quize_app/res/constants/widget_styles.dart';

class ResultItem extends StatelessWidget {
  final int correctAnswer;
  final int wrongAnswer;
  const ResultItem({
    Key? key,
    required this.correctAnswer,
    required this.wrongAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Result Card",
            style: TextStyle(fontSize: 30, color: Colors.red.shade700)),
        showScore(text: "Correct Answers", score: correctAnswer),
        showScore(text: "Wrong Answers", score: wrongAnswer),
      ],
    );
  }

  Row showScore({
    required String text,
    required int score,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 15, color: WidgetStyle.qtextColor),
        ),
        Text(
          "$score",
          style: const TextStyle(
            color: WidgetStyle.qtextColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
