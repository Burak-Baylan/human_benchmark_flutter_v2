import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:human_benchmark_flutter_v2/widgets/text/less_futured_text.dart';
import '../../../helpers/colors.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/default_banner_ad_widget.dart';
import '../view_model/aim_trainer_view_model.dart';

class AimTrainerView extends StatefulWidget {
  AimTrainerView({
    super.key,
    this.aimCellCount = 2,
  });

  int aimCellCount;

  @override
  State<AimTrainerView> createState() => _AimTrainerViewState();
}

class _AimTrainerViewState extends State<AimTrainerView> {
  AimTrainerViewModel aimTrainerVm = getit<AimTrainerViewModel>();

  @override
  void initState() {
    aimTrainerVm.setContext(context);
    aimTrainerVm.ballCount = widget.aimCellCount;
    super.initState();
  }

  @override
  void dispose() {
    unregisterAimTrainerViewModel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Observer(
          builder: (context) => CustomAppBar('${aimTrainerVm.levelCount}/4'),
        ),
      ),
      body: GestureDetector(
        onTap: () => aimTrainerVm.userClickedBall(0, true),
        child: Observer(builder: (_) {
          return AnimatedContainer(
            color: aimTrainerVm.backgroundColor,
            duration: const Duration(milliseconds: 200),
            height: context.height,
            width: context.width,
            child: Observer(builder: (_) {
              return Stack(
                children: <Widget>[
                      aimCellCountCountChangerWidgetSkeleton,
                      playbutton(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: DefaultBannerAd(
                            adId: 'ca-app-pub-3940256099942544/6300978111'),
                      ),
                    ] +
                    aimTrainerVm.ballWidgetsList,
              );
            }),
          );
        }),
      ),
    );
  }

  Widget get aimCellCountCountChangerWidgetSkeleton =>
      Observer(builder: (context) {
        return aimTrainerVm.isFirstLevel
            ? Container(
                margin: EdgeInsets.only(top: 25.h),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: aimCellCountCountChangerWidget,
                ),
              )
            : Container();
      });

  Widget get aimCellCountCountChangerWidget => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          LessText.lessFuturedText(
            text: 'Aim Cell Count',
            color: MyColors.secondaryColor,
            fontWeight: FontWeight.w600,
          ),
          IconButton(
            onPressed: () => aimTrainerVm.decreaseBallCount(),
            icon: Icon(
              Icons.horizontal_rule_rounded,
              size: 15.sp,
              color: MyColors.secondaryColor,
            ),
          ),
          SizedBox(width: 2.w),
          Observer(builder: (_) {
            return LessText.lessFuturedText(
              text: aimTrainerVm.ballCount.toString(),
              color: MyColors.secondaryColor,
              fontWeight: FontWeight.w600,
            );
          }),
          SizedBox(width: 2.w),
          IconButton(
            onPressed: () => aimTrainerVm.incrementBallCount(),
            icon: Icon(
              Icons.add,
              size: 15.sp,
              color: MyColors.secondaryColor,
            ),
          ),
        ],
      );

  Widget playbutton() {
    return Observer(
      builder: (_) => aimTrainerVm.isPlayButtonVisible
          ? Container(
              margin: EdgeInsets.only(bottom: 20.h + 50),
              child: SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () => aimTrainerVm.play(),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(1500)),
                      child: Container(
                        width: 100.w,
                        height: 100.w,
                        color: MyColors.secondaryColor,
                        child: Center(
                          child: LessText.lessFuturedText(
                            text: 'Play',
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                            fontSize: 25.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Container(),
    );
  }
}
