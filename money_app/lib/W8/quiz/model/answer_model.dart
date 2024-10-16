import 'package:money_app/W8/quiz/model/question_model.dart';

class AnswerModel {
  final String answerId;
  final QuestionModel question;
  final String answer;

  AnswerModel({
    required this.answerId,
    required this.question,
    required this.answer,
  });

  bool isCorrect() {
    return question.correctAnswer == answer;
  }
}
