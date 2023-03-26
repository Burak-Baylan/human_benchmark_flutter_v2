import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../ads/ad_ids.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../helpers/colors.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/default_banner_ad_widget.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../view_model/count_by_one_by_view_model.dart';

class CountOneByOneView extends StatefulWidget {
  const CountOneByOneView({super.key});

  @override
  State<CountOneByOneView> createState() => _CountOneByOneViewState();
}

class _CountOneByOneViewState extends State<CountOneByOneView> {
  CountOneByOneViewModel oneByOneVm = getit<CountOneByOneViewModel>();

  @override
  void initState() {
    oneByOneVm.play();
    super.initState();
  }

  @override
  void dispose() {
    unregisterCountOneByOneViewModel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Observer(
          builder: (context) => CustomAppBar('1/1'),
        ),
      ),
      body: Observer(builder: (_) {
        return Stack(
          children: [
            Observer(builder: (_) {
              return AnimatedContainer(
                color: oneByOneVm.backgroundColor,
                duration: const Duration(milliseconds: 100),
                height: context.height,
                width: context.width,
              );
            }),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 90,
                  margin: EdgeInsets.only(top: 20.h),
                  width: context.width / 2,
                  child: titleText,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  child: MasonryGridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    itemCount: 16,
                    itemBuilder: (context, index) {
                      return clickWidget(oneByOneVm.getNumber().toString());
                    },
                  ),
                ),
                DefaultBannerAd(adId: AddIds.countOneByOnebanner),
              ],
            ),
          ],
        );
      }),
    );
  }

  Widget get titleText => Container(
        alignment: Alignment.center,
        height: 90.h,
        margin: EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w),
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.secondaryColor, width: 4),
        ),
        child: Observer(builder: (_) {
          return LessText.lessFuturedText(
            text: 'Find ${oneByOneVm.levelCount}',
            color: MyColors.secondaryColor,
            fontSize: 25.sp,
          );
        }),
      );

  Widget clickWidget(String text) => GestureDetector(
        onTap: () => oneByOneVm.userClick(text),
        child: Container(
          alignment: Alignment.center,
          height: 90.h,
          margin: EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w),
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.secondaryColor, width: 2),
          ),
          child: LessText.lessFuturedText(
            text: text,
            color: MyColors.secondaryColor,
            fontSize: 25.sp,
          ),
        ),
      );
}
