import 'package:flutter/material.dart';
import 'package:likelion_quiz/constants.dart';
import 'package:likelion_quiz/palette.dart';

/// [MainBtn] is a custom widget that is used to create a button with a custom width, height, and background color.
class MainBtn extends StatelessWidget {
  const MainBtn({
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
    return SizedBox(
        width: width ?? 250,
        height: height ?? 56,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Palette.MAINCOLOR,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Constants.radius),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Gmarket',
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ));
  }
}
