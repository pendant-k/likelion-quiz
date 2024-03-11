import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likelion_quiz/constants.dart';
import 'package:likelion_quiz/controller/dashboard_controller.dart';
import 'package:likelion_quiz/model/m_user.dart';
import 'package:likelion_quiz/palette.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(DashboardController());
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.MAINCOLOR,
        onPressed: () {
          _controller.getUsers();
        },
        child: Icon(
          Icons.refresh,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 200),
        alignment: Alignment.center,
        child: Obx(
          () => _controller.loading
              ? CircularProgressIndicator(
                  color: Palette.MAINCOLOR,
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _controller.users.length,
                        itemBuilder: (context, index) => DashboardItem(
                          index: index,
                          user: _controller.users[index],
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  const DashboardItem({
    super.key,
    required this.user,
    required this.index,
  });

  final UserModel user;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 200, right: 200, bottom: 20),
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
            '${index + 1}등',
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
            user.name,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Gmarket',
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "${user.score}개 / ${user.time}초",
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
