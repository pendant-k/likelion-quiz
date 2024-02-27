import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:likelion_quiz/constants.dart';
import 'package:likelion_quiz/model/quiz_model.dart';
import 'package:likelion_quiz/palette.dart';
import 'package:likelion_quiz/controller/quiz_controller.dart';
import 'package:likelion_quiz/model/quiz_data.dart';
import 'package:likelion_quiz/view/s_result.dart';
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
    // TODO: implement initState
    super.initState();
    // timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
    //   _time++;
    // });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(QuizController());

    // _next() {
    //   if (_controller.currentAnswer == quiz_list[_quizIndex].answer) {
    //     _totalScore++;
    //   }
    //   _controller.currentAnswer = "";

    //   if (_quizIndex == quiz_list.length - 1) {
    //     Get.off(() => ResultScreen(result: _totalScore, time: _time));
    //   } else {
    //     setState(() {
    //       _quizIndex += 1;
    //     });
    //   }
    // }

    return Scaffold(
      backgroundColor: Palette.background,
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 250,
          vertical: 100,
        ),
        child: SingleChildScrollView(
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
              SizedBox(
                height: 100,
              ),
              MainBtn(
                label: "다음",
                onTap: () => _controller.next(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceQuiz extends StatefulWidget {
  ChoiceQuiz({
    Key? key,
    required this.quizContent,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.label4,
  }) : super(key: key);

  final String quizContent;
  final String label1;
  final String label2;
  final String label3;
  final String label4;

  @override
  State<ChoiceQuiz> createState() => _ChoiceQuizState();
}

class _ChoiceQuizState extends State<ChoiceQuiz> {
  @override
  Widget build(BuildContext context) {
    // dependency injection for QuizController
    final _controller = Get.put(QuizController());
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () => Text(
            "Q. ${_controller.quizIndex + 1}",
            style: TextStyle(
              fontFamily: "Gmarket",
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 400,
          child: Text(
            widget.quizContent,
            style: TextStyle(
              fontFamily: "Gmarket",
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        SizedBox(
          width: 400,
          child: Obx(
            () => AnimatedButton(
              borderWidth: 1,
              borderRadius: Constants.radius,
              borderColor: Colors.grey[300]!,
              animationDuration: Constants.duration,
              isSelected: _controller.currentAnswer == "1",
              text: widget.label1,
              onPress: () {
                _controller.currentAnswer = "1";
              },
              textStyle: TextStyle(
                fontFamily: "Gmarket",
                color: Colors.black,
                fontSize: 20,
              ),
              selectedTextColor: Colors.white,
              selectedBackgroundColor: Palette.MAINCOLOR,
              transitionType: TransitionType.LEFT_TO_RIGHT,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 400,
          child: Obx(
            () => AnimatedButton(
              borderWidth: 1,
              borderColor: Colors.grey[300]!,
              borderRadius: Constants.radius,
              animationDuration: Constants.duration,
              isSelected: _controller.currentAnswer == "2",
              text: widget.label2,
              onPress: () {
                _controller.currentAnswer = "2";
              },
              textStyle: TextStyle(
                fontFamily: "Gmarket",
                color: Colors.black,
                fontSize: 20,
              ),
              selectedTextColor: Colors.white,
              selectedBackgroundColor: Palette.MAINCOLOR,
              transitionType: TransitionType.LEFT_TO_RIGHT,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 400,
          child: Obx(
            () => AnimatedButton(
              borderWidth: 1,
              borderRadius: Constants.radius,
              borderColor: Colors.grey[300]!,
              animationDuration: Constants.duration,
              isSelected: _controller.currentAnswer == "3",
              text: widget.label3,
              onPress: () {
                _controller.currentAnswer = "3";
              },
              textStyle: TextStyle(
                fontFamily: "Gmarket",
                color: Colors.black,
                fontSize: 20,
              ),
              selectedTextColor: Colors.white,
              selectedBackgroundColor: Palette.MAINCOLOR,
              transitionType: TransitionType.LEFT_TO_RIGHT,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 400,
          child: Obx(
            () => AnimatedButton(
              borderWidth: 1,
              borderRadius: Constants.radius,
              borderColor: Colors.grey[300]!,
              animationDuration: Constants.duration,
              isSelected: _controller.currentAnswer == "4",
              text: widget.label4,
              onPress: () {
                _controller.currentAnswer = "4";
              },
              textStyle: TextStyle(
                fontFamily: "Gmarket",
                color: Colors.black,
                fontSize: 20,
              ),
              selectedTextColor: Colors.white,
              selectedBackgroundColor: Palette.MAINCOLOR,
              transitionType: TransitionType.LEFT_TO_RIGHT,
            ),
          ),
        ),
      ],
    );
  }
}
