import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../helpers/colors.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/default_banner_ad_widget.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../../sequence_memory/values/const_values.dart';
import '../view_model/find_number_view_model.dart';

class FindNumberView extends StatefulWidget {
  FindNumberView({Key? key}) : super(key: key);

  @override
  State<FindNumberView> createState() => _FindNumberViewState();
}

class _FindNumberViewState extends State<FindNumberView> {
  FindNumberViewModel findNumberVm = getit<FindNumberViewModel>();
  late List<Widget> widgetList = [];

  @override
  void dispose() {
    unregisterFindNumberViewmodel();
    super.dispose();
  }

  @override
  void initState() {
    widgetList = List.generate(9, (index) => _buildCard(index));
    findNumberVm.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Observer(
          builder: (context) => CustomAppBar('${findNumberVm.levelCount}/4'),
        ),
      ),
      body: Observer(builder: (_) {
        return AnimatedContainer(
          width: context.width,
          height: context.height,
          duration: Consts.findNumberViewBackgroundDuration,
          color: findNumberVm.backgroundColor,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Observer(builder: (_) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 15.w),
                        margin: EdgeInsets.all(20.w),
                        width: double.infinity,
                        color: MyColors.secondaryColor,
                        child: LessText.lessFuturedText(
                          text: findNumberVm.randomNumberText,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      );
                    }),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: widgetList,
                      ),
                    ),
                    SizedBox(height: 50.h),
                  ],
                ),
                DefaultBannerAd(adId: 'ca-app-pub-3940256099942544/6300978111'),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildCard(int index) {
    return InkWell(
      onTap: () => findNumberVm.userClicked(index),
      //onTapDown: (details) => sequenceMemoryVm.cardTapDown(index),
      //onTapUp: (details) => sequenceMemoryVm.cardTapCancel(index),
      //onTapCancel: () => sequenceMemoryVm.cardTapCancel(index),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          border: Border.all(color: MyColors.secondaryColor, width: 2),
        ),
        child: Center(
          child: Observer(builder: (_) {
            return LessText.lessFuturedText(
              text: '${findNumberVm.numberList[index]}',
              color: MyColors.secondaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            );
          }),
        ),
      ),
    );
  }
}
