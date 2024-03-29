import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:human_benchmark_flutter_v2/core/extensions/context_extension.dart';

import '../../helpers/colors.dart';
import '../text/less_futured_text.dart';
import 'elevated_button.dart';

class CustomButtonWithBorder extends StatelessWidget {
  CustomButtonWithBorder({
    Key? key,
    required this.onPressed,
    this.text,
    this.child,
    this.size,
    this.leading,
    this.isGameWidget = false,
    this.backgroundColor,
    this.textColor,
    this.borderSideWidth,
    this.borderColor,
  }) : super(key: key);

  Function onPressed;
  String? text;
  Size? size;
  Widget? child;
  bool isGameWidget;
  Widget? leading;
  Color? backgroundColor;
  Color? textColor;
  double? borderSideWidth;
  Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () => onPressed(),
      primary: backgroundColor ?? Colors.white,
      borderRadius: 5,
      borderSideWidth: borderSideWidth ?? 1.5,
      borderSideColor: borderColor ?? MyColors.secondaryColor,
      size: size ?? Size(context.width / 2, context.height / 17),
      child: child ??
          Row(
            mainAxisSize: isGameWidget ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  leading ?? Container(),
                  leading == null ? Container() : SizedBox(width: 5.w),
                ],
              ),
              LessText.lessFuturedText(
                text: text ?? '',
                fontWeight: isGameWidget ? FontWeight.w600 : FontWeight.w400,
                color: textColor ?? MyColors.secondaryColor,
                fontSize: 18,
                textAlign: TextAlign.left,
              ),
              Container(),
            ],
          ),
    );
  }
}
