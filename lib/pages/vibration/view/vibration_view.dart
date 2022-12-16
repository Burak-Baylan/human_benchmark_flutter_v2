import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helpers/colors.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../view_model/vibration_view_model.dart';

class VibrationView extends StatefulWidget {
  VibrationView({Key? key}) : super(key: key);

  @override
  State<VibrationView> createState() => _VibrationViewState();
}

class _VibrationViewState extends State<VibrationView> {
  VibrationViewModel vibrateVm = getit<VibrationViewModel>();

  @override
  void dispose() {
    unregisterVibrationViewModel();
    vibrateVm.dispose();
    super.dispose();
  }

  @override
  void initState() {
    vibrateVm.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar('Vibration'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(child: clickWidget),
    );
  }

  Widget get clickWidget => Expanded(
        child: GestureDetector(
          onTap: () => vibrateVm.userClicked(),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.secondaryColor, width: 2),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: LessText.lessFuturedText(
                text:
                    'When you feel vibration, click the screen fast as possible!',
                color: MyColors.secondaryColor,
                fontSize: 25.sp,
              ),
            ),
          ),
        ),
      );
}
