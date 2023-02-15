import 'package:hive/hive.dart';

part 'question_model.g.dart';

@HiveType(typeId: 0)
class QuestionModel extends HiveObject {
  @HiveField(0)
  int qId;
  @HiveField(1)
  String question;
  @HiveField(2)
  List<OptionModel> options;

  QuestionModel({
    required this.qId,
    required this.question,
    required this.options,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'qId': qId,
      'question': question,
      'options': options.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      qId: map['qId'] as int,
      question: map['question'] as String,
      options: List<OptionModel>.from(
          map['options']?.map((x) => OptionModel.fromMap(x))),
    );
  }
}

@HiveType(typeId: 1)
class OptionModel extends HiveObject {
  @HiveField(0)
  int optionId;
  @HiveField(1)
  String option;
  @HiveField(2)
  bool isCorrect;

  OptionModel({
    required this.optionId,
    required this.option,
    required this.isCorrect,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'optionId': optionId,
      'option': option,
      'isCorrect': isCorrect,
    };
  }

  factory OptionModel.fromMap(Map<String, dynamic> map) {
    return OptionModel(
      optionId: map['optionId'] as int,
      option: map['option'] as String,
      isCorrect: map['isCorrect'] as bool,
    );
  }
}
