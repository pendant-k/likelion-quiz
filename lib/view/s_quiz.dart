import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likelion_quiz/constants.dart';
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
  var _remainingTime = 60;
  late Timer timer;
  // double minutes
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timer.tick == 60) {
          timer.cancel();
        }
        _remainingTime = 60 - timer.tick;
      });
    });
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
            QuizProgressBar(
              value: _remainingTime / 60,
            ),
            SizedBox(
              height: 20,
            ),
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

class QuizProgressBar extends StatelessWidget {
  const QuizProgressBar({
    super.key,
    required this.value,
  });
  final double value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('남은 시간'),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 500,
          height: 20,
          child: TweenAnimationBuilder<double>(
            duration: Constants.duration,
            curve: Curves.easeInOut,
            tween: Tween<double>(
              begin: 0,
              end: value,
            ),
            builder: (context, value, _) => LinearProgressIndicator(
              value: value,
              backgroundColor: Colors.white,
              color: Palette.btnBackground,
              borderRadius: BorderRadius.circular(Constants.radius),
            ),
          ),
          //  LinearProgressIndicator(
          //   value: value,
          // ),
        ),
      ],
    );
  }
}
