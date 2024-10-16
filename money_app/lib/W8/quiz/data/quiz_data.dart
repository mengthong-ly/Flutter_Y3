import 'package:money_app/W8/quiz/model/question_model.dart';
import 'package:money_app/W8/quiz/model/quiz_model.dart';
import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

QuizModel quizData =
    QuizModel(quizId: uuid.v4(), title: 'Quiz App', questions: [
  QuestionModel(
      questionId: uuid.v4(),
      title: 'what is 1 + 1?',
      possibleAnswer: ['11', '2', 'i don\'t know'],
      correctAnswer: "2"),
  QuestionModel(
      questionId: uuid.v4(),
      title: 'why is 10 + 2?',
      possibleAnswer: ['12', '69', '102'],
      correctAnswer: "12"),
  QuestionModel(
      questionId: uuid.v4(),
      title: 'who is the best teacher?',
      possibleAnswer: ['vichet', 'ronan', 'tiveon'],
      correctAnswer: "ronan"),
]);
