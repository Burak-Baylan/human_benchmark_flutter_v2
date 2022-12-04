import 'package:flutter/material.dart';
import 'package:human_benchmark_flutter_v2/core/extensions/context_extension.dart';

import '../../helpers/colors.dart';
import '../text/less_futured_text.dart';
import 'elevated_button.dart';

class SecondaryCustomButton extends StatelessWidget {
  SecondaryCustomButton({
    Key? key,
    required this.onPressed,
    this.text,
    this.child,
    this.size,
  }) : super(key: key);

  Function onPressed;
  String? text;
  Size? size;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () => onPressed(),
      primary: MyColors.transparentBlackForCard,
      borderRadius: 10,
      borderSideWidth: 1.5,
      borderSideColor: Colors.white,
      size: Size(context.width / 2, context.height / 17),
      child: child ??
          LessText.lessFuturedText(
            text: text ?? '',
            fontWeight: FontWeight.w300,
            color: Colors.white,
            fontSize: 18,
          ),
    );
  }
}
