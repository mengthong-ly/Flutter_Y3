import 'package:money_app/W8/quiz/model/question_model.dart';

class QuizModel {
  final String quizId;
  final List<QuestionModel> questions;
  final String title;

  QuizModel(
      {required this.quizId,
      required this.title,
      List<QuestionModel>? questions})
      : questions = questions ?? [];

  void addQuestion(QuestionModel model) {
    questions.add(model);
  }
}
