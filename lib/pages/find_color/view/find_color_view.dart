import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:human_benchmark_flutter_v2/widgets/app_bar.dart';
import '../../../helpers/colors.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../../sequence_memory/values/const_values.dart';
import '../view_model/find_color_view_model.dart';

class FindColorView extends StatefulWidget {
  FindColorView({Key? key}) : super(key: key);

  @override
  State<FindColorView> createState() => _FindColorViewState();
}

class _FindColorViewState extends State<FindColorView> {
  FindColorViewModel findColorVm = getit<FindColorViewModel>();
  late List<Widget> widgetList = [];

  @override
  void dispose() {
    unregisterFindColorViewModel();
    super.dispose();
  }

  @override
  void initState() {
    findColorVm.play();
    widgetList = List.generate(9, (index) => _buildCard(index));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    findColorVm.play();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Observer(
          builder: (context) => CustomAppBar('${findColorVm.levelCount}/4'),
        ),
      ),
      body: Observer(builder: (_) {
        return AnimatedContainer(
          width: context.width,
          height: context.height,
          duration: Consts.findNumberViewBackgroundDuration,
          color: findColorVm.backgroundColor,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(builder: (_) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 15.w),
                    margin: EdgeInsets.all(20.w),
                    width: double.infinity,
                    color: MyColors.secondaryColor,
                    child: LessText.lessFuturedText(
                      text: findColorVm.randomColorText,
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
          ),
        );
      }),
    );
  }

  Widget _buildCard(int index) {
    return InkWell(
      onTap: () =>
          findColorVm.userClicked(index), //findNumberVm.userClicked(index),
      //onTapDown: (details) => sequenceMemoryVm.cardTapDown(index),
      //onTapUp: (details) => sequenceMemoryVm.cardTapCancel(index),
      //onTapCancel: () => sequenceMemoryVm.cardTapCancel(index),
      child: Observer(builder: (_) {
        return Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: MyColors.secondaryColor, width: 2),
            color: findColorVm.colorList[index],
          ),
          child: Container(),
        );
      }),
    );
  }
}
