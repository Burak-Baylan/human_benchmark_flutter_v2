import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helpers/colors.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../view_model/history_view_model.dart';

class HistoryView extends StatefulWidget {
  HistoryView({
    super.key,
    required this.name,
    required this.historyBoxName,
  });

  String name;
  String historyBoxName;

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  HistoryViewModel historyVm = getit<HistoryViewModel>();

  @override
  void initState() {
    historyVm.setHistoryBoxName(widget.historyBoxName);
    historyVm.getHistory();
    super.initState();
  }

  Future get historyFuture => historyVm.getHistory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(widget.name),
      body: FutureBuilder(
        future: historyFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (historyVm.history.isEmpty) {
            return Center(
              child: LessText.lessFuturedText(
                text: 'NO HISTORY AVAILABLE',
                color: MyColors.secondaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w300,
              ),
            );
          }
          return ListView.separated(
            itemCount: historyVm.history.length,
            separatorBuilder: (context, i) {
              return Divider(
                color: Colors.grey.shade300,
                thickness: 0,
                indent: 15.w,
                endIndent: 15.w,
              );
            },
            itemBuilder: (context, i) {
              var model = historyVm.history[i];
              return historyCard(model, i);
            },
          );
        },
      ),
    );
  }

  Widget historyCard(HistoryModel model, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 10.w),
                  LessText.lessFuturedText(
                    text: '${index + 1}.',
                    color: MyColors.secondaryColor,
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LessText.lessFuturedText(
                          text: model.text,
                          color: MyColors.secondaryColor,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10.h),
                        LessText.lessFuturedText(
                          text: model.date,
                          color: MyColors.secondaryColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 15.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 5.w),
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () async {
                    await historyVm.delete(index);
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.w),
                    child: Icon(
                      Icons.delete_rounded,
                      color: MyColors.secondaryColor,
                      size: 25.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryModel {
  String text;
  String date;
  HistoryModel({required this.text, required this.date});
}
