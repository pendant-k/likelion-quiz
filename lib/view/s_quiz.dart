import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likelion_quiz/model/quiz_model.dart';
import 'package:likelion_quiz/palette.dart';
import 'package:likelion_quiz/controller/quiz_controller.dart';
import 'package:likelion_quiz/model/quiz_data.dart';
import 'package:likelion_quiz/view/w_choice_quiz.dart';
import 'package:likelion_quiz/view/w_main_btn.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _quizIndex = 0;
  int _totalScore = 0;
  int _time = 0;
  late Timer timer;
  // double minutes
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(QuizController());

    return Scaffold(
      backgroundColor: Palette.background,
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 250,
          vertical: 100,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (quiz_list[_controller.quizIndex].type == QuizType.choice)
              Obx(
                () => ChoiceQuiz(
                  quizContent: quiz_list[_controller.quizIndex].question,
                  label1: quiz_list[_controller.quizIndex].choice1!,
                  label2: quiz_list[_controller.quizIndex].choice2!,
                  label3: quiz_list[_controller.quizIndex].choice3!,
                  label4: quiz_list[_controller.quizIndex].choice4!,
                ),
              ),
            if (quiz_list[_quizIndex].type == QuizType.short) Container(),
            Spacer(),
            MainBtn(
              label: "다음",
              onTap: () => _controller.next(),
            ),
          ],
        ),
      ),
    );
  }
}
