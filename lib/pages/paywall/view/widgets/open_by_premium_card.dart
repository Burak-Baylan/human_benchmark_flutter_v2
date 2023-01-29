import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:human_benchmark_flutter_v2/core/extensions/context_extension.dart';
import 'package:lottie/lottie.dart';
import 'open_by_premium_widget.dart';

class OpenByPremiumCard extends StatelessWidget {
  const OpenByPremiumCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: context.getWidth(0.8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xff14C38E),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: context.getWidth(0.05),
            vertical: context.getHeight(0.025),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OpenByPremiumWidget(
                    text:
                        'Access to all games', //LocaleKeys.unlimited_conversion.tr(),
                    icon:
                        'assets/svg/game_svg.svg', //"assets/images/unlimited.svg",
                  ),
                  SizedBox(height: context.getHeight(0.022)),
                  OpenByPremiumWidget(
                    text: 'No Ads', //LocaleKeys.no_ads.tr(),
                    icon:
                        'assets/svg/no_ads_image.svg', //"assets/images/ads.svg",
                    smallIcon: true,
                  ),
                  SizedBox(height: context.getHeight(0.022)),
                  OpenByPremiumWidget(
                    text:
                        'Fully Personalized Game', //LocaleKeys.convert_pdf_and_other.tr(),
                    icon:
                        'assets/svg/statistics_svg.svg', //"assets/images/convert.svg",
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
