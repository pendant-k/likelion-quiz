import 'dart:async';

import 'package:get/get.dart';
import 'package:likelion_quiz/model/quiz_data.dart';
import 'package:likelion_quiz/view/s_result.dart';

class QuizController extends GetxController {
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick == 60) {
        timer.cancel();
        time = timer.tick;
        Get.to(() => ResultScreen(
              score: score,
              time: time,
            ));
      } else {
        time = timer.tick;
      }
      print('timer: ${timer.tick}');
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  void onClose() {
    timer!.cancel();
    super.onClose();
  }

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

  /// time
  final _time = 0.obs;
  set time(value) => this._time.value = value;
  get time => this._time.value;

  next() {
    if (currentAnswer.isEmpty) return;
    if (currentAnswer == quiz_list[quizIndex].answer) {
      score++;
    }
    currentAnswer = "";

    if (quizIndex == quiz_list.length - 1) {
      timer?.cancel();
      Get.to(() => ResultScreen(
            score: score,
            time: time,
          ));
    } else {
      quizIndex++;
    }
  }
}
