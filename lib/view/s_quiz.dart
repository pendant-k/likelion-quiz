import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likelion_quiz/model/quiz_model.dart';
import 'package:likelion_quiz/palette.dart';
import 'package:likelion_quiz/controller/quiz_controller.dart';
import 'package:likelion_quiz/model/quiz_data.dart';
import 'package:likelion_quiz/view/s_result.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _quizIndex = 0;
  int _totalScore = 0;
  int _time = 0;
  late Timer timer;
  // double minutes
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      _time++;
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

    _next() {
      if (_controller.currentAnswer == quiz_list[_quizIndex].answer) {
        _totalScore++;
      }
      _controller.currentAnswer = "";

      if (_quizIndex == quiz_list.length - 1) {
        Get.off(() => ResultScreen(result: _totalScore, time: _time));
      } else {
        setState(() {
          _quizIndex += 1;
        });
      }
    }

    return Scaffold(
      backgroundColor: Palette.MAINCOLOR,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                duration: Duration(minutes: 1, seconds: 1),
                tween: Tween(
                  begin: Duration(minutes: 1, seconds: 1),
                  end: Duration.zero,
                ),
                onEnd: () {
                  Get.off(() => ResultScreen(
                        result: _totalScore,
                        time: 60,
                      ));
                },
                builder: (context, value, child) {
                  final minutes = value.inMinutes;
                  final seconds = value.inSeconds % 60;
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      seconds < 10 ? '남은 시간 : 0$minutes:0$seconds' : '남은 시간 : 0$minutes:$seconds',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  );
                },
              ),
              if (quiz_list[_quizIndex].type == QuizType.choice)
                ChoiceQuiz(
                  quizContent: quiz_list[_quizIndex].question,
                  label1: quiz_list[_quizIndex].choice1!,
                  label2: quiz_list[_quizIndex].choice2!,
                  label3: quiz_list[_quizIndex].choice3!,
                  label4: quiz_list[_quizIndex].choice4!,
                ),
              if (quiz_list[_quizIndex].type == QuizType.short) Container(),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    _next();
                  },
                  child: Text(
                    '다음',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.quizContent,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        ListTile(
          leading: Obx(
            () => Radio(
                activeColor: Colors.white,
                value: "1",
                groupValue: _controller.currentAnswer,
                onChanged: (value) {
                  _controller.currentAnswer = value;
                }),
          ),
          title: Text(
            widget.label1,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        ListTile(
          leading: Obx(
            () => Radio(
                activeColor: Colors.white,
                value: "2",
                groupValue: _controller.currentAnswer,
                onChanged: (value) {
                  _controller.currentAnswer = value;
                }),
          ),
          title: Text(
            widget.label2,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        ListTile(
          leading: Obx(() => Radio(
                activeColor: Colors.white,
                value: "3",
                groupValue: _controller.currentAnswer,
                onChanged: (value) {
                  _controller.currentAnswer = value;
                },
              )),
          title: Text(
            widget.label3,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        ListTile(
          leading: Obx(() => Radio(
                activeColor: Colors.white,
                value: "4",
                groupValue: _controller.currentAnswer,
                onChanged: (value) {
                  _controller.currentAnswer = value;
                },
              )),
          title: Text(
            widget.label4,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}