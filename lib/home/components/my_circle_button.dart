// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:quize_app/res/constants/widget_styles.dart';

class MyCircleButton extends StatelessWidget {
  final String text;
  final int selectedId;
  final bool isPassText;
  final VoidCallback onPressed;

  const MyCircleButton({
    Key? key,
    required this.text,
    required this.selectedId,
    required this.isPassText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red.shade400,
          boxShadow: WidgetStyle.myBoxShadow,
        ),
        child: Container(
          alignment: Alignment.center,
          height: 42,
          width: 42,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: text != selectedId.toString()
                ? Colors.blue.shade200
                : Colors.blue.shade500,
          ),
          child: Text(
            isPassText ? text : "✗",
            style: TextStyle(
              color: isPassText ? Colors.green : Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
