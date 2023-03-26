import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:human_benchmark_flutter_v2/widgets/app_bar.dart';

import '../../../ads/ad_ids.dart';
import '../../../helpers/colors.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/default_banner_ad_widget.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../view_model/color_cell_count_view_model.dart';

class ColorCellCountView extends StatefulWidget {
  const ColorCellCountView({super.key});

  @override
  State<ColorCellCountView> createState() => _ColorCellCountViewState();
}

class _ColorCellCountViewState extends State<ColorCellCountView> {
  ColorCellCountViewModel colorCellCountVm = getit<ColorCellCountViewModel>();

  @override
  void initState() {
    colorCellCountVm.play();
    super.initState();
  }

  @override
  void dispose() {
    unregisterColorCellCountViewModel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Observer(
          builder: (context) =>
              CustomAppBar('${colorCellCountVm.levelCount}/4'),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Observer(builder: (_) {
            return AnimatedContainer(
              color: colorCellCountVm.backgroundColor,
              duration: const Duration(milliseconds: 200),
              height: context.height,
              width: context.width,
            );
          }),
          Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MasonryGridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      itemCount: 16,
                      itemBuilder: (context, index) {
                        return clickWidget(index);
                      },
                    ),
                    MasonryGridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) => answerWidget(index),
                    ),
                    SizedBox(height: 50.h),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: DefaultBannerAd(adId: AddIds.colorCellCountBanner),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget answerWidget(int index) => GestureDetector(
        onTap: () => colorCellCountVm.userClicked(index),
        child: Container(
          alignment: Alignment.center,
          height: 90.h,
          margin: EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w),
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.secondaryColor, width: 2),
          ),
          child: Observer(builder: (_) {
            return LessText.lessFuturedText(
              text: colorCellCountVm.answers[index].toString(),
              color: MyColors.secondaryColor,
              fontSize: 25.sp,
            );
          }),
        ),
      );

  Widget clickWidget(int index) => Observer(builder: (_) {
        return Container(
          alignment: Alignment.center,
          height: 90.h,
          margin: EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w),
          decoration: BoxDecoration(
            color: colorCellCountVm.colorList[index],
            border: Border.all(color: MyColors.secondaryColor, width: 2),
          ),
          child: LessText.lessFuturedText(
            text: '',
            color: MyColors.secondaryColor,
            fontSize: 25.sp,
          ),
        );
      });
}
