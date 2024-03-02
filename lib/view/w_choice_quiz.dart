import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:likelion_quiz/constants.dart';
import 'package:likelion_quiz/controller/quiz_controller.dart';
import 'package:likelion_quiz/palette.dart';

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
          () => Container(
            width: 500,
            alignment: Alignment.centerLeft,
            child: Text(
              "Q. ${_controller.quizIndex + 1}",
              style: TextStyle(
                fontFamily: "Gmarket",
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          width: 500,
          height: 150,
          alignment: Alignment.center,
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
          width: 500,
          child: Obx(
            () => AnimatedButton(
              height: 56,
              borderWidth: 1,
              borderRadius: Constants.radius,
              borderColor: Colors.grey[300]!,
              animationDuration: Constants.duration,
              selectedGradientColor: LinearGradient(
                colors: [Color(0xFF3A8A70), Palette.MAINCOLOR],
              ),
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
              transitionType: TransitionType.LEFT_TO_RIGHT,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 500,
          child: Obx(
            () => AnimatedButton(
              height: 56,
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
              selectedGradientColor: LinearGradient(
                colors: [Color(0xFF3A8A70), Palette.MAINCOLOR],
              ),
              selectedTextColor: Colors.white,
              transitionType: TransitionType.LEFT_TO_RIGHT,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 500,
          child: Obx(
            () => AnimatedButton(
              height: 56,
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
              selectedGradientColor: LinearGradient(
                colors: [Color(0xFF3A8A70), Palette.MAINCOLOR],
              ),
              transitionType: TransitionType.LEFT_TO_RIGHT,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 500,
          child: Obx(
            () => AnimatedButton(
              height: 56,
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
              selectedGradientColor: LinearGradient(
                colors: [Color(0xFF3A8A70), Palette.MAINCOLOR],
              ),
              transitionType: TransitionType.LEFT_TO_RIGHT,
            ),
          ),
        ),
      ],
    );
  }
}
