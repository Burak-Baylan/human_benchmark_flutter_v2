import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../ads/ad_ids.dart';
import '../../../helpers/colors.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/default_banner_ad_widget.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../view_model/colored_text_view_model.dart';

class ColoredTextView extends StatefulWidget {
  const ColoredTextView({super.key});

  @override
  State<ColoredTextView> createState() => _ColoredTextViewState();
}

class _ColoredTextViewState extends State<ColoredTextView> {
  ColoredTextViewModel coloredTextVm = getit<ColoredTextViewModel>();

  @override
  void initState() {
    coloredTextVm.play();
    super.initState();
  }

  @override
  void dispose() {
    unregisterColoredTextViewModel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Observer(
          builder: (context) => CustomAppBar('${coloredTextVm.levelCount}/4'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 25.h),
          Observer(builder: (_) {
            return LessText.lessFuturedText(
              text: coloredTextVm.changingText,
              fontWeight: FontWeight.w800,
              color: coloredTextVm.changingColor,
              fontSize: 30.sp,
            );
          }),
          SizedBox(height: 25.h),
          Expanded(
            child: GestureDetector(
              onTap: () => coloredTextVm.userClicked(),
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
          ),
          DefaultBannerAd(adId: AddIds.coloredTextBanner),
        ],
      ),
    );
  }
}
