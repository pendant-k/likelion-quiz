import 'package:flutter/material.dart';

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
