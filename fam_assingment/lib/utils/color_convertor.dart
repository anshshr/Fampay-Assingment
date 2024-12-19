 import 'dart:ui';

Color hexToColor(String hexCode) {
    final hex = hexCode.replaceAll('#', ''); // Remove the '#' if present
    return Color(int.parse('FF$hex', radix: 16)); // Add alpha and convert
  }