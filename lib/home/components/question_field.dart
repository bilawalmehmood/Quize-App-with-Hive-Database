// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quize_app/models/question_list.dart';
import 'package:quize_app/res/constants/widget_styles.dart';

class QuestionField extends StatelessWidget {
  final Widget child;
  const QuestionField({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(70), bottomRight: Radius.circular(70)),
        boxShadow: WidgetStyle.myBoxShadow,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        height: 130,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.lightBlue.withOpacity(0.5),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(70), bottomRight: Radius.circular(70)),
        ),
        child: child,
      ),
    );
  }
}
