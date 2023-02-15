// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quize_app/models/question_list.dart';
import 'package:quize_app/res/constants/widget_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double? width;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height = 40,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: WidgetStyle.customButtonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: WidgetStyle.customButtonStyle,
          child: Text(
            text,
            style: WidgetStyle.customButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
