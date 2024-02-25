import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likelion_quiz/main.dart';
import 'package:likelion_quiz/palette.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.result, required this.time});
  final int result;
  final int time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.MAINCOLOR,
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
              '총 $result개 맞추셨어요!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
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
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            // Container(
            //   width: 400,
            //   padding: EdgeInsets.symmetric(horizontal: 5),
            //   alignment: Alignment.center,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: Colors.white,
            //   ),
            //   child: TextField(
            //     decoration: InputDecoration(hintText: '이름'),
            //     cursorColor: Palette.MAINCOLOR,
            //     autocorrect: false,
            //     autofocus: false,
            //     style: TextStyle(
            //       fontSize: 14,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Container(
            //   width: 400,
            //   padding: EdgeInsets.symmetric(horizontal: 5),
            //   alignment: Alignment.center,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10), color: Colors.white),
            //   child: TextField(
            //     decoration: InputDecoration(hintText: '전화번호(기프티콘 전달)'),
            //     cursorColor: Palette.MAINCOLOR,
            //     autocorrect: false,
            //     autofocus: false,
            //     style: TextStyle(
            //       fontSize: 14,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 100,
            // ),
            // SizedBox(
            //   width: 200,
            //   height: 50,
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.white,
            //     ),
            //     onPressed: () {},
            //     child: Text(
            //       '기록 등록하기',
            //       style: TextStyle(
            //         color: Colors.black,
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Get.offAll(() => MainPage());
                },
                child: Text(
                  '메인 화면으로',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
