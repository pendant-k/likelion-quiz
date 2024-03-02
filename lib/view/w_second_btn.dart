import 'package:flutter/material.dart';
import 'package:likelion_quiz/constants.dart';

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
    return SizedBox(
        width: width ?? 250,
        height: height ?? 56,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            elevation: 1,
            backgroundColor: backgroundColor ?? Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey[200]!, width: 1),
              borderRadius: BorderRadius.circular(Constants.radius),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Gmarket',
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ));
  }
}
