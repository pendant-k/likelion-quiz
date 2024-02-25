import 'package:get/get.dart';

class QuizController extends GetxController {
  QuizController();

  final _currentAnswer = ''.obs;
  set currentAnswer(value) => this._currentAnswer.value = value;
  get currentAnswer => this._currentAnswer.value;

  /// 총 점수
  final _score = 0.obs;
  set score(value) => this._score.value = value;
  get score => this._score.value;
}
