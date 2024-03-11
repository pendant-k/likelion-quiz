import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likelion_quiz/constants.dart';
import 'package:likelion_quiz/controller/quiz_controller.dart';
import 'package:likelion_quiz/model/user_repository.dart';
import 'package:likelion_quiz/palette.dart';
import 'package:likelion_quiz/view/s_home.dart';
import 'package:likelion_quiz/view/w_main_btn.dart';
import 'package:likelion_quiz/view/w_second_btn.dart';
import 'package:lottie/lottie.dart';

class SubmitScreen extends StatefulWidget {
  const SubmitScreen({super.key});

  @override
  State<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _quizController = Get.put(QuizController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Palette.MAINCOLOR,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.chevron_left,
              size: 30,
              color: Colors.white,
            ),
          ),
          title: Text(
            '기록 남기기',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontFamily: 'Gmarket',
              fontWeight: FontWeight.w500,
            ),
          )),
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Container(
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('animations/meow.json', width: 200, height: 200),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                            "맞춘 문제 : ${_quizController.score}개",
                            style: TextStyle(fontFamily: "Gmarket", fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Obx(
                          () => Text(
                            "소요 시간 : ${_quizController.time}초",
                            style: TextStyle(fontFamily: "Gmarket", fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "이름(닉네임)",
                      style: TextStyle(
                        fontFamily: 'Gmarket',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[300]!,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Palette.MAINCOLOR,
                          ),
                        ),
                        hintText: '이름을 입력해주세요',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '전화번호',
                      style: TextStyle(
                        fontFamily: 'Gmarket',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[300]!,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Palette.MAINCOLOR,
                          ),
                        ),
                        hintText: "'-' 없이 입력해주세요",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  MainBtn(
                    label: "기록 저장",
                    onTap: () async {
                      await UserReopsitory().createUser(
                        name: _nameController.text.trim(),
                        phoneNumber: _phoneNumberController.text.trim(),
                        time: _quizController.time,
                        score: _quizController.score,
                      );
                      Get.offAll(() => HomeScreen());
                    },
                  ),
                  SizedBox(height: 20),
                  SecondBtn(
                      label: "홈으로",
                      onTap: () {
                        Get.offAll(() => HomeScreen());
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
