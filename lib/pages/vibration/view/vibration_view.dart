import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helpers/colors.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/text/less_futured_text.dart';

class VibrationView extends StatelessWidget {
  const VibrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppBar('2/4'),
        ),
        backgroundColor: Colors.white, //catchColorVm.backgroundColor,
        body: Container(
          color: Colors.blueAccent,
          child: GestureDetector(
            onTap: () {},
            child: Center(
              child: Container(
                color: Colors.white, //catchColorVm.backgroundColor,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: LessText.lessFuturedText(
                  text:
                      'When you feel vibration, click the screen fast as possible!',
                  color: MyColors.secondaryColor,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
