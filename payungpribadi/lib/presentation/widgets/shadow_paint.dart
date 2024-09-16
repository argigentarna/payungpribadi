// ignore_for_file: unused_local_variable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:payungpribadi/common/theme.dart';

class ShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint shadowPaint = Paint()
      ..color = kWhitePrimaryColor.withOpacity(0.5)
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 1.0); // Shadow blur

    Path path = Path()
      ..addOval(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRect(Rect.fromLTWH(1, size.height / 2, size.width, size.height / 2))
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, shadowPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class TopHeavyShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..maskFilter =
          const MaskFilter.blur(BlurStyle.normal, 8.0); // Shadow blur

    // Create a path that includes the circle and a semi-transparent top shadow
    Path path = Path()..addOval(Rect.fromLTWH(0, 0, size.width, size.height));

    // Draw shadow at the top of the circle
    Path shadowPath = Path()
      ..addOval(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRect(Rect.fromLTWH(0, -size.height / 4, size.width, size.height / 2))
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(shadowPath, shadowPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class TopBorderCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          painter: TopBorderPainter(),
          child: Container(
            width: 100.0, // Adjust the size as needed
            height: 100.0, // Adjust the size as needed
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class TopBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint borderPaint = Paint()
      ..color = Colors.black // Color of the border
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0; // Adjust the border width as needed

    Path borderPath = Path()
      ..addOval(Rect.fromLTWH(0, 0, size.width, size.height));

    Path topBorderPath = Path()
      ..addOval(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height / 2))
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(topBorderPath, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void main() => runApp(MaterialApp(home: TopBorderCircle()));
