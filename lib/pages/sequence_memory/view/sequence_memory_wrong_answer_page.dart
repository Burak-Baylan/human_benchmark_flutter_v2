import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helpers/colors.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/button/custom_button.dart';
import '../../../widgets/button/secondary_custom_button.dart';
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
                  SizedBox(
                    width: context.width / 1,
                  )
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
                  _retryButton(context),
                  SizedBox(height: 20),
                  _goToMenuButton(),
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
    return CustomButton(
      onPressed: () => sequenceMemoryVm.selectInfoPage(),
      text: 'Retry',
    );
  }

  Widget _wrongAnswerText() {
    return LessText.lessFuturedText(
      text: 'Wrong Card',
      fontSize: context.width / 9,
      color: Colors.white,
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
    return SecondaryCustomButton(
      onPressed: () => Get.back(),
      text: 'Go to menu',
    );
  }
}
