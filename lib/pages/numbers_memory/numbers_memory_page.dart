// OLD GAME

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/number_memory_value_controller.dart';
import 'controllers/numbers_memory_controller.dart';

class NumbersMemory extends StatefulWidget {
  NumbersMemory({Key? key}) : super(key: key);

  @override
  _NumbersMemoryState createState() => _NumbersMemoryState();
}

class _NumbersMemoryState extends State<NumbersMemory> {
  late NumbersMemoryController controller;
  late NumbersMemoryValueController valueController;

  @override
  void initState() {
    controller = Get.put(NumbersMemoryController());
    valueController = Get.put(NumbersMemoryValueController());
    super.initState();
  }

  @override
  void dispose() {
    controller.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.pages[controller.page.value],
    );
  }
}
