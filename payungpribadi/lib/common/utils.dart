import 'dart:math';
import 'dart:ui';

Color getRandomColor() {
  final random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256), // Red
    random.nextInt(256), // Green
    random.nextInt(256), // Blue
  );
}
