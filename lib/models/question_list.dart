import 'package:quize_app/res/constants/images_paths.dart';

class QuestionList {
  //  Play Quiz Screen
  static const String playQuizTitle = "Play Quiz Here";

  static List newQuestions = [
    {
      "qId": 1,
      "question": "Who created Flutter?",
      "options": [
        {"optionId": 1, "option": "Facebook", "isCorrect": false},
        {"optionId": 2, "option": "Google", "isCorrect": true},
        {"optionId": 3, "option": "Microsoft", "isCorrect": false},
        {"optionId": 4, "option": "Apple", "isCorrect": false},
      ],
    },
    {
      "qId": 2,
      "question": "What is Flutter?",
      "options": [
        {"optionId": 1, "option": "Programming Language", "isCorrect": false},
        {"optionId": 2, "option": "UI Framework", "isCorrect": true},
        {"optionId": 3, "option": "Both", "isCorrect": false},
        {"optionId": 4, "option": "None", "isCorrect": false},
      ],
    },
    {
      "qId": 3,
      "question": "What is Dart?",
      "options": [
        {"optionId": 1, "option": "Programming Language", "isCorrect": true},
        {"optionId": 2, "option": "UI Framework", "isCorrect": false},
        {"optionId": 3, "option": "Both", "isCorrect": false},
        {"optionId": 4, "option": "None", "isCorrect": false},
      ],
    },
    {
      "qId": 4,
      "question": "which is statless widget?",
      "options": [
        {"optionId": 1, "option": "Text", "isCorrect": false},
        {"optionId": 2, "option": "Check Box", "isCorrect": false},
        {"optionId": 3, "option": "Button", "isCorrect": false},
        {"optionId": 4, "option": "All", "isCorrect": true},
      ],
    },
    {
      "qId": 5,
      "question": "which is statefull widget?",
      "options": [
        {"optionId": 1, "option": "Text", "isCorrect": false},
        {"optionId": 2, "option": "TextField", "isCorrect": true},
        {"optionId": 3, "option": "Button", "isCorrect": false},
        {"optionId": 4, "option": "All", "isCorrect": false},
      ],
    },
  ];
  static List imageQuestions = [
    {
      "qId": 1,
      "question": ImagePaths.catImage,
      "options": [
        {"optionId": 1, "option": "Dog", "isCorrect": false},
        {"optionId": 2, "option": "Cat", "isCorrect": true},
        {"optionId": 3, "option": "Bird", "isCorrect": false},
      ],
    },
    {
      "qId": 2,
      "question": ImagePaths.dogImage,
      "options": [
        {"optionId": 1, "option": "Bird", "isCorrect": false},
        {"optionId": 2, "option": "Dog", "isCorrect": true},
        {"optionId": 3, "option": "Cat", "isCorrect": false},
      ],
    },
    {
      "qId": 3,
      "question": ImagePaths.birdImage,
      "options": [
        {"optionId": 1, "option": "Bird", "isCorrect": true},
        {"optionId": 2, "option": "Cat", "isCorrect": false},
        {"optionId": 3, "option": "Dog", "isCorrect": false},
      ],
    },
  ];
}
