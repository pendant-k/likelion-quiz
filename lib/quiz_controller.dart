import 'package:get/get.dart';

class QuizController extends GetxController {
  QuizController();

  final _currentAnswer = ''.obs;
  set currentAnswer(value) => this._currentAnswer.value = value;
  get currentAnswer => this._currentAnswer.value;

  void setCurrentAnswer(String value) {
    currentAnswer = value;
  }
}
