import 'package:flutter/material.dart';
import '../../helpers/colors.dart';
import '../../helpers/phone_properties.dart';
import '../../utils/injection_helper.dart';
import '../../widgets/button/elevated_button.dart';
import '../../widgets/text/less_futured_text.dart';
import '../catch_color/catch_color_menu/catch_color_menu.dart';
import '../colored_text/colored_text_menu/colored_text_menu.dart';
import '../fast_fingers/fast_fingers_menu/fast_fingers_menu.dart';
import '../find_color/find_color_menu/find_color_menu.dart';
import '../find_number/find_number_menu/find_number_menu.dart';
import '../numbers_memory/numbers_memory_page.dart';
import '../reaction_time/reaction_time_page.dart';
import '../sequence_memory/view/sequence_memory_page.dart';
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
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        centerTitle: true,
        title: LessText.lessFuturedText(
          text: 'Home',
          fontWeight: FontWeight.w400,
          color: MyColors.secondaryColor,
          fontSize: 18,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                child: _gamesLyt(),
              ),
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
        GamesWidget(
          text: "Reaction Time",
          route: ReactionTime(),
          gameNumber: '1.',
        ),
        GamesWidget(
          text: "Numbers Memory",
          route: NumbersMemory(),
          gameNumber: '2.',
        ),
        GamesWidget(
          text: "Sequence Memory",
          route: SequenceMemory(),
          onPressed: () => registerSequenceMemoryViewmodel(),
          gameNumber: '3.',
        ),
        GamesWidget(
          text: "Find Number",
          route: FindNumberMenu(),
          onPressed: () => registerFindNumberViewModel(),
          gameNumber: '4.',
        ),
        GamesWidget(
          text: "Find Color",
          route: FindColorMenu(),
          onPressed: () => registerFindColorViewModel(),
          gameNumber: '5.',
        ),
        GamesWidget(
          text: "Catch Color",
          route: CatchColorMenu(),
          onPressed: () => registerCatchColorViewModel(),
          gameNumber: '6.',
        ),
        GamesWidget(
          text: "Fast Fingers",
          route: FastFingersMenu(),
          onPressed: () => registerFastFingersViewModel(),
          gameNumber: '7.',
        ),
        GamesWidget(
          text: "Colored Text",
          route: ColoredTextMenu(),
          onPressed: () => registerColoredTextViewModel(),
          gameNumber: '8.',
        ),
      ],
    );
  }
}
