import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likelion_quiz/palette.dart';
import 'package:likelion_quiz/view/s_home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '성균관대학교 멋쟁이사자처럼 퀴즈',
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: Palette.MAINCOLOR,
        primarySwatch: Colors.grey,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          focusColor: Palette.MAINCOLOR,
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(0.6),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
