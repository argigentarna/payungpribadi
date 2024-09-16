// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class InitialCircle extends StatelessWidget {
  final String name;
  final double size;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final VoidCallback? onPress;

  const InitialCircle({
    required this.name,
    this.size = 30.0,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.fontSize = 12.0,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    // Get the first letter of the name
    String initial = name.isNotEmpty ? name[0].toUpperCase() : '';

    return GestureDetector(
      onTap: () {
        if (onPress != null) {
          onPress!();
        }
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          initial,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
