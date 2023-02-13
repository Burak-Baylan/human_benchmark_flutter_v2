import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../../../../widgets/text/less_futured_text.dart';

class PlanWidget extends StatelessWidget {
  PlanWidget({
    super.key,
    required this.isSelected,
    required this.title,
    required this.price,
    required this.perMonthText,
    required this.openSaleCard,
    required this.onPressed,
    this.saleCardText = '',
  });

  bool isSelected;
  String title;
  String price;
  String perMonthText;
  bool openSaleCard = false;
  Function onPressed;
  String saleCardText;

  Color mainColor = const Color(0xff14C38E);
  Color mainColor2 = Color.fromARGB(255, 211, 73, 87);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: (context.width / 2) - 15.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2,
            color: isSelected ? mainColor : Colors.grey.shade400,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LessText.lessFuturedText(
                text: title,
                color: isSelected ? mainColor : Colors.black,
                fontSize: 19.sp,
              ),
              SizedBox(height: 10.h),
              LessText.lessFuturedText(
                text: price,
                color: isSelected ? mainColor : Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 20.h),
              Container(
                decoration: BoxDecoration(
                  color: openSaleCard ? mainColor2 : Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.all(5.w),
                child: LessText.lessFuturedText(
                  text: openSaleCard ? saleCardText : '',
                  fontSize: 10.sp,
                  color: Colors.white,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10.h),
              LessText.lessFuturedText(
                text: perMonthText,
                color: isSelected ? mainColor : Colors.grey.shade400,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
