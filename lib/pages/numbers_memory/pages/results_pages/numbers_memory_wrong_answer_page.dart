import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../helpers/colors.dart';
import '../../../../widgets/button/custom_button_with_border.dart';
import '../../../../widgets/text/less_futured_text.dart';
import '../../controllers/number_memory_value_controller.dart';
import '../../controllers/numbers_memory_controller.dart';
import 'helpers/wrong_numbers_detecetor.dart';

class NumbersMemoryWrongAnswer extends StatefulWidget {
  NumbersMemoryWrongAnswer({Key? key}) : super(key: key);

  @override
  State<NumbersMemoryWrongAnswer> createState() =>
      _NumbersMemoryWrongAnswerState();
}

class _NumbersMemoryWrongAnswerState extends State<NumbersMemoryWrongAnswer> {
  late NumbersMemoryController c;
  late NumbersMemoryValueController vC;

  late BuildContext context;

  _initState() {
    c = Get.find();
    vC = c.valueController;
  }

  @override
  Widget build(BuildContext buildContext) {
    context = buildContext;
    _initState();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: _showLevelText(vC.levelCounter),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: MyColors.secondaryColor,
            size: 25.w,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _numberText(),
            SizedBox(height: 10.h),
            _showNumberText(vC.number),
            SizedBox(height: 30.h),
            _yourAnswerText(),
            SizedBox(height: 10.h),
            _showYourAnswerText(vC.number, vC.usersAnswer),
            SizedBox(height: 40.h),
            retryButton(),
          ],
        ),
      ),
    );
  }

  Text _numberText() => LessText.lessFuturedText(
        text: 'Number',
        color: MyColors.secondaryColor,
        fontSize: 27.sp,
      );

  Text _showNumberText(String number) => LessText.lessFuturedText(
        text: number,
        color: MyColors.secondaryColor,
        fontWeight: FontWeight.w300,
        fontSize: 25.sp,
      );

  Text _yourAnswerText() => LessText.lessFuturedText(
        text: 'Your Answer',
        color: MyColors.secondaryColor,
        fontSize: 27.sp,
      );

  Widget _showYourAnswerText(String answer, String userAnswer) => WrongDetector(
        answer: answer,
        userAnswer: userAnswer,
      ).detect();

  Text _showLevelText(int level) => LessText.lessFuturedText(
        text: 'Level $level',
        color: MyColors.secondaryColor,
        fontSize: 27.sp,
        fontWeight: FontWeight.w300,
      );

  Widget retryButton() {
    return CustomButtonWithBorder(
      size: Size(context.width / 4, 50.h),
      onPressed: () {
        c.valueController.reset();
        c.selectShowNumberPage();
      },
      text: 'Retry',
    );
  }
}
