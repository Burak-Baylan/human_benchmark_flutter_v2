import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/phone_properties.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/button/elevated_button.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../view_model/sequence_memory_view_model.dart';

class SequenceMemoryWrongAnswerPage extends StatefulWidget {
  SequenceMemoryWrongAnswerPage({Key? key}) : super(key: key);

  @override
  State<SequenceMemoryWrongAnswerPage> createState() =>
      _SequenceMemoryWrongAnswerPageState();
}

class _SequenceMemoryWrongAnswerPageState
    extends State<SequenceMemoryWrongAnswerPage> {
  SequenceMemoryViewModel sequenceMemoryVm = getit<SequenceMemoryViewModel>();

  @override
  void initState() {
    super.initState();
    sequenceMemoryVm.showAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myBlue,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  _backButton(),
                  Container(
                    margin: EdgeInsets.only(top: context.height / 50),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: LessText.lessFuturedText(
                        text: 'Level ${sequenceMemoryVm.levelCount}',
                        fontSize: context.width / 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: context.width / 1,)
                ],
              ),
            ),
            Flexible(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(child: _wrongAnswerText()),
                  SizedBox(height: context.height / 25),
                  _goToMenuButton(),
                  SizedBox(height: 20),
                  _retryButton(context),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _retryButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () => sequenceMemoryVm.selectInfoPage(),
      primary: Colors.transparent,
      borderRadius: 10,
      borderSideWidth: 2,
      borderSideColor: Colors.white,
      size: Size(context.width / 2, context.height / 17),
      child: LessText.lessFuturedText(
        text: 'Retry',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _wrongAnswerText() {
    return Column(
      children: [
        LessText.lessFuturedText(
          text: 'Wrong Card',
          fontSize: context.width / 9,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        SizedBox(height: context.height / 60),
        LessText.lessFuturedText(
          text: 'You choose the wrong card.',
          fontSize: context.width / 18,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ],
    );
  }

  Widget _backButton() {
    return Container(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _goToMenuButton() {
    return CustomElevatedButton(
      onPressed: () => Get.back(),
      primary: Colors.transparent,
      borderRadius: 10,
      borderSideWidth: 1.5,
      borderSideColor: Colors.white,
      size: Size(context.width / 2, context.height / 17),
      child: LessText.lessFuturedText(
        text: 'Go To Menu',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
