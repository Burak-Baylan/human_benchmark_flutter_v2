import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:human_benchmark_flutter_v2/ads/ad_banner.dart';
import 'package:human_benchmark_flutter_v2/ads/ad_ids.dart';
import 'package:human_benchmark_flutter_v2/core/extensions/context_extension.dart';
import 'package:human_benchmark_flutter_v2/helpers/colors.dart';
import 'package:human_benchmark_flutter_v2/pages/fast_fingers/view_model/fast_fingers_view_model.dart';
import 'package:human_benchmark_flutter_v2/widgets/app_bar.dart';
import 'package:human_benchmark_flutter_v2/widgets/default_banner_ad_widget.dart';
import 'package:human_benchmark_flutter_v2/widgets/text/less_futured_text.dart';

import '../../../utils/injection_helper.dart';

class FastFingersView extends StatefulWidget {
  const FastFingersView({super.key});

  @override
  State<FastFingersView> createState() => _FastFingersViewState();
}

class _FastFingersViewState extends State<FastFingersView> {
  FastFingersViewModel fastFingerVm = getit<FastFingersViewModel>();

  @override
  void initState() {
    fastFingerVm.play();
    super.initState();
  }

  @override
  void dispose() {
    fastFingerVm.stopGame();
    unregisterFastFingersViewmodel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar('Fast Fingers'),
      body: SafeArea(
        child: Column(
          children: [
            topWidget,
            clickWidget,
            DefaultBannerAd(adId: 'ca-app-pub-3940256099942544/6300978111'),
          ],
        ),
      ),
    );
  }

  Widget get topWidget => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              height: context.height / 10,
              margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.secondaryColor, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Observer(builder: (_) {
                        return LessText.lessFuturedText(
                          text: 'Clicks: ${fastFingerVm.clickCount}',
                          color: MyColors.secondaryColor,
                        );
                      }),
                    ),
                  ),
                  VerticalDivider(
                    thickness: 2,
                    color: MyColors.secondaryColor,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Observer(builder: (_) {
                        return LessText.lessFuturedText(
                          text: 'Time: ${fastFingerVm.counter}',
                          color: MyColors.secondaryColor,
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget get clickWidget => Expanded(
        child: GestureDetector(
          onTap: () => fastFingerVm.userClicked(),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.secondaryColor, width: 2),
            ),
            child: LessText.lessFuturedText(
              text: 'Click!',
              color: MyColors.secondaryColor,
              fontSize: 50.sp,
            ),
          ),
        ),
      );
}
