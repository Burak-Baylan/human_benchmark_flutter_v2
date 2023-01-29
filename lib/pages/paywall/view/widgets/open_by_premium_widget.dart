import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class OpenByPremiumWidget extends StatelessWidget {
  OpenByPremiumWidget({
    Key? key,
    required this.text,
    required this.icon,
    this.smallIcon = false,
  }) : super(key: key);

  String icon;
  String text;
  bool smallIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          color: Colors.white,
          width: smallIcon ? context.width / 17 : context.width / 17,
          height: smallIcon ? context.width / 17 : context.width / 17,
        ),
        SizedBox(width: context.width * 0.04),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: context.width / 19,
              fontWeight: FontWeight.w300,
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
