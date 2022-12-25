import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/app_bar.dart';
import '../view_model/blind_numbers_view_model.dart';

class BlindNumbersView extends StatefulWidget {
  const BlindNumbersView({super.key});

  @override
  State<BlindNumbersView> createState() => _BlindNumbersViewState();
}

class _BlindNumbersViewState extends State<BlindNumbersView> {
  BlindNumbersViewModel blindVm = getit<BlindNumbersViewModel>();

  @override
  void initState() {
    blindVm.setContext(context);
    play();
    super.initState();
  }

  Future<void> play() async {
    await Future.delayed(const Duration(milliseconds: 300));
    blindVm.play();
  }

  @override
  void dispose() {
    unregisterBlindInARowViewModel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Observer(
          builder: (context) => CustomAppBar('${blindVm.levelCount}/5'),
        ),
      ),
      body: Observer(builder: (_) {
        return AnimatedContainer(
          color: blindVm.backgroundColor,
          duration: const Duration(milliseconds: 200),
          height: context.height,
          width: context.width,
          child: Observer(builder: (context) {
            return Stack(children: blindVm.ballWidgetsList);
          }),
        );
      }),
    );
  }
}
