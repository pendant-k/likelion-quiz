import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likelion_quiz/palette.dart';
import 'package:likelion_quiz/view/s_home.dart';
import 'package:likelion_quiz/view/s_submit.dart';
import 'package:likelion_quiz/view/w_main_btn.dart';
import 'package:likelion_quiz/view/w_second_btn.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.score,
    required this.time,
  });

  /// 맞힌 갯수
  final int score;

  /// 걸린 시간
  final int time;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Palette.background,
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 200,
            horizontal: 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '총 $score개 맞추셨어요!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '소요시간 : $time초',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              MainBtn(
                label: "기록 남기기",
                onTap: () {
                  Get.to(() => SubmitScreen());
                },
              ),
              SizedBox(height: 8),
              SecondBtn(
                  label: "홈으로",
                  onTap: () {
                    Get.offAll(() => HomeScreen());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
