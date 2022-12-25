import 'package:flutter/material.dart';
import '../../helpers/colors.dart';
import '../../helpers/phone_properties.dart';
import '../../utils/injection_helper.dart';
import '../../widgets/button/elevated_button.dart';
import '../../widgets/text/less_futured_text.dart';
import '../aim_trainer/aim_trainer_menu/aim_trainer_menu.dart';
import '../blind_numbers/blind_numbers/blind_numbers_menu.dart';
import '../catch_color/catch_color_menu/catch_color_menu.dart';
import '../color_cell_count/menu/color_cell_count_menu.dart';
import '../colored_text/colored_text_menu/colored_text_menu.dart';
import '../count_one_by_one/count_one_by_one_menu/count_one_by_one_menu.dart';
import '../falling_balls/falling_balls_menu/falling_balls_menu.dart';
import '../fast_fingers/view/fast_fingers_view.dart';
import '../find_color/find_color_menu/find_color_menu.dart';
import '../find_number/find_number_menu/find_number_menu.dart';
import '../hold_and_click/hold_and_click_menu/hold_and_click_menu.dart';
import '../math/math_menu/math_menu.dart';
import '../numbers_memory/numbers_memory_page.dart';
import '../reaction_time/reaction_time_page.dart';
import '../sequence_memory/view/sequence_memory_page.dart';
import '../vibration/view/vibration_view.dart';
import '../visual_memory/visual_memory_menu/visual_memory_menu.dart';
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
          text: "Fast Fingers",
          route: FastFingersView(),
          onPressed: () => registerFastFingersViewModel(),
          gameNumber: '4.',
        ),
        GamesWidget(
          text: "Vibration",
          route: VibrationView(),
          onPressed: () => registerVibrationViewModel(),
          gameNumber: '5.',
        ),
        GamesWidget(
          text: "Find Number",
          route: FindNumberMenu(),
          onPressed: () => registerFindNumberViewModel(),
          gameNumber: '6.',
        ),
        GamesWidget(
          text: "Find Color",
          route: FindColorMenu(),
          onPressed: () => registerFindColorViewModel(),
          gameNumber: '7.',
        ),
        GamesWidget(
          text: "Catch Color",
          route: CatchColorMenu(),
          onPressed: () => registerCatchColorViewModel(),
          gameNumber: '8.',
        ),
        GamesWidget(
          text: "Colored Text",
          route: ColoredTextMenu(),
          onPressed: () => registerColoredTextViewModel(),
          gameNumber: '9.',
        ),
        GamesWidget(
          text: "Math",
          route: MathMenu(),
          onPressed: () => registerMathViewModel(),
          gameNumber: '10.',
        ),
        GamesWidget(
          text: "Count One by One",
          route: CountOneByOneMenu(),
          onPressed: () => registerCountOneByOneViewModel(),
          gameNumber: '11.',
        ),
        GamesWidget(
          text: "Color Cell Count",
          route: ColorCellCountMenu(),
          onPressed: () => registerColorCellCountViewModel(),
          gameNumber: '12.',
        ),
        GamesWidget(
          text: "Falling Balls",
          route: FallingBallsMenu(),
          gameNumber: '13.',
          onPressed: () => registerFallingBallsViewModel(),
        ),
        GamesWidget(
          text: "Hold And Click",
          route: HoldAndClickMenu(),
          gameNumber: '14.',
          onPressed: () => registerHoldAndClickViewModel(),
        ),
        GamesWidget(
          text: "Visual Memory",
          route: VisualMemoryMenu(),
          gameNumber: '15.',
          onPressed: () => registerVisualMemoryViewModel(),
        ),
        GamesWidget(
          text: "Aim Trainer",
          route: AimTrainerMenu(),
          gameNumber: '16.',
          onPressed: () => registerAimTrainerViewModel(),
        ),
        GamesWidget(
          text: "Blind Numbers",
          route: BlindNumbersMenu(),
          gameNumber: '17.',
          onPressed: () => registerBlindInARowViewModel(),
        ),
      ],
    );
  }
}
