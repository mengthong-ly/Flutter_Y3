import 'package:flutter/material.dart';
import 'package:logger/web.dart';
import 'package:money_app/W8/quiz/data/quiz_data.dart';
import 'package:money_app/W8/quiz/model/quiz_model.dart';
import 'package:money_app/W8/quiz/model/submittion_model.dart';
import 'package:money_app/W8/quiz/model/quiz_app_model.dart';
import 'package:money_app/W8/quiz/view/answer_page.dart';
import 'package:money_app/W8/quiz/view/question_page.dart';
import 'package:money_app/W8/quiz/view/welcome_page.dart';
import 'package:uuid/uuid.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  @override
  State<QuizPage> createState() => _QuizPageState();
}

enum QuizState {
  notStart('not start'),
  started('started'),
  finish('finished');

  final String label;
  const QuizState(this.label);

  @override
  String toString() {
    return label;
  }
}

class _QuizPageState extends State<QuizPage> {
  
  static const uuid = Uuid();

  QuizState currentState = QuizState.notStart;
  int currentQuestion = 0;

  // data store here
  Quiz quizApp = Quiz(
    quiz: [],
    submission: [],
  );

  late SubmittionModel submission;
  late QuizModel quiz;

  void nextQuestion() {
    (currentQuestion < quiz.questions.length - 1 && currentQuestion >= 0)
        ? setState(() {
            currentQuestion++;
          })
        : setState(() {
            currentState = QuizState.finish;
          });
  }

  void triggerQuestionPage() {
    setState(() {
      currentState = QuizState.started;
    });
  }

  void triggerWelcomePage() {
    setState(() {
      currentQuestion = 0;
      currentState = QuizState.notStart;
      quizApp.addQuiz(quiz);
      quizApp.addSubmittion(submission);
    });
  }

  Widget stateProvider() {
    switch (currentState) {
      case QuizState.notStart:
        quiz = quizData;
        submission = SubmittionModel(submissionId: uuid.v4(), answers: []);
        return WelcomePage(
          triggerWelcome: triggerQuestionPage,
          quizTitle: quiz.title,
        );
      case QuizState.started:
        return QuestionPage(
          answers: submission.answers,
          nextQuestion: nextQuestion,
          question: quiz.questions[currentQuestion],
        );
      case QuizState.finish:
        return AnswerPage(
          submittionModel: submission,
          restartQuiz: triggerWelcomePage,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Logger().d('App Started');
    return stateProvider();
  }
}
