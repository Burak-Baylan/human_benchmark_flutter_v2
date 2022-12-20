import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:human_benchmark_flutter_v2/core/extensions/context_extension.dart';
import 'package:human_benchmark_flutter_v2/helpers/colors.dart';
import 'package:human_benchmark_flutter_v2/pages/math/view_model/math_view_model.dart';
import 'package:human_benchmark_flutter_v2/widgets/text/less_futured_text.dart';

import '../../../utils/injection_helper.dart';
import '../../../widgets/app_bar.dart';

class MathView extends StatefulWidget {
  const MathView({super.key});

  @override
  State<MathView> createState() => _MathViewState();
}

class _MathViewState extends State<MathView> {
  MathViewModel mathVm = getit<MathViewModel>();

  @override
  void initState() {
    mathVm.play();
    super.initState();
  }

  @override
  void dispose() {
    unregisterMathViewModel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Observer(
          builder: (context) => CustomAppBar('${mathVm.levelCount}/4'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(height: 50.h),
              Observer(builder: (_) {
                return LessText.lessFuturedText(
                  text: mathVm.problemString,
                  color: MyColors.secondaryColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 35.sp,
                );
              }),
            ],
          ),
          Container(
            height: context.height / 2.5,
            margin: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
            child: Observer(builder: (_) {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        clickWidget(mathVm.results[0]),
                        clickWidget(mathVm.results[1]),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        clickWidget(mathVm.results[2]),
                        clickWidget(mathVm.results[3]),
                      ],
                    ),
                  )
                ],
              );
            }),
          ),
          Container(),
        ],
      ),
    );
  }

  Widget clickWidget(String text) => Expanded(
        child: GestureDetector(
          onTap: () => mathVm.userClicked(text),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.secondaryColor, width: 4),
            ),
            child: LessText.lessFuturedText(
              text: text,
              color: MyColors.secondaryColor,
              fontSize: 25.sp,
            ),
          ),
        ),
      );
}
