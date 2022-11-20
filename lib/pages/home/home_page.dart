import 'package:flutter/material.dart';
import '../../helpers/colors.dart';
import '../../helpers/phone_properties.dart';
import '../../widgets/button/elevated_button.dart';
import '../numbers_memory/numbers_memory_page.dart';
import '../reaction_time/reaction_time_page.dart';
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
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
