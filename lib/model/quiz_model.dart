enum QuizType { choice, short }

class Quiz {
  /// [type] is the type of the quiz, it can be either [QuizType.choice] or [QuizType.short]
  final QuizType type;

  ///   [question] is the question of the quiz
  final String question;

  ///  [choice1] is the first choice of the quiz
  final String? choice1;

  /// [choice2] is the second choice of the quiz
  final String? choice2;

  /// [choice3] is the third choice of the quiz
  final String? choice3;

  /// [choice4] is the fourth choice of the quiz
  final String? choice4;

  /// [answer] is the answer of the quiz
  final String answer;

  Quiz({
    required this.type,
    required this.question,
    this.choice1,
    this.choice2,
    this.choice3,
    this.choice4,
    required this.answer,
  });
}
