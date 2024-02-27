import 'package:flutter/material.dart';
import 'package:likelion_quiz/constants.dart';
import 'package:likelion_quiz/palette.dart';

/// [SecondBtn] is a custom widget that is used to create a button with a custom width, height, and background color.
class SecondBtn extends StatelessWidget {
  const SecondBtn({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    required this.label,
    required this.onTap,
  });

  /// The width of the button.
  final double? width;

  /// The height of the button.
  final double? height;

  /// The background color of the button.
  final Color? backgroundColor;

  /// The label of the button.
  final String label;

  /// The onTap function of the button.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 250,
        height: height ?? 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.radius),
          border: Border.all(
            color: Palette.MAINCOLOR,
            width: 2,
          ),
          color: backgroundColor ?? Colors.white,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
