class QuestionModel {
  final String questionId;
  final String title;
  final List<String> possibleAnswer;
  final String correctAnswer;

  QuestionModel({
    required this.questionId,
    required this.title,
    required this.correctAnswer,
    List<String>? possibleAnswer,
  }) : possibleAnswer = possibleAnswer ?? [];

  void addPossibleAnswer(String answer) {
    possibleAnswer.add(answer);
  }
}
