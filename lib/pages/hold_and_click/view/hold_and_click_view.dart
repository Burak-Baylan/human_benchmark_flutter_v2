import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:human_benchmark_flutter_v2/pages/hold_and_click/view_model/hold_and_click_view_model.dart';

import '../../../helpers/colors.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/text/less_futured_text.dart';

class HoldAndClickView extends StatefulWidget {
  const HoldAndClickView({super.key});

  @override
  State<HoldAndClickView> createState() => _HoldAndClickViewState();
}

class _HoldAndClickViewState extends State<HoldAndClickView> {
  HoldAndClickViewModel holdAndClickVm = getit<HoldAndClickViewModel>();

  @override
  void dispose() {
    unregisterHoldAndClickViewModel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Observer(
          builder: (context) => CustomAppBar('${holdAndClickVm.levelCount}/4'),
        ),
      ),
      body: Observer(builder: (_) {
        return AnimatedContainer(
          color: holdAndClickVm.backgroundColor,
          duration: const Duration(milliseconds: 200),
          height: context.height,
          width: context.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 35.h),
                child: MasonryGridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) => createSquare(index),
                ),
              ),
              createHoldFingerButton(),
            ],
          ),
        );
      }),
    );
  }

  Widget answerWidget(int index) => Observer(builder: (context) {
        bool isEqueal = holdAndClickVm.coloredBoxIndex == index;
        return Container(
          alignment: Alignment.center,
          height: 90.h,
          margin: EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w),
          decoration: BoxDecoration(
            color: isEqueal ? MyColors.secondaryColor : Colors.white,
            border: Border.all(
              color: MyColors.secondaryColor,
              width: 4,
            ),
          ),
        );
      });

  Widget createSquare(int index) {
    return GestureDetector(
      onTap: () => holdAndClickVm.userClicked(index),
      child: Builder(builder: (context) => answerWidget(index)),
    );
  }

  Widget createHoldFingerButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 55.h),
      width: context.width / 3,
      height: context.width / 3,
      child: GestureDetector(
        onTapDown: (details) => holdAndClickVm.play(UserHoldState.FINGER_DOWN),
        onTapUp: (details) => holdAndClickVm.play(UserHoldState.FINGER_UP),
        child: Observer(builder: (context) {
          return Container(
            alignment: Alignment.center,
            height: 90.h,
            margin: EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w),
            decoration: BoxDecoration(
              color: holdAndClickVm.fingerHolding
                  ? MyColors.secondaryColor
                  : Colors.white,
              border: Border.all(color: MyColors.secondaryColor, width: 6),
            ),
            child: LessText.lessFuturedText(
              text: 'Hold Finger',
              color: holdAndClickVm.fingerHolding
                  ? Colors.white
                  : MyColors.secondaryColor,
              fontSize: 25.sp,
            ),
          );
        }),
      ),
    );
  }
}
