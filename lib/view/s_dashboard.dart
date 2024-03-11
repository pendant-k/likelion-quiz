import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likelion_quiz/constants.dart';
import 'package:likelion_quiz/palette.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
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
          '순위표',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontFamily: 'Gmarket',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 200),
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            DashboardItem()
          ],
        ),
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  const DashboardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 100,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          Constants.radius,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '1등',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: 'Gmarket',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            '우헹헹헹헹헹헹헹',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Gmarket',
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "12개 / 42초",
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Gmarket',
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
