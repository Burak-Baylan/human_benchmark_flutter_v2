import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../ads/ad_ids.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/default_banner_ad_widget.dart';
import '../view_model/falling_balls_view_model.dart';

class FallingBallsView extends StatefulWidget {
  const FallingBallsView({super.key});

  @override
  State<FallingBallsView> createState() => _FallingBallsViewState();
}

class _FallingBallsViewState extends State<FallingBallsView> {
  FallingBallsViewModel fallingBallsVm = getit<FallingBallsViewModel>();

  @override
  void initState() {
    move();
    super.initState();
  }

  Future<void> move() async {
    fallingBallsVm.setContext(context);
    await Future.delayed(const Duration(microseconds: 300));
    fallingBallsVm.play();
  }

  @override
  void dispose() {
    unregisterFallingBallsViewModel();
    fallingBallsVm.stopTimers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Observer(
          builder: (context) =>
              CustomAppBar('Time: ${fallingBallsVm.gameDuration}'),
        ),
      ),
      backgroundColor: Colors.white,
      body: Observer(builder: (_) {
        return GestureDetector(
          onTap: () => fallingBallsVm.wrongAnswer(),
          child: AnimatedContainer(
            color: fallingBallsVm.backgroundColor,
            duration: const Duration(milliseconds: 200),
            child: Stack(children: [
              Observer(builder: (context) {
                return fallingBallsVm.ballWidgetW;
              }),
              Align(
                alignment: Alignment.bottomCenter,
                child: DefaultBannerAd(adId: AddIds.fallingBallsBanner),
              ),
            ]),
          ),
        );
      }),
    );
  }
}
