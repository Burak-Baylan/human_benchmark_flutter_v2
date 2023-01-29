import 'package:flutter/material.dart';

class LessText {
  static Text lessFuturedText({
    required String text,
    Color color = Colors.grey,
    double fontSize = 20,
    String? fontFamily = 'GemunuLibre',
    FontWeight fontWeight = FontWeight.bold,
    TextAlign textAlign = TextAlign.center,
    bool isItalic = false,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        color: color,
        fontSize: fontSize,
        fontStyle: isItalic ? FontStyle.italic : null,
      ),
      textAlign: textAlign,
    );
  }
}
