import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quize_app/home/components/custom_button.dart';
import 'package:quize_app/home/components/custom_text_field.dart';
import 'package:quize_app/home/play_quize_screen.dart';
import 'package:quize_app/models/question_model.dart';
import 'package:quize_app/res/constants/constant.dart';
import 'package:quize_app/res/constants/widget_styles.dart';
import 'package:quize_app/services/hive_service.dart';

class AddQuestionsScreen extends StatefulWidget {
  const AddQuestionsScreen({super.key});

  @override
  State<AddQuestionsScreen> createState() => _AddQuestionsScreenState();
}

class _AddQuestionsScreenState extends State<AddQuestionsScreen> {
  late final TextEditingController questinController;
  late final TextEditingController option1Controller;
  late final TextEditingController option2Controller;
  late final TextEditingController option3Controller;
  late final TextEditingController option4Controller;
  late final GlobalKey<FormState> formKey;

  File? _image;
  bool isOption1Answered = false;
  bool isOption2Answered = false;
  bool isOption3Answered = false;
  bool isOption4Answered = false;

  List allOptionsField = [];
  List optionField = [];

  @override
  void initState() {
    super.initState();
    questinController = TextEditingController();
    option1Controller = TextEditingController();
    option2Controller = TextEditingController();
    option3Controller = TextEditingController();
    option4Controller = TextEditingController();
    formKey = GlobalKey<FormState>();
    allOptionsField = [
      CustomTextField(
        validator: _validateOption,
        labelText: "Option 1",
        hintText: "Enter Option 1",
        controller: option1Controller,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
      CustomTextField(
        validator: _validateOption,
        labelText: "Option 2",
        hintText: "Enter Option 2",
        controller: option2Controller,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
      CustomTextField(
        validator: _validateOption,
        labelText: "Option 3",
        hintText: "Enter Option 3",
        controller: option3Controller,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
      CustomTextField(
        validator: _validateOption,
        labelText: "Option 4",
        hintText: "Enter Option 4",
        controller: option4Controller,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
    ];
    optionField.add(allOptionsField[0]);
    optionField.add(allOptionsField[1]);
  }

  @override
  void dispose() {
    questinController.dispose();
    option1Controller.dispose();
    option2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            Constants.addQuestionsTitle,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // AddImageProfile(
                  //   backgroundImage: _image == null ? null : FileImage(_image!),
                  //   onPressed: _getImage,
                  // ),
                  CustomTextField(
                    validator: _validateQuestion,
                    labelText: "Question",
                    hintText: "Enter Question",
                    suffixText: "?",
                    maxLines: 3,
                    minLines: 1,
                    prefixIcon: Icons.question_answer,
                    prefixIconColor: WidgetStyle.primaryColor,
                    controller: questinController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 10),
                  ...optionField
                      .map(
                        (e) => Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  activeColor: WidgetStyle.primaryColor,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: e == optionField[0]
                                      ? isOption1Answered
                                      : e == optionField[1]
                                          ? isOption2Answered
                                          : e == optionField[2]
                                              ? isOption3Answered
                                              : isOption4Answered,
                                  onChanged: (value) {
                                    setState(() {
                                      if (e == optionField[0]) {
                                        isOption1Answered = value!;
                                        isOption2Answered = false;
                                        isOption3Answered = false;
                                        isOption4Answered = false;
                                      } else if (e == optionField[1]) {
                                        isOption2Answered = value!;
                                        isOption1Answered = false;
                                        isOption3Answered = false;
                                        isOption4Answered = false;
                                      } else if (e == optionField[2]) {
                                        isOption3Answered = value!;
                                        isOption1Answered = false;
                                        isOption2Answered = false;
                                        isOption4Answered = false;
                                      } else {
                                        isOption4Answered = value!;
                                        isOption1Answered = false;
                                        isOption2Answered = false;
                                        isOption3Answered = false;
                                      }
                                    });
                                  },
                                ),
                                Expanded(child: e),
                              ],
                            ),
                          ],
                        ),
                      )
                      .toList(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: _addOptionField,
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.green,
                          child: Icon(Icons.add),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: _removeOptionField,
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.redAccent,
                          child: Icon(Icons.remove),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: "Add Question",
                        onPressed: () {
                          if (_validate()) {
                            _addQuestionIntoList();
                            _clearAll();
                            _image = null;
                          }
                        },
                      ),
                      CustomButton(
                        text: "Show Question",
                        onPressed: () {
                          if (listEmpty()) {
                            _goToPlayQuizeScreen();
                            _clearAll();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _addOptionField() {
    if (allOptionsField.length == optionField.length) {
      return;
    } else {
      setState(() {
        optionField.add(allOptionsField[optionField.length]);
      });
    }
  }

  void _removeOptionField() {
    if (optionField.length == 2) {
      return;
    } else {
      setState(() {
        optionField.removeLast();
      });
    }
  }

  Future<void> _getImage() async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile? pickedImage =
        await imagePicker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      }
    });
  }

  _goToPlayQuizeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PlayQuizeScreen(),
      ),
    );
  }

  _clearAll() {
    questinController.clear();
    option1Controller.clear();
    option2Controller.clear();
    option3Controller.clear();
    option4Controller.clear();
    setState(() {
      isOption1Answered = false;
      isOption2Answered = false;
      isOption3Answered = false;
      isOption4Answered = false;
    });
  }

  String? _validateQuestion(String? value) {
    if (value!.isEmpty) {
      return "Please enter question";
    }
    return null;
  }

  String? _validateOption(String? value) {
    if (value!.isEmpty) {
      return "Please enter option";
    }
    return null;
  }

  bool _validate() {
    // if (_image == null) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text("Please select image"),
    //       backgroundColor: Colors.red,
    //     ),
    //   );
    //   return false;
    // } else
    if (formKey.currentState!.validate()) {
      if (isOption1Answered == false && isOption2Answered == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please select atleast one option"),
            backgroundColor: Colors.red,
          ),
        );
        return false;
      }
      return true;
    }
    return false;
  }

  bool listEmpty() {
    if (HiveService.getBox().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please add atleast one question"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
    return true;
  }

  _addQuestionIntoList() {
    String question = questinController.text.trim();
    String option1 = option1Controller.text.trim();
    String option2 = option2Controller.text.trim();
    String option3 = option3Controller.text.trim();
    String option4 = option4Controller.text.trim();

    List<OptionModel> options = [];

    for (int i = 0; i < optionField.length; i++) {
      if (i == 0) {
        options.add(OptionModel(
            optionId: i + 1, option: option1, isCorrect: isOption1Answered));
      } else if (i == 1) {
        options.add(OptionModel(
            optionId: i + 1, option: option2, isCorrect: isOption2Answered));
      } else if (i == 2) {
        options.add(OptionModel(
            optionId: i + 1, option: option3, isCorrect: isOption3Answered));
      } else if (i == 3) {
        options.add(OptionModel(
            optionId: i + 1, option: option4, isCorrect: isOption4Answered));
      }
    }

    QuestionModel newQuestion = QuestionModel(
      qId: HiveService.getBox().length + 1,
      question: question,
      options: options,
    );

    //Constants.imageQuestions.add(newQuestion.toMap());
    //Constants.newQuestions.add(newQuestion.toMap());
    Box<QuestionModel> box = HiveService.getBox();
    box.add(newQuestion);
    // newQuestion.save();
    // print(box.length);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Question added successfully"),
        backgroundColor: Colors.green,
      ),
    );
  }
}
