import 'package:hive/hive.dart';
import 'package:quize_app/models/question_model.dart';

import '../res/constants/constant.dart';

class HiveService {
  static Box<QuestionModel> getBox() =>
      Hive.box<QuestionModel>(Constants.hiveName);
}
