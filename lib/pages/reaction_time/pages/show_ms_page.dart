import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/colors.dart';
import '../../../helpers/phone_properties.dart';
import '../../../widgets/text/less_futured_text.dart';
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
      backgroundColor: MyColors.myBlue,
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
      margin: EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        onPressed: () => controller.selectRedPage(),
        style: ElevatedButton.styleFrom(
          primary: MyColors.myYellow,
          fixedSize: Size(Phone.width(context) / 1.2, 50),
        ),
        child: LessText.lessFuturedText(
          text: buttonText,
          fontFamily: 'GemunuLibre',
          color: Colors.white,
        ),
      ),
    );
  }

  Widget detailsWdgt() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const FittedBox(
          child: Icon(
            Icons.watch_later_outlined,
            color: Colors.white,
            size: 100,
          ),
        ),
        const SizedBox(height: 15),
        FittedBox(
          child: LessText.lessFuturedText(
            text: ms + " ms",
            fontSize: 30,
            fontFamily: 'GemunuLibre',
            color: Colors.white,
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
          color: Colors.white,
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
              text: "Average Score: $averageScore ms" ,
              fontFamily: 'GemunuLibre',
              fontSize: 35,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _levelController() {
    if (controller.valueController.levelCount == 5) {
      setState(() {
        averageVisibility = true;
        averageScore = controller.valueController.calculateAverageScore();
        buttonText = 'Play Again';
      });
    }
  }

  _initialValues() {
    averageVisibility = false;
    controller = Get.find();
    ms = controller.valueController.millisecond.toString();
    buttonText = 'Continue';
  }
}
