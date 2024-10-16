import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/web.dart';
import 'package:money_app/W8/quiz/model/answer_model.dart';
import 'package:money_app/W8/quiz/model/submittion_model.dart';
import 'package:money_app/W8/quiz/view/title_text.dart';

class AnswerPage extends StatelessWidget {
  final VoidCallback restartQuiz;
  final SubmittionModel submittionModel;

  const AnswerPage({
    super.key,
    required this.submittionModel,
    required this.restartQuiz,
  });

  @override
  Widget build(BuildContext context) {
    Logger().d(submittionModel.answers.length);
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              TitleText(
                title:
                    'Your answer is ${submittionModel.getScore().toString()} of 3',
              ),
              const SizedBox(height: 30),
              ...submittionModel.answers.map(
                (answer) {
                  return buildAnswerBlock(answer: answer);
                },
              ),
              const SizedBox(height: 15),
              FilledButton.icon(
                onPressed: restartQuiz,
                style: FilledButton.styleFrom(
                    backgroundColor: Colors.white, iconColor: Colors.blue),
                icon: const Icon(Icons.restart_alt),
                label: Text(
                  'Restart quiz',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAnswerBlock({required AnswerModel answer}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        buildNumberBadge(answer),
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              answer.question.title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...answer.question.possibleAnswer.map(
              (possibleAnswer) {
                return buildQuestionAnswer(
                  answer.answer == possibleAnswer ? Icons.check : null,
                  possibleAnswer,
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget buildNumberBadge(AnswerModel answer) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: answer.isCorrect() ? Colors.green : Colors.red,
      ),
      child: Center(
        child: Text(
          (submittionModel.answers.indexOf(answer) + 1).toString(),
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }

  Widget buildQuestionAnswer(IconData? icon, String possibleAnswer) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          possibleAnswer,
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
