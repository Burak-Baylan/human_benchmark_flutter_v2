import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/reaction_timer_value_controller.dart';
import 'controller/recation_time_controller.dart';

class ReactionTime extends StatefulWidget {
  ReactionTime({Key? key}) : super(key: key);

  @override
  _ReactionTimeState createState() => _ReactionTimeState();
}

class _ReactionTimeState extends State<ReactionTime> {
  
  late ReactionTimeController reactionTimeController;
  late ReactionTimeValueController reactionTimeValueController;

  @override
  void dispose() {
    reactionTimeValueController.reset();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    reactionTimeController = Get.put(ReactionTimeController());
    reactionTimeValueController = Get.put(ReactionTimeValueController());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => reactionTimeController.pages[reactionTimeController.page.value]);
  }
}
