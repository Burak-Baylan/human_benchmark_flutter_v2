import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import '../../../helpers/phone_properties.dart';
import '../../../utils/injection_helper.dart';
import '../view_model/sequence_memory_view_model.dart';

class SequenceMemory extends StatefulWidget {
  SequenceMemory({Key? key}) : super(key: key);

  @override
  _SequenceMemoryState createState() => _SequenceMemoryState();
}

class _SequenceMemoryState extends State<SequenceMemory> {
  SequenceMemoryViewModel sequenceMemoryVm = getit<SequenceMemoryViewModel>();

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  _loadAd() => sequenceMemoryVm.loadInterstitialAd();

  @override
  void dispose() {
    sequenceMemoryVm.hardReset();
    unregisterSequenceMemoryViewmodel();
    registerSequenceMemoryViewmodel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Observer(
      builder: (context) => sequenceMemoryVm.pages[sequenceMemoryVm.page]);
}
