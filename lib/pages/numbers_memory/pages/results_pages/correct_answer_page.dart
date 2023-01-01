import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../helpers/colors.dart';
import '../../../../helpers/phone_properties.dart';
import '../../../../widgets/button/custom_button_with_border.dart';
import '../../../../widgets/text/less_futured_text.dart';
import '../../controllers/numbers_memory_controller.dart';

class CorrectAnswer extends StatefulWidget {
  CorrectAnswer({Key? key}) : super(key: key);

  @override
  State<CorrectAnswer> createState() => _CorrectAnswerState();
}

class _CorrectAnswerState extends State<CorrectAnswer> {
  late NumbersMemoryController c;

  late BuildContext context;

  @override
  Widget build(BuildContext buildContext) {
    context = buildContext;
    c = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LessText.lessFuturedText(
              text: 'Number',
              color: MyColors.secondaryColor,
            ),
            SizedBox(height: 10),
            LessText.lessFuturedText(
              text: c.valueController.number,
              color: MyColors.secondaryColor,
              fontFamily: null,
              fontSize: 14,
            ),
            SizedBox(height: 20),
            LessText.lessFuturedText(
              text: 'Your Answer',
              color: MyColors.secondaryColor,
            ),
            SizedBox(height: 10),
            LessText.lessFuturedText(
              text: c.valueController.usersAnswer,
              color: MyColors.secondaryColor,
              fontFamily: null,
              fontSize: 14,
            ),
            SizedBox(height: 30),
            LessText.lessFuturedText(
              text: 'Level ${c.valueController.levelCounter}',
              color: MyColors.secondaryColor,
              fontSize: 50,
            ),
            SizedBox(
              height: 20,
            ),
            nextButton(),
          ],
        ),
      ),
    );
  }

  Widget nextButton() {
    return CustomButtonWithBorder(
      size: Size(context.width / 4, 50.h),
      onPressed: () {
        c.valueController.incrementLevel();
        c.selectShowNumberPage();
      },
      text: 'Next',
    );
  }
}
