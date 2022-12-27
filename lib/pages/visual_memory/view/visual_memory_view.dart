import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import '../../../helpers/colors.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/default_banner_ad_widget.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../view_model/visual_memory_view_model.dart';

class VisualMemoryView extends StatefulWidget {
  const VisualMemoryView({super.key});

  @override
  State<VisualMemoryView> createState() => _VisualMemoryViewState();
}

class _VisualMemoryViewState extends State<VisualMemoryView> {
  VisualMemoryViewModel visualMemoryVm = getit<VisualMemoryViewModel>();

  @override
  void initState() {
    visualMemoryVm.play();
    super.initState();
  }

  @override
  void dispose() {
    unregisterVisualMemoryViewModel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Observer(
          builder: (context) => CustomAppBar('${visualMemoryVm.levelCount}/4'),
        ),
      ),
      body: Stack(
        children: [
          Observer(builder: (_) {
            return AnimatedContainer(
              color: visualMemoryVm.backgroundColor,
              duration: const Duration(milliseconds: 200),
              height: context.height,
              width: context.width,
              margin: EdgeInsets.only(bottom: 50.h),
              child: Center(
                child: MasonryGridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  itemCount: 16,
                  itemBuilder: (context, index) => clickWidget(index),
                ),
              ),
            );
          }),
          Observer(builder: (context) {
            return visualMemoryVm.isNextRoundTextOpen
                ? Container(
                    width: context.width,
                    height: context.height,
                    color: MyColors.secondaryColor.withOpacity(.6),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.next_plan_outlined,
                            size: 45.sp,
                            color: Colors.white,
                          ),
                          SizedBox(height: 25.h),
                          LessText.lessFuturedText(
                            text: 'NEXT ROUND',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40.sp,
                          ),
                        ],
                      ),
                    ),
                  )
                : Container();
          }),
          Align(
            alignment: Alignment.bottomCenter,
            child:
                DefaultBannerAd(adId: 'ca-app-pub-3940256099942544/6300978111'),
          ),
        ],
      ),
    );
  }

  Widget clickWidget(int index) => Observer(builder: (_) {
        return GestureDetector(
          onTap: () => visualMemoryVm.userClicked(index),
          child: Container(
            margin: EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w),
            child: Stack(
              alignment: Alignment.center,
              children: [
                visualMemoryVm.dotsLocations.contains(index)
                    ? Center(
                        child: Container(
                          width: context.width / 50,
                          height: context.width / 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1500),
                            color: Colors.redAccent,
                          ),
                        ),
                      )
                    : Container(),
                Container(
                  alignment: Alignment.center,
                  height: 90.h,
                  decoration: BoxDecoration(
                    color: visualMemoryVm.openedBoxes.contains(index)
                        ? Colors.transparent
                        : MyColors.secondaryColor,
                    border:
                        Border.all(color: MyColors.secondaryColor, width: 2),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
