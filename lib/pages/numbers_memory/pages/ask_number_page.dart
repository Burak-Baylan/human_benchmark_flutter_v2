import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:human_benchmark_flutter_v2/widgets/button/custom_button_with_border.dart';
import 'package:human_benchmark_flutter_v2/widgets/text/less_futured_text.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/phone_properties.dart';
import '../controllers/number_memory_value_controller.dart';
import '../controllers/numbers_memory_controller.dart';

class AskNumber extends StatefulWidget {
  AskNumber({Key? key}) : super(key: key);

  @override
  _AskNumberState createState() => _AskNumberState();
}

class _AskNumberState extends State<AskNumber> {
  var textController = TextEditingController();

  late BuildContext context;
  late NumbersMemoryController controller;
  late NumbersMemoryValueController valueController;

  bool isKeyboardOpen = false;
  @override
  Widget build(BuildContext buildContext) {
    context = buildContext;
    controller = Get.find();
    valueController = controller.valueController;
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _quesitonText(),
            SizedBox(height: 25.h),
            _textField(),
            SizedBox(height: 35.h),
            _submitButton(),
          ],
        ),
      ),
    );
  }

  Widget _quesitonText() {
    return LessText.lessFuturedText(
      text: 'What was the number?',
      fontSize: 25.sp,
      color: MyColors.secondaryColor,
      fontWeight: FontWeight.w400,
      textAlign: TextAlign.center,
    );
  }

  FocusNode textFieldFocusNode = FocusNode();

  Widget _textField() {
    return SizedBox(
      width: Phone.width(context) / 1.3,
      child: TextField(
        autofocus: true,
        focusNode: textFieldFocusNode,
        controller: textController,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: MyColors.secondaryColor,
        ),
      ),
    );
  }

  Widget _submitButton() {
    return CustomButtonWithBorder(
      size: Size(context.width / 3, 50.h),
      onPressed: () => submit(),
      text: 'Submit',
    );
  }

  void submit() {
    valueController.usersAnswer = textController.text;
    valueController.checkAnswer(controller);
    textController.clear();
  }
}
