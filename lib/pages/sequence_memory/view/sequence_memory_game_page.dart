import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:human_benchmark_flutter_v2/helpers/colors.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../values/const_values.dart';
import '../view_model/sequence_memory_view_model.dart';

class SequenceMemoryGamePage extends StatefulWidget {
  SequenceMemoryGamePage({Key? key}) : super(key: key);

  @override
  _SequenceMemoryGamePageState createState() => _SequenceMemoryGamePageState();
}

class _SequenceMemoryGamePageState extends State<SequenceMemoryGamePage>
    with SingleTickerProviderStateMixin {
  SequenceMemoryViewModel sequenceMemoryVm = getit<SequenceMemoryViewModel>();

  late List<Widget> widgetList = [];

  @override
  void initState() {
    widgetList = List.generate(9, (index) => _buildCard(index));
    sequenceMemoryVm.play();
    super.initState();
  }

  @override
  void dispose() {
    unregisterSequenceMemoryViewmodel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: _levelText(),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: MyColors.secondaryColor,
              size: 25.w,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        backgroundColor: sequenceMemoryVm.backGroundColor,
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          color: sequenceMemoryVm.backGroundColor,
          child: Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 70.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    height: context.height / 1.92,
                    child: GridView.count(
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 3,
                      children: widgetList,
                    ),
                  ),
                  Observer(
                    builder: (_) => SizedBox(
                      width: context.width,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        children: sequenceMemoryVm.stepsWidget,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _levelText() {
    return LessText.lessFuturedText(
      text: 'Level: ${sequenceMemoryVm.levelCount}',
      color: MyColors.secondaryColor,
      fontSize: 25.sp,
      fontWeight: FontWeight.w400,
    );
  }

  Widget _buildCard(int index) {
    return Observer(
      builder: (context) {
        return InkWell(
          onTap: () => sequenceMemoryVm.cardClickController(index),
          onTapDown: (details) => sequenceMemoryVm.cardTapDown(index),
          onTapUp: (details) => sequenceMemoryVm.cardTapCancel(index),
          onTapCancel: () => sequenceMemoryVm.cardTapCancel(index),
          child: AnimatedContainer(
            duration: Consts.cardAnimationDuration,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: sequenceMemoryVm.cardColors[index],
            ),
          ),
        );
      },
    );
  }
}
