// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quize_app/res/constants/widget_styles.dart';

import '../../models/question_list.dart';

class AddImageProfile extends StatelessWidget {
  final VoidCallback onPressed;
  final ImageProvider<Object>? backgroundImage;
  const AddImageProfile({
    Key? key,
    required this.onPressed,
    this.backgroundImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(radius: 80, backgroundImage: backgroundImage),
        Positioned(
          right: 0,
          bottom: 10,
          child: InkWell(
            onTap: onPressed,
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: WidgetStyle.primaryColor,
              child: Icon(Icons.add_a_photo),
            ),
          ),
        ),
      ],
    );
  }
}
