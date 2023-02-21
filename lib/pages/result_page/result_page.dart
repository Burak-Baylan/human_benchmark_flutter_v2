import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';
import '../../core/extensions/context_extension.dart';
import '../../helpers/colors.dart';
import '../../utils/injection_helper.dart';
import '../../widgets/button/custom_button_with_border.dart';
import '../../widgets/text/less_futured_text.dart';
import 'view_model/result_page_view_model.dart';

class ResultPage extends StatefulWidget {
  ResultPage({
    Key? key,
    required this.title,
    required this.exp,
    required this.message,
    required this.tryAgainPressed,
    required this.gameIndex,
    this.showBadge = false,
    this.showConfetti = false,
  }) : super(key: key);

  bool showBadge;
  bool showConfetti;
  String title;
  String exp;
  String message;
  Function tryAgainPressed;
  int gameIndex = 0;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late ResultPageViewModel resultPageVm;

  @override
  void initState() {
    super.initState();
    registerResultPageViewModel();
    resultPageVm = getit<ResultPageViewModel>();
    resultPageVm.startPage(widget.showBadge, widget.showConfetti);
    resultPageVm.openNextLevel(widget.gameIndex);
  }

  @override
  void dispose() {
    unregisterResultPageViewModel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.close_rounded,
            size: 30.sp,
            color: MyColors.secondaryColor,
          ),
        ),
        title: LessText.lessFuturedText(
          text: 'Result',
          color: MyColors.secondaryColor,
          fontSize: 25.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [textColumn, buttonsRow],
            ),
          ),
          congratsWidget,
        ],
      ),
    );
  }

  Widget get textColumn {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        resultPageVm.showingItem == 1 || resultPageVm.showingItem == 0
            ? SizedBox(
                width: context.width / 4,
                child: Observer(builder: (_) {
                  return Lottie.asset(
                    resultPageVm.showingItem == 0
                        ? 'assets/lotties/confetti.json'
                        : 'assets/lotties/congratulation_badge.json',
                  );
                }),
              )
            : SizedBox(
                width: context.width / 4,
                child: Observer(builder: (_) {
                  return Lottie.asset(
                    'assets/lotties/normal_lottie.json',
                  );
                }),
              ),
        SizedBox(height: 20.h),
        Container(
          padding: EdgeInsets.all(15.w),
          width: context.width / 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: MyColors.secondaryColor,
              width: 2,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    LessText.lessFuturedText(
                      text: widget.title,
                      color: MyColors.secondaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    SizedBox(height: 15.h),
                    LessText.lessFuturedText(
                      text: widget.exp,
                      color: MyColors.secondaryColor,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget get buttonsRow {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 10.w),
        CustomButtonWithBorder(
          onPressed: () => Get.back(),
          text: 'Go to Home',
          size: Size(context.width / 2 - 20.w, context.height / 17),
          leading: Icon(
            Icons.home,
            size: 25.sp,
            color: MyColors.secondaryColor,
          ),
        ),
        SizedBox(width: 10.w),
        CustomButtonWithBorder(
          onPressed: () {
            registerResultPageViewModel();
            Get.back();
            widget.tryAgainPressed();
          },
          text: 'Try Again',
          size: Size(context.width / 2 - 20.w, context.height / 17),
          leading: Icon(
            Icons.restart_alt,
            size: 25.sp,
            color: MyColors.secondaryColor,
          ),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }

  Widget get congratsWidget {
    return Observer(builder: (_) {
      return resultPageVm.showCongratsWidget
          ? Container(
              width: context.width,
              height: context.height,
              color: Colors.black.withOpacity(.5),
              child: Center(
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 150.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Observer(builder: (_) {
                              return Lottie.asset(
                                resultPageVm.lottieFileText,
                                width: context.width / 2,
                              );
                            }),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 15.w, right: 15.w, top: 20.h),
                              child: Observer(builder: (_) {
                                return LessText.lessFuturedText(
                                  text: resultPageVm.congratsText,
                                  color: Colors.white,
                                  fontSize: 25.sp,
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 100.h),
                        child: CustomButtonWithBorder(
                          onPressed: () => resultPageVm.closeCongratsWidget(),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Observer(builder: (_) {
                                  return LessText.lessFuturedText(
                                    text: resultPageVm.counterForCongratsWidget
                                        .toString(),
                                    color: MyColors.secondaryColor,
                                    fontSize: 20.sp,
                                  );
                                }),
                              ),
                              Center(
                                child: LessText.lessFuturedText(
                                  text: 'Skip',
                                  color: MyColors.secondaryColor,
                                  fontSize: 20.sp,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.navigate_next_rounded,
                                  color: MyColors.secondaryColor,
                                  size: context.width / 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : Container();
    });
  }
}
