import 'package:flutter/material.dart';
import 'package:human_benchmark_flutter_v2/pages/find_color/find_color_menu/find_color_menu.dart';
import '../../helpers/colors.dart';
import '../../helpers/phone_properties.dart';
import '../../utils/injection_helper.dart';
import '../../widgets/button/elevated_button.dart';
import '../find_number/find_number_menu/find_number_menu.dart';
import '../numbers_memory/numbers_memory_page.dart';
import '../reaction_time/reaction_time_page.dart';
import '../result_page/result_page.dart';
import '../sequence_memory/view/sequence_memory_page.dart';
import 'widgets/app_bar.dart';
import 'widgets/banner_ad_widget.dart';
import 'widgets/game_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Phone.openStatusBar();
  }

  late BuildContext context;

  @override
  Widget build(BuildContext buildContext) {
    context = buildContext;
    return Scaffold(
      backgroundColor: MyColors.myBlue,
      extendBodyBehindAppBar: false,
      appBar: HomeAppBar.create(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(indent: 15, endIndent: 15),
            Expanded(
              child: Container(
                child: _gamesLyt(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: _shareButton(),
            ),
            HomeBannerWidget().create(context),
          ],
        ),
      ),
    );
  }

  Widget _shareButton() => CustomElevatedButton(
        size: Size(50, 20),
        primary: MyColors.mySemiDarkYellow,
        borderSideWidth: 3,
        borderRadius: 10,
        onPressed: () {/*Share*/},
        child: Icon(Icons.share),
      );

  Widget _gamesLyt() {
    return GridView.count(
      padding: EdgeInsets.all(15),
      crossAxisSpacing: 15,
      childAspectRatio: (100 / 20),
      mainAxisSpacing: 15,
      crossAxisCount: 1,
      children: [
        GamesWidget.create(
          text: "Reaction Time",
          route: ReactionTime(),
        ),
        GamesWidget.create(
          text: "Numbers Memory",
          route: NumbersMemory(),
        ),
        GamesWidget.create(
          text: "Sequence Memory",
          route: SequenceMemory(),
          onPressed: () => registerSequenceMemoryViewmodel(),
        ),
        GamesWidget.create(
          text: "Find Number",
          route: FindNumberMenu(),
          onPressed: () => registerFindNumberViewModel(),
        ),
        GamesWidget.create(
          text: "Find Color",
          route: FindColorMenu(),
          onPressed: () => registerFindColorViewModel(),
        ),
        GamesWidget.create(
          text: "Result Page",
          route: ResultPage(
            title: 'Average Time',
            exp: '1005 milliseconds',
            message:
                'Try again. You can do better. The average time is required to be less than 930 milliseconds.',
            tryAgainPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
