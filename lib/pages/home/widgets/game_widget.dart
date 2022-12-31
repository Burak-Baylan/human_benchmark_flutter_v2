import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../helpers/colors.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../../history_page/view/history_view.dart';
import '../home_page.dart';

class GamesWidget extends StatelessWidget {
  GamesWidget({Key? key, required this.model}) : super(key: key);

  HomePageGameWidgetModel model;

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
                        onPressed: () => Get.to(
                          HistoryView(
                            historyBoxName: model.boxName,
                            name: model.name,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LessText.lessFuturedText(
                      text: 'PR: ',
                      color: MyColors.secondaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                    ),
                    LessText.lessFuturedText(
                      text: '360ms',
                      color: MyColors.secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
