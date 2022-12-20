import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../helpers/colors.dart';
import '../../../widgets/button/custom_button_with_border.dart';
import '../../../widgets/text/less_futured_text.dart';

class GamesWidget extends StatelessWidget {
  GamesWidget({
    Key? key,
    required this.text,
    required this.route,
    required this.gameNumber,
    this.onPressed,
  }) : super(key: key);

  String text;
  Widget route;
  String gameNumber;
  Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButtonWithBorder(
      onPressed: () {
        if (onPressed != null) onPressed!();
        Get.to(route);
      },
      backgroundColor: Colors.white,
      text: text,
      textColor: MyColors.secondaryColor,
      borderSideWidth: 3,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          LessText.lessFuturedText(
            text: gameNumber,
            fontWeight: FontWeight.w600,
            color: MyColors.secondaryColor,
            fontSize: 18,
            textAlign: TextAlign.left,
          ),
        ],
      ),
      isGameWidget: true,
      size: Size(context.width / 1.2, context.height / 17),
    );
  }
}
