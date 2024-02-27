import 'package:get/get.dart';
import 'package:likelion_quiz/model/quiz_data.dart';

class QuizController extends GetxController {
  QuizController();

  // 현재 문제 번호
  final _quizIndex = 0.obs;
  set quizIndex(value) => this._quizIndex.value = value;
  get quizIndex => this._quizIndex.value;

  final _currentAnswer = ''.obs;
  set currentAnswer(value) => this._currentAnswer.value = value;
  get currentAnswer => this._currentAnswer.value;

  /// 총 점수
  final _score = 0.obs;
  set score(value) => this._score.value = value;
  get score => this._score.value;

  next() {
    if (currentAnswer == quiz_list[quizIndex].answer) {
      score++;
    }
    currentAnswer = "";

    if (quizIndex == quiz_list.length - 1) {
      Get.offNamed('/result');
    } else {
      quizIndex++;
    }
  }
}
