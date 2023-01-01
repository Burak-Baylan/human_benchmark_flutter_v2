import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/phone_properties.dart';
import '../../../helpers/timer.dart';
import '../controllers/numbers_memory_controller.dart';

class ShowNumber extends StatefulWidget {
  ShowNumber({Key? key}) : super(key: key);

  @override
  _ShowNumberState createState() => _ShowNumberState();
}

class _ShowNumberState extends State<ShowNumber> {
  late NumbersMemoryController c;

  late BuildContext context;

  initializeValues() {
    c = Get.find();
    c.onShowNumberPage = true;
  }

  @override
  void dispose() {
    c.onShowNumberPage = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) {
    context = buildContext;
    initializeValues();
    startLevel();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              c.valueController.number,
              style: TextStyle(
                color: MyColors.secondaryColor,
                fontSize: 35.sp,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Phone.width(context) / 3,
              ),
              child: buildProgressBar(),
            ),
          ],
        ),
      ),
    );
  }

  startLevel() {
    c.valueController.numberGenerator();
    MyTimer.startTimer(
      milliseconds: c.valueController.levelSecond,
      onFinished: () => c.selectAskNumberPage(),
    );
  }

  Widget buildProgressBar() {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(180 / 360),
      child: LinearPercentIndicator(
        width: Phone.width(context) / 3,
        lineHeight: 5,
        animation: true,
        animationDuration: c.valueController.levelSecond,
        percent: 1,
        linearStrokeCap: LinearStrokeCap.butt,
        backgroundColor: MyColors.secondaryColor,
        progressColor: Colors.white,
      ),
    );
  }
}
