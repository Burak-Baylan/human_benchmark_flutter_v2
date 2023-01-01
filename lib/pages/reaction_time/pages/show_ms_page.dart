// OLD GAME

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:human_benchmark_flutter_v2/ads/ad_manager.dart';
import 'package:human_benchmark_flutter_v2/helpers/high_score_comparator.dart';
import '../../../core/hive/hive_constants.dart';
import '../../../core/hive/hive_manager.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/date_helper.dart';
import '../../../widgets/button/custom_button_with_border.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../../history_page/view/history_view.dart';
import '../controller/recation_time_controller.dart';

class ShowMsPage extends StatefulWidget {
  ShowMsPage({Key? key}) : super(key: key);

  @override
  _ShowMsPageState createState() => _ShowMsPageState();
}

class _ShowMsPageState extends State<ShowMsPage> {
  late ReactionTimeController controller;
  late String ms;
  bool averageVisibility = false;
  int averageScore = 0;
  String buttonText = 'Continue';

  @override
  Widget build(BuildContext context) {
    _initialValues();
    _levelController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(''),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: MyColors.secondaryColor,
            size: 25.w,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: detailsWdgt(),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: continueButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget continueButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: CustomButtonWithBorder(
        onPressed: () => controller.selectRedPage(),
        size: Size(context.width / 1.5, context.height / 15),
        child: LessText.lessFuturedText(
          text: buttonText,
          color: MyColors.secondaryColor,
        ),
      ),
    );
  }

  Widget detailsWdgt() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FittedBox(
          child: Icon(
            Icons.watch_later_outlined,
            color: MyColors.secondaryColor,
            size: 100,
          ),
        ),
        const SizedBox(height: 15),
        FittedBox(
          child: LessText.lessFuturedText(
            text: ms + " ms",
            fontSize: 30,
            fontFamily: 'GemunuLibre',
            color: MyColors.secondaryColor,
          ),
        ),
        Visibility(
          visible: averageVisibility,
          child: _averageScoreWdgt(),
        ),
        const SizedBox(height: 15),
        LessText.lessFuturedText(
          text: "${controller.valueController.levelCount}/5",
          fontFamily: 'GemunuLibre',
          fontSize: 20,
          color: MyColors.secondaryColor,
        ),
      ],
    );
  }

  Widget _averageScoreWdgt() {
    return Column(
      children: [
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: FittedBox(
            child: LessText.lessFuturedText(
              text: "Average Score: $averageScore ms",
              fontFamily: 'GemunuLibre',
              fontSize: 35,
              color: MyColors.secondaryColor,
            ),
          ),
        ),
      ],
    );
  }

  void _levelController() {
    if (controller.valueController.levelCount == 5) {
      setState(() {
        averageVisibility = true;
        averageScore = controller.valueController.calculateAverageScore();
        buttonText = 'Play Again';
        addToHistory();
        AdManager.showReactionTimeAd();
        HightScoreComparator.compare(
          boxName: HiveConstants.BOX_REACTION_TIME_HIGH_SCORE,
          score: averageScore,
        );
      });
    }
  }

  void addToHistory() {
    var model = HistoryModel(
      date: DateHelper.getDateStr,
      text: '$averageScore ms',
    );
    HiveManager.putData<HistoryModel>(
        HiveConstants.BOX_REACTION_TIME_SCORES, model);
  }

  void _initialValues() {
    averageVisibility = false;
    controller = Get.find();
    ms = controller.valueController.millisecond.toString();
    buttonText = 'Continue';
  }
}
