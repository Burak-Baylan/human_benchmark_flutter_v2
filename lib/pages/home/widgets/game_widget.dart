import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:human_benchmark_flutter_v2/pages/paywall/view/paywall_view.dart';
import '../../../core/hive/hive_manager.dart';
import '../../../helpers/colors.dart';
import '../../../main.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../../history_page/view/history_view.dart';
import '../home_page.dart';

class GamesWidget extends StatelessWidget {
  GamesWidget({
    Key? key,
    required this.index,
    required this.model,
  }) : super(key: key);

  HomePageGameWidgetModel model;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          side: BorderSide(color: MyColors.secondaryColor, width: 3),
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        onPressed: () {
          if (!mainVm.unlockedGames.contains(index) && !mainVm.isPremium) {
            mainVm.showUnlockOrBuyDiaog(index);
            return;
          }
          model.onPressed();
          Get.to(model.route);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 9,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: LessText.lessFuturedText(
                              text: '${model.gameNumber}.',
                              color: MyColors.secondaryColor,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w400,
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: Container(
                            child: LessText.lessFuturedText(
                              text: model.name,
                              color: MyColors.secondaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 17.sp,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 5.w),
                      child: IconButton(
                        icon: Icon(
                          Icons.history_rounded,
                          color: MyColors.secondaryColor,
                          size: 23.sp,
                        ),
                        onPressed: () {
                          Get.to(PaywallView());
                          return;
                          if (!mainVm.isPremium) {
                            mainVm.sendToPaywall();
                            return;
                          }
                          Get.to(
                            HistoryView(
                              historyBoxName: model.boxName,
                              name: model.name,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LessText.lessFuturedText(
                          text: 'PR: ',
                          color: MyColors.onboardingViewTitleColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                        ),
                        FutureBuilder<String>(
                          future: getHighScore,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return getPrWidget(snapshot.data.toString());
                            }
                            return LessText.lessFuturedText(
                              text: '??',
                              color: MyColors.onboardingViewTitleColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Observer(builder: (context) {
                    return mainVm.isPremium
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.workspace_premium_outlined,
                              color: MyColors.myYellow,
                              size: 25.sp,
                            ),
                          )
                        : mainVm.unlockedGames.contains(index)
                            ? Container()
                            : Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.lock_outline,
                                  color: MyColors.secondaryColor,
                                  size: 25.sp,
                                ),
                              );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getPrWidget(String data) {
    String str;
    switch (model.prTextEnum) {
      case GameWidgetPrTextEnum.MS:
        str = '$data ms';
        break;
      case GameWidgetPrTextEnum.LEVEL:
        str = 'Level: $data';
        break;
      case GameWidgetPrTextEnum.CLICK_COUNT:
        str = 'Clicked $data times';
        break;
    }
    return LessText.lessFuturedText(
      text: str,
      color: MyColors.onboardingViewTitleColor,
      fontWeight: FontWeight.w600,
      fontSize: 15.sp,
    );
  }

  Future<String> get getHighScore async {
    var highScore = await HiveManager.getData<int?>(
      model.highScoreBoxName,
      'high_score',
    );
    return highScore == null ? '??' : highScore.toString();
  }
}

enum GameWidgetPrTextEnum { MS, LEVEL, CLICK_COUNT }
