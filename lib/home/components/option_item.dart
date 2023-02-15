// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quize_app/models/question_model.dart';

class OptionItem extends StatelessWidget {
  final OptionModel optionModel;
  final Widget prefix;
  final Widget suffix;

  const OptionItem({
    Key? key,
    required this.optionModel,
    required this.prefix,
    required this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefix,
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              optionModel.option,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.w600),
            ),
          ),
          suffix,
        ],
      ),
    );
  }
}
