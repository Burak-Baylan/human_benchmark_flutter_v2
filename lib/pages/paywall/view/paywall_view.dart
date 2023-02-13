import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/route_manager.dart';
import 'package:human_benchmark_flutter_v2/pages/paywall/view/widgets/buy_widget.dart';
import 'package:human_benchmark_flutter_v2/pages/paywall/view/widgets/plan_widget.dart';
import 'package:human_benchmark_flutter_v2/pages/paywall/view_model/paywall_view_model.dart';
import 'package:human_benchmark_flutter_v2/utils/purchase_helper.dart';
import 'package:human_benchmark_flutter_v2/widgets/loading_wrapper.dart';
import 'package:lottie/lottie.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import '../../../helpers/alert_helper.dart';
import '../../../helpers/colors.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/text/less_futured_text.dart';
import 'widgets/open_by_premium_card.dart';

class PaywallView extends StatefulWidget {
  const PaywallView({super.key});

  @override
  State<PaywallView> createState() => _PaywallViewState();
}

class _PaywallViewState extends State<PaywallView> {
  PaywallViewModel paywallVm = getit<PaywallViewModel>();

  Color mainColor = const Color(0xff14C38E);

  int selectedCard = 0;
  int _currentListIndex = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  bool isEnd = false;

  bool get isIpad => context.height > 950;

  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentListIndex == 2) {
        isEnd = true;
      } else if (_currentListIndex == 0) {
        isEnd = false;
      }
      if (isEnd == false) {
        _currentListIndex++;
      } else {
        _currentListIndex--;
      }
      _pageController.animateToPage(
        _currentListIndex,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Observer(builder: (_) {
        return LoadingWrapper(
          isLoading: paywallVm.isLoading,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.w),
                        child: Align(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Lottie.asset(
                                'assets/lotties/premium_text_lottie.json',
                                width: context.width / 3),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.all(10.w),
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            borderRadius: BorderRadius.circular(99999),
                            child: const Icon(
                              Icons.close_rounded,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70.h),
                  const OpenByPremiumCard(),
                  SizedBox(height: 35.h),
                  ratingsWidget(),
                  plansroW(),
                  buyWidget,
                  SizedBox(height: 20.h),
                  restoreText(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget restoreText() {
    return InkWell(
      onTap: () {},
      child: LessText.lessFuturedText(
        text: 'Restore',
        textAlign: TextAlign.center,
        color: MyColors.secondaryColor,
        fontSize: isIpad ? context.width / 27 : context.width / 24,
        fontWeight: FontWeight.w200,
      ),
    );
  }

  Widget ratingsWidget() {
    return SizedBox(
      height: isIpad ? context.height * 0.165 : context.height * 0.145,
      child: PageView(
        controller: _pageController,
        children: [rateWidget1(), rateWidget2(), rateWidget3()],
      ),
    );
  }

  Widget rateWidget1() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        starsWidget(false),
        SizedBox(height: context.height * 0.015),
        rateText(
          '“This app is phenomenal, these games are really specially designed and I really feel the effects in my real life.”',
        ),
      ],
    );
  }

  Widget rateWidget2() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        starsWidget(true),
        SizedBox(height: context.height * 0.015),
        rateText(
          '“There are very nice games in the app, I can feel the improvement in my reflexes.“',
        ),
      ],
    );
  }

  Widget rateWidget3() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        starsWidget(false),
        SizedBox(height: context.height * 0.015),
        rateText(
          '“I can feel the improvement in my hand-eye coordination and memory!“',
        ),
      ],
    );
  }

  Widget starsWidget(bool isHalf) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        starWidget(),
        starWidget(),
        starWidget(),
        starWidget(),
        starWidget(half: isHalf)
      ],
    );
  }

  Widget rateText(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.01),
      child: LessText.lessFuturedText(
        text: text,
        textAlign: TextAlign.center,
        color: MyColors.secondaryColor,
        fontSize: isIpad ? context.width / 27 : context.width / 24,
        fontWeight: FontWeight.w300,
        isItalic: true,
      ),
    );
  }

  Widget starWidget({bool half = false}) {
    return Icon(
      half ? Icons.star_half : Icons.star_rate_rounded,
      color: mainColor,
      size: context.width * 0.055,
    );
  }

  Widget plansroW() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PlanWidget(
            onPressed: () {
              selectedCard = 0;
              setState(() {});
            },
            title: 'Yearly',
            price: PurchaseHelper.shared.getYearlyPrice,
            perMonthText:
                '${PurchaseHelper.shared.getWeeklyPriceForYearly}\nper week',
            openSaleCard: true,
            isSelected: selectedCard == 0,
            saleCardText:
                'Save %${PurchaseHelper.shared.get12MonthsDiscountForYearly}',
          ),
          SizedBox(width: 10.w),
          PlanWidget(
            onPressed: () {
              selectedCard = 1;
              setState(() {});
            },
            title: 'Weekly',
            price: PurchaseHelper.shared.getWeeklyPrice,
            perMonthText: '${PurchaseHelper.shared.getWeeklyPrice}\nper week',
            isSelected: selectedCard == 1,
            openSaleCard: false,
          ),
        ],
      ),
    );
  }

  //TODO: See your games history

  Widget get buyWidget => BuyWidget(
        onPressed: () async {
          try {
            var packageToBuy = selectedCard == 0
                ? PurchaseHelper.shared.yearly
                : PurchaseHelper.shared.weekly;
            await purchase(packageToBuy!);
          } catch (e) {
            AlertHelper.shared.showCupertinoAlertDialog(
              context: context,
              title: 'Something went wrong!',
            );
          }
        },
      );

  Future<void> purchase(Package package) async {
    paywallVm.isLoading = true;
    try {
      var isPurchased = await PurchaseHelper.shared.purchase(package);
      if (isPurchased) {
        Get.back();
      }
      paywallVm.isLoading = false;
    } catch (e) {
      paywallVm.isLoading = false;
    }
  }
}
