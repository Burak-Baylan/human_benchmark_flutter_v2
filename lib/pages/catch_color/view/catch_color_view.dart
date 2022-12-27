import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:human_benchmark_flutter_v2/pages/catch_color/view_model/catch_color_view_model.dart';
import 'package:human_benchmark_flutter_v2/widgets/app_bar.dart';

import '../../../helpers/colors.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/default_banner_ad_widget.dart';

class CatchColorView extends StatefulWidget {
  CatchColorView({Key? key}) : super(key: key);

  @override
  State<CatchColorView> createState() => _CatchColorViewState();
}

class _CatchColorViewState extends State<CatchColorView> {
  late List<Widget> widgetList = [];

  CatchColorViewModel catchColorVm = getit<CatchColorViewModel>();

  @override
  void initState() {
    widgetList = List.generate(9, (index) => _buildCard(index));
    catchColorVm.play();
    super.initState();
  }

  @override
  void dispose() {
    unregisterCatchColorViewmodel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppBar('${catchColorVm.levelCount}/4'),
        ),
        backgroundColor: catchColorVm.backgroundColor,
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: catchColorVm.backgroundColor,
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: widgetList,
                    ),
                  ),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: DefaultBannerAd(
                  adId: 'ca-app-pub-3940256099942544/6300978111'),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildCard(int index) {
    return InkWell(
      onTap: () => catchColorVm.userClicked(index),
      child: Observer(builder: (_) {
        return Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: MyColors.secondaryColor, width: 2),
            color: catchColorVm.selectedIndex == index
                ? Colors.green
                : Colors.white,
          ),
          child: Container(),
        );
      }),
    );
  }
}
