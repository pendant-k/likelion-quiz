import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likelion_quiz/palette.dart';
import 'package:likelion_quiz/view/s_quiz.dart';
import 'package:likelion_quiz/view/w_main_btn.dart';
import 'package:likelion_quiz/view/w_second_btn.dart';

/// 홈화면 위젯
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.white,
                size: 28,
              ),
            );
          },
        ),
        title: Image.asset(
          'images/logo_white.png',
          width: 300,
        ),
        backgroundColor: Palette.MAINCOLOR,
      ),
      backgroundColor: Palette.background,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '성균관대학교 멋쟁이사자처럼',
                  style: TextStyle(
                    fontFamily: 'Gmarket',
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              '웹 프로그래밍 스피드 퀴즈',
              style: TextStyle(
                fontFamily: 'agro',
                fontWeight: FontWeight.bold,
                fontSize: 60,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeItem(
                  iconData: Icons.card_giftcard_rounded,
                  title: "상품 기준",
                  body1: "- 참여만 해도 간식 제공",
                  body2: "- 가장 많은 문제를 맞춘 3등까지 기프티콘 선물",
                ),
                SizedBox(width: 60),
                HomeItem(
                  iconData: Icons.quiz_rounded,
                  title: "출제 내용",
                  body1: "- HTML/CSS/JS 관련 문제",
                  body2: "- 멋사 활동 관련 문제",
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            MainBtn(
              onTap: () {
                Get.to(() => QuizScreen());
              },
              label: '시작하기',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key,
    required this.title,
    required this.iconData,
    required this.body1,
    required this.body2,
  });
  final String title;
  final IconData iconData;
  final String body1;
  final String body2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 300,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            // Icons.card_giftcard_outlined,
            size: 120,
            color: Colors.black,
          ),
          Text(
            title,
            // '상품 기준',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Gmarket',
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            body1,
            // '- 참여만 해도 간식 제공',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Gmarket',
              color: Colors.black,
            ),
          ),
          Text(
            body2,
            // '- 가장 많은 문제를 맞춘 3등까지 기프티콘 선물',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Gmarket',
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
