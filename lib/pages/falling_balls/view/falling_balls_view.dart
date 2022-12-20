import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/app_bar.dart';
import '../view_model/falling_balls_view_model.dart';

class FallingBallsView extends StatefulWidget {
  const FallingBallsView({super.key});

  @override
  State<FallingBallsView> createState() => _FallingBallsViewState();
}

class _FallingBallsViewState extends State<FallingBallsView> {
  FallingBallsViewModel denemeVm = getit<FallingBallsViewModel>();

  @override
  void initState() {
    move();
    super.initState();
  }

  Future<void> move() async {
    denemeVm.setContext(context);
    await Future.delayed(const Duration(microseconds: 300));
    denemeVm.play();
  }

  @override
  void dispose() {
    unregisterFallingBallsViewModel();
    denemeVm.stopTimers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Observer(
          builder: (context) => CustomAppBar('Time: ${denemeVm.gameDuration}'),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Observer(builder: (_) {
          return Stack(children: denemeVm.balls);
        }),
      ),
    );
  }
}
