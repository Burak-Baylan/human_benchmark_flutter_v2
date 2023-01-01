import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../helpers/colors.dart';
import '../../../widgets/button/custom_button_with_border.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../controller/recation_time_controller.dart';

class ReactionTimeInfoPage extends StatefulWidget {
  const ReactionTimeInfoPage({Key? key}) : super(key: key);

  @override
  State<ReactionTimeInfoPage> createState() => _ReactionTimeInfoPageState();
}

class _ReactionTimeInfoPageState extends State<ReactionTimeInfoPage> {
  late ReactionTimeController controller;

  @override
  void initState() {
    controller = Get.put(ReactionTimeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(''),
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
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LessText.lessFuturedText(
                text: 'Reaction Time',
                color: MyColors.secondaryColor,
                fontSize: 50.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 5.h),
              LessText.lessFuturedText(
                text: 'When the red color turns green, click on the screen as fast as possible.',
                color: MyColors.secondaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w300,
              ),
              SizedBox(height: 50.h),
              CustomButtonWithBorder(
                onPressed: () => controller.selectRedPage(),
                text: 'Play',
                leading: Icon(
                  Icons.play_arrow_rounded,
                  size: 25.sp,
                  color: MyColors.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
