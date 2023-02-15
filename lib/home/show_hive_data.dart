import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quize_app/models/question_model.dart';

import '../services/hive_service.dart';

class ShowHivaData extends StatefulWidget {
  const ShowHivaData({super.key});

  @override
  State<ShowHivaData> createState() => _ShowHivaDataState();
}

class _ShowHivaDataState extends State<ShowHivaData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Hive Data'),
      ),
      body: ValueListenableBuilder<Box<QuestionModel>>(
        valueListenable: HiveService.getBox().listenable(),
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  children: [
                    Text(value.getAt(index)!.question),
                    Text(value.getAt(index)!.options[0].option),
                    Text(value.getAt(index)!.options[1].option),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
