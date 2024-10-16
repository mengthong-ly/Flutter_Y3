import 'package:money_app/W8/quiz/model/answer_model.dart';
import 'package:money_app/W8/quiz/model/question_model.dart';

class SubmittionModel {
  final String submissionId;
  final List<AnswerModel> answers;

  SubmittionModel({
    required this.submissionId,
    List<AnswerModel>? answers,
  }) : answers = answers ?? [];

  void addAnswer(AnswerModel answer) {
    answers.add(answer);
  }

  int getScore() {
    int score = 0;
    for (AnswerModel answer in answers) {
      score += answer.isCorrect() ? 1 : 0;
    }
    return score;
  }

  AnswerModel? getAnswerFor(QuestionModel tempQuestion) {
    return answers.firstWhere(
      (answer) {
        return answer.question == tempQuestion;
      },
    );
  }
}
