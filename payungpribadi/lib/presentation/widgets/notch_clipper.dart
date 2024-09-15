import 'package:flutter/material.dart';

class NotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double notchWidth = 50.0; // Width of the notch
    final double notchHeight = 30.0; // Height of the notch

    Path path = Path();
    path.lineTo(0.0, size.height - notchHeight); // Bottom left
    path.lineTo(size.width, size.height - notchHeight); // Bottom right
    path.lineTo(size.width, size.height); // Bottom right corner
    path.lineTo(0.0, size.height); // Bottom left corner

    // Draw the notch
    path.lineTo(size.width / 2 - notchWidth / 2,
        size.height - notchHeight); // Left side of the notch
    path.arcToPoint(
      Offset(size.width / 2 + notchWidth / 2,
          size.height - notchHeight), // Right side of the notch
      radius: Radius.circular(notchHeight),
      clockwise: false,
    );
    path.lineTo(size.width / 2 + notchWidth / 2,
        size.height - notchHeight); // Continue line after the notch

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
