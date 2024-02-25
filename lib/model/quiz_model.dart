enum QuizType { choice, short }

class Quiz {
  final QuizType type;
  final String question;
  final String? choice1;
  final String? choice2;
  final String? choice3;
  final String? choice4;
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
