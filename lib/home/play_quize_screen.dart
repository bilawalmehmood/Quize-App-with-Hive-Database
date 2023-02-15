import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quize_app/home/components/my_circle_button.dart';
import 'package:quize_app/home/components/option_item.dart';
import 'package:quize_app/home/components/question_field.dart';
import 'package:quize_app/home/components/question_item.dart';
import 'package:quize_app/home/components/result_item.dart';
import 'package:quize_app/models/question_list.dart';
import 'package:quize_app/models/question_model.dart';
import 'package:quize_app/res/constants/constant.dart';
import 'package:quize_app/services/hive_service.dart';

class PlayQuizeScreen extends StatefulWidget {
  const PlayQuizeScreen({super.key});

  @override
  State<PlayQuizeScreen> createState() => _PlayQuizeScreenState();
}

class _PlayQuizeScreenState extends State<PlayQuizeScreen> {
  @override
  void initState() {
    super.initState();

    for (int i = 0; i < QuestionList.imageQuestions.length; i++) {
      QuestionModel questionModel =
          QuestionModel.fromMap(QuestionList.imageQuestions[i]);
      questions.add(questionModel);
    }
  }

  int qIndex = 0;
  int second = 0;
  int minut = 0;
  List<Widget> optionsList = [];
  List<Widget> rightOptionsList = [];
  List<Widget> questionsResult = [];
  List<QuestionModel> questions = [];
  int selctedId = 0;
  int rightAnswer = 0;
  int wrongAnswer = 0;
  bool isFinishedQuestions = false;

  @override
  Widget build(BuildContext context) {
    //  QuestionModel questionModel = questions[qIndex];
    // addOptionsIntoList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Constants.homeTitle,
          style: TextStyle(
              fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: ValueListenableBuilder<Box<QuestionModel>>(
        valueListenable: HiveService.getBox().listenable(),
        builder: (context, value, child) {
          QuestionModel questionModel = value.getAt(qIndex)!;
          addOptionsIntoList(questionModel);
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    QuestionField(
                      child: Center(
                        child: isFinishedQuestions
                            ? ResultItem(
                                correctAnswer: rightAnswer,
                                wrongAnswer: wrongAnswer)
                            // : ImageItem(
                            //     imagePath: questionModel.question,
                            //   ),
                            : QuestionItem(
                                qId: questionModel.qId,
                                question: questionModel.question,
                              ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    isFinishedQuestions
                        ? SingleChildScrollView(
                            child: Column(
                              children: questionsResult,
                            ),
                          )
                        : Column(
                            children: optionsList,
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void addOptionsIntoList(QuestionModel questionModel) {
    optionsList = [];
    // QuestionModel questionModel = questions[qIndex];
    List<OptionModel> options = questionModel.options;
    for (int i = 0; i < options.length; i++) {
      OptionModel optionModel = options[i];
      optionsList.add(
        OptionItem(
          optionModel: optionModel,
          prefix: MyCircleButton(
              text: optionModel.optionId.toString(),
              isPassText: true,
              selectedId: selctedId,
              onPressed: () => onClickOption(
                    selectOption: optionModel,
                    questionModel: questionModel,
                  )),
          suffix: const Text(""),
        ),
      );
    }
  }

  void onClickOption({
    required OptionModel selectOption,
    QuestionModel? questionModel,
  }) {
    // QuestionModel questionModel = questions[qIndex];
    setState(() {
      selctedId = selectOption.optionId;
    });
    selectOption.isCorrect ? rightAnswer++ : wrongAnswer++;
    rightOptionsList = [];

    List<OptionModel> options = questionModel!.options;

    for (int i = 0; i < options.length; i++) {
      OptionModel unSelectedOption = options[i];
      rightOptionsList.add(
        selectOption.option == unSelectedOption.option
            ? OptionItem(
                optionModel: selectOption,
                prefix: MyCircleButton(
                    text: selectOption.optionId.toString(),
                    isPassText: true,
                    selectedId: selctedId,
                    onPressed: () {}),
                suffix: selectOption.isCorrect
                    ? const Text(
                        "✓",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      )
                    : const Text(
                        "✗",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
              )
            : OptionItem(
                optionModel: unSelectedOption,
                prefix: MyCircleButton(
                    text: unSelectedOption.optionId.toString(),
                    isPassText: true,
                    selectedId: selctedId,
                    onPressed: () {}),
                suffix: unSelectedOption.isCorrect
                    ? const Text(
                        "✓",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      )
                    : const Text(""),
              ),
      );
    }
    questionsResult.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCircleButton(
                    text: "✓",
                    isPassText: selectOption.isCorrect,
                    selectedId: selctedId,
                    onPressed: () {}),
                const Spacer(),
                // ImageItem(
                //   imagePath: questionModel.question,
                // ),
                QuestionItem(
                    qId: questionModel.qId, question: questionModel.question),
                const Spacer()
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: rightOptionsList,
            )
          ],
        ),
      ),
    );

    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          if (qIndex < HiveService.getBox().length - 1) {
            selctedId = 0;
            qIndex++;
          } else {
            isFinishedQuestions = true;
          }
        });
      },
    );
  }
}
