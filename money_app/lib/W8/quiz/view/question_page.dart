import 'package:flutter/material.dart';
import 'package:money_app/W8/quiz/model/answer_model.dart';
import 'package:money_app/W8/quiz/model/question_model.dart';
import 'package:money_app/W8/quiz/view/quiz_item.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({
    super.key,
    required this.question,
    required this.nextQuestion,
    required this.answers
  });
  final QuestionModel question;
  final List<AnswerModel> answers;
  final void Function() nextQuestion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: QuizItem(
        nextQuestion: nextQuestion,
        question: question,
        answers: answers,
      ),
    );
  }
}
