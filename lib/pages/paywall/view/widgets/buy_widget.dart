import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../../../../widgets/text/less_futured_text.dart';

class BuyWidget extends StatelessWidget {
  BuyWidget({super.key, required this.onPressed});

  Function onPressed;

  Color mainColor = const Color(0xff14C38E);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            fixedSize: Size(context.width, context.height / 15)),
        onPressed: () => onPressed(),
        child: LessText.lessFuturedText(
            text: 'CONTINUE',
            fontSize: 15.sp,
            fontFamily: '',
            color: Colors.white,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
