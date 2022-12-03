import 'package:flutter/material.dart';
import 'package:human_benchmark_flutter_v2/core/extensions/context_extension.dart';

import '../../helpers/colors.dart';
import '../text/less_futured_text.dart';
import 'elevated_button.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.size,
  }) : super(key: key);

  Function onPressed;
  String text;
  Size? size;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () => onPressed(),
      primary: MyColors.secondaryColor,
      borderRadius: 10,
      borderSideColor: Colors.transparent,
      size: size ?? Size(context.width / 2, context.height / 17),
      child: LessText.lessFuturedText(
        text: text,
        fontWeight: FontWeight.w300,
        color: Colors.white,
        fontSize: 18,
      ),
    );
  }
}
