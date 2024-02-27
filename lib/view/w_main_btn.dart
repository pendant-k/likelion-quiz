import 'package:flutter/material.dart';
import 'package:likelion_quiz/palette.dart';

/// MainBtn is a custom widget that is used to create a button with a custom width, height, and background color.
class MainBtn extends StatelessWidget {
  const MainBtn({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    required this.label,
  });

  /// The width of the button.
  final double? width;

  /// The height of the button.
  final double? height;

  /// The background color of the button.
  final Color? backgroundColor;

  /// The label of the button.
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 250,
      height: height ?? 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor ?? Palette.MAINCOLOR,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
