import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../helpers/colors.dart';

class WrongDetector {
  WrongDetector({required this.answer, required this.userAnswer});

  late int answerLength;
  late int userAnswerLength;
  late String answer;
  late String userAnswer;
  List<String> answerCharacters = [];
  List<String> userAnswerCharacters = [];
  List<Widget> textSpanList = [];
  List<Widget> extraTextSpanList = [];
  String extraText = "";
  String text = "";

  void initializeValues() {
    answerLength = answer.length;
    userAnswerLength = userAnswer.length;
    answerCharacters.clear();
    userAnswerCharacters.clear();
    textSpanList.clear();
  }

  Widget detect() {
    initializeValues();
    _seperate();
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: textSpanList + extraTextSpanList,
    );
  }

  void _seperate() {
    _seperateCharacters(charList: answerCharacters, text: answer);
    _seperateCharacters(charList: userAnswerCharacters, text: userAnswer);
    int endPoint = _compareLenghts();
    _strikeOut(endPoint: endPoint);
  }

  void _seperateCharacters({
    required List<String> charList,
    required String text,
  }) {
    int textLength = text.length;
    for (var i = 0; i < textLength; i++) {
      String char = text[i];
      charList.add(char);
    }
  }

  int _compareLenghts() {
    int endPoint;
    if (answerLength > userAnswerLength) {
      endPoint = userAnswerLength - 1;
    } else {
      endPoint = answerLength - 1;
      extraText = userAnswer.substring(answerLength, userAnswerLength);
      extraTextSpanList.add(
        buildText(text: extraText, lineThrough: true),
      );
    }
    return endPoint;
  }

  void _strikeOut({required int endPoint}) {
    for (var i = 0; i <= endPoint; i++) {
      String answer = answerCharacters[i];
      String userAnswer = userAnswerCharacters[i];
      if (answer != userAnswer) {
        textSpanList.add(
          buildText(text: userAnswer, lineThrough: true),
        );
      } else {
        textSpanList.add(
          buildText(text: userAnswer, lineThrough: false),
        );
      }
    }
  }

  Widget buildText({
    required String text,
    required bool lineThrough,
  }) {
    return Text(
      text,
      style: TextStyle(
        decoration:
            lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
        color: MyColors.secondaryColor,
        fontWeight: FontWeight.w300,
        fontSize: 25.sp,
      ),
    );
  }
}
