import 'package:money_app/W8/quiz/model/quiz_model.dart';
import 'package:money_app/W8/quiz/model/submittion_model.dart';

class Quiz {
  final List<QuizModel> quiz;
  final List<SubmittionModel> submission;

  Quiz({
    required this.quiz,
    required this.submission,
  });

  void addQuiz(QuizModel model) {
    quiz.add(model);
  }

  void addSubmittion(SubmittionModel model) {
    submission.add(model);
  }
}
