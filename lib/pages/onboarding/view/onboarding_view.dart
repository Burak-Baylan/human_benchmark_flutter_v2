import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:human_benchmark_flutter_v2/core/app_constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../helpers/colors.dart';
import '../../../main.dart';
import '../../../utils/injection_helper.dart';
import '../../../utils/purchase_helper.dart';
import '../../../widgets/loading_wrapper.dart';
import '../../../widgets/onboarding/onboarding_button.dart';
import '../../../widgets/onboarding/onboarding_content.dart';
import '../../home/home_page.dart';
import '../../onboarding_paywall/view_model/onboarding_paywall_view_model.dart';
import '../../paywall/view_model/paywall_view_model.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final pageController = PageController();

  PaywallViewModel paywallVm = getit<PaywallViewModel>();

  bool openText = false;
  ScrollPhysics? pageViewPhysics;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Observer(builder: (context) {
          return LoadingWrapper(
            isLoading: paywallVm.isLoading,
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: PageView(
                    physics: pageViewPhysics,
                    controller: pageController,
                    children: [
                      OnboardingContent(
                        title: 'Specially Designed Games',
                        subtitle:
                            '${AppConstants.APP_NAME} app tests your reflexes, hand-eye cooridation and memory with dozens of specially designed games.',
                        imageAsset: 'assets/lotties/gear_lottie.json',
                        deviceWidth: constraints.maxWidth,
                        pageController: pageController,
                        isOnboardingPaywall: false,
                        with3Image: false,
                      ),
                      OnboardingContent(
                        title: 'Work Smart Not Hard',
                        subtitle:
                            'Repeating the exercises daily will have a positive effect on your process.',
                        imageAsset: 'assets/lotties/brain_lottie.json',
                        deviceWidth: constraints.maxWidth,
                        pageController: pageController,
                        isOnboardingPaywall: false,
                        with3Image: false,
                      ),
                      OnboardingContent(
                        title: 'Fastest',
                        subtitle:
                            'Leave your old speed behind! Improve your memory and add positive impact to real life with ${AppConstants.APP_NAME}!',
                        imageAsset: 'assets/lotties/speed_lottie.json',
                        deviceWidth: constraints.maxWidth,
                        pageController: pageController,
                        isOnboardingPaywall: false,
                        with3Image: false,
                      ),
                      OnboardingContent(
                        title: 'Gifts!',
                        subtitle:
                            'At the end of each game, you win one of them depending on your success.',
                        imageAsset: '',
                        deviceWidth: constraints.maxWidth,
                        pageController: pageController,
                        isOnboardingPaywall: false,
                        with3Image: true,
                      ),
                      OnboardingContent(
                        title: '',
                        subtitle: '',
                        imageAsset: '',
                        deviceWidth: constraints.maxWidth,
                        pageController: pageController,
                        isOnboardingPaywall: true,
                        with3Image: false,
                      ),
                    ],
                    onPageChanged: (index) {
                      setState(() {
                        if (index == 4) {
                          openText = true;
                          pageViewPhysics =
                              const NeverScrollableScrollPhysics();
                          return;
                        }
                        openText = false;
                      });
                    },
                  ),
                ),

                // Next Button
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          OnboardingButton(
                            onTap: () async {
                              if (pageController.page == 4) {
                                //await GetStorageHelper.shared
                                //    .write(key: AppKeys.seenOnboard, value: true);
                                setState(() {
                                  openText = false;
                                  pageViewPhysics =
                                      const NeverScrollableScrollPhysics();
                                  openText = true;
                                });

                                print('A964836 purchasing');
                                var isPurchased = await paywallVm
                                    .purcaseForOnboardingPaywall();
                                print('A964836 purchase done');
                                if (!isPurchased) return;
                                print('A964836 purchased');
                                getit<OnboardingPaywallViewModel>()
                                    .writeSeenOnboard();
                                Get.offAll(HomePage());
                                print('A964836 gone');
                                //mainVm.seenOnboard = true;

                                mainVm.onboardJustCompleted = true;
                              } else {
                                pageController.nextPage(
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.linear,
                                );
                              }
                            },
                          ),
                          SizedBox(height: 10.w),
                          FittedBox(
                            child: openText ? yearlyPriceText : pageIndicator,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          );
        }),
      );
    });
  }

  Widget get yearlyPriceText => Container(
        margin: EdgeInsets.symmetric(horizontal: 60.w),
        child: Text(
          '${PurchaseHelper.shared.getWeeklyPrice}/week, cancel anytime.',
          style: TextStyle(
            fontSize: context.isIpad ? 11.sp : 13.sp,
            color: MyColors.onboardingViewSubtitleColor,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      );

  Widget get pageIndicator => SmoothPageIndicator(
        count: 5,
        controller: pageController,
        effect: WormEffect(
          paintStyle: PaintingStyle.fill,
          strokeWidth: 1.5,
          dotColor: Colors.grey,
          activeDotColor: MyColors.onboardingViewSubtitleColor,
        ),
      );
}
