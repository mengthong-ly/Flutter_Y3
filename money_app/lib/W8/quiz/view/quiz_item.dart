import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/web.dart';
import 'package:money_app/W8/quiz/model/answer_model.dart';
import 'package:money_app/W8/quiz/model/question_model.dart';
import 'package:money_app/W8/quiz/view/title_text.dart';

class QuizItem extends StatelessWidget {
  const QuizItem({
    super.key,
    required this.nextQuestion,
    required this.question,
    required this.answers,
  });
  final List<AnswerModel> answers;
  final VoidCallback nextQuestion;
  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TitleText(
              title: question.title,
            ),
            const SizedBox(height: 20),
            ...question.possibleAnswer.map(
              (possibleAnswer) {
                return buildChoice(
                    possibleAnswer, nextQuestion, answers, question);
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget buildChoice(String text, void Function() nextQuestion,
    List<AnswerModel> answer, QuestionModel model) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: FilledButton(
      onPressed: () {
        answer.add(AnswerModel(answerId: '1', answer: text, question: model));
        Logger().d(answer);
        nextQuestion();
      },
      style: FilledButton.styleFrom(backgroundColor: Colors.blue[300]),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    ),
  );
}
