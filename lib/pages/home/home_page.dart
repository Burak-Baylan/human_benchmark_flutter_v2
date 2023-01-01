import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../core/hive/hive_constants.dart';
import '../../helpers/colors.dart';
import '../../helpers/phone_properties.dart';
import '../../helpers/setup_app.dart';
import '../../utils/injection_helper.dart';
import '../../widgets/text/less_futured_text.dart';
import '../aim_trainer/aim_trainer_menu/aim_trainer_menu.dart';
import '../blind_numbers/blind_numbers/blind_numbers_menu.dart';
import '../catch_color/catch_color_menu/catch_color_menu.dart';
import '../color_cell_count/menu/color_cell_count_menu.dart';
import '../colored_text/colored_text_menu/colored_text_menu.dart';
import '../count_one_by_one/count_one_by_one_menu/count_one_by_one_menu.dart';
import '../falling_balls/falling_balls_menu/falling_balls_menu.dart';
import '../fast_fingers/fast_fingers_menu/fast_fingers_menu.dart';
import '../find_color/find_color_menu/find_color_menu.dart';
import '../find_number/find_number_menu/find_number_menu.dart';
import '../hold_and_click/hold_and_click_menu/hold_and_click_menu.dart';
import '../math/math_menu/math_menu.dart';
import '../numbers_memory/numbers_memory_page.dart';
import '../reaction_time/reaction_time_page.dart';
import '../sequence_memory/view/info_page.dart';
import '../vibration/vibration_menu/vibration_menu.dart';
import '../visual_memory/visual_memory_menu/visual_memory_menu.dart';
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

  List<HomePageGameWidgetModel> gameWidgetModels = [];

  List<String> gameNames = [
    'Reaction Time',
    'Numbers Memory',
    'Sequence Memory',
    'Fast Fingers',
    'Vibration',
    'Find Number',
    'Find Color',
    'Catch Color',
    'Colored Text',
    'Math',
    'Count One by One',
    'Color Cell Count',
    'Falling Balls',
    'Hold and Click',
    'Visual Memory',
    'Aim Trainer',
    'Blind Numbers',
  ];

  List<Function> gameRegisterFunctions = [
    () {},
    () {},
    registerSequenceMemoryViewmodel,
    registerFastFingersViewModel,
    registerVibrationViewModel,
    registerFindNumberViewModel,
    registerFindColorViewModel,
    registerCatchColorViewModel,
    registerColoredTextViewModel,
    registerMathViewModel,
    registerCountOneByOneViewModel,
    registerColorCellCountViewModel,
    registerFallingBallsViewModel,
    registerHoldAndClickViewModel,
    registerVisualMemoryViewModel,
    registerAimTrainerViewModel,
    registerBlindInARowViewModel,
  ];

  List<String> historyBoxNames = [
    HiveConstants.BOX_REACTION_TIME_SCORES,
    HiveConstants.BOX_NUMBERS_MEMORY_SCORES,
    HiveConstants.BOX_SEQUENCE_MEMORY_SCORES,
    HiveConstants.BOX_FAST_FINGERS_SCORES,
    HiveConstants.BOX_VIBRATION_SCORES,
    HiveConstants.BOX_FIND_NUMBER_SCORES,
    HiveConstants.BOX_FIND_COLOR_SCORES,
    HiveConstants.BOX_CATCH_COLOR_SCORES,
    HiveConstants.BOX_COLORED_TEXT_SCORES,
    HiveConstants.BOX_MATH_SCORES,
    HiveConstants.BOX_COUNT_ONE_BY_ONE_SCORES,
    HiveConstants.BOX_COLORED_CELL_COUNT_SCORES,
    HiveConstants.BOX_FALLING_BALLS_SCORES,
    HiveConstants.BOX_HOLD_AND_CLICK_SCORES,
    HiveConstants.BOX_VISUAL_MEMORY_SCORES,
    HiveConstants.BOX_AIM_TRAINER_SCORES,
    HiveConstants.BOX_BLIND_NUMBERS_SCORES,
  ];

  List<String> highScoreBoxNames = [
    HiveConstants.BOX_REACTION_TIME_HIGH_SCORE,
    HiveConstants.BOX_NUMBERS_MEMORY_HIGH_SCORE,
    HiveConstants.BOX_SEQUENCE_MEMORY_HIGH_SCORE,
    HiveConstants.BOX_FAST_FINGERS_HIGH_SCORE,
    HiveConstants.BOX_VIBRATION_HIGH_SCORE,
    HiveConstants.BOX_FIND_NUMBER_HIGH_SCORE,
    HiveConstants.BOX_FIND_COLOR_HIGH_SCORE,
    HiveConstants.BOX_CATCH_COLOR_HIGH_SCORE,
    HiveConstants.BOX_COLORED_TEXT_HIGH_SCORE,
    HiveConstants.BOX_MATH_HIGH_SCORE,
    HiveConstants.BOX_COUNT_ONE_BY_ONE_HIGH_SCORE,
    HiveConstants.BOX_COLORED_CELL_COUNT_HIGH_SCORE,
    HiveConstants.BOX_FALLING_BALLS_HIGH_SCORE,
    HiveConstants.BOX_HOLD_AND_CLICK_HIGH_SCORE,
    HiveConstants.BOX_VISUAL_MEMORY_HIGH_SCORE,
    HiveConstants.BOX_AIM_TRAINER_HIGH_SCORE,
    HiveConstants.BOX_BLIND_NUMBERS_HIGH_SCORE,
  ];

  List<GameWidgetPrTextEnum> prTextEnum = [
    GameWidgetPrTextEnum.MS,
    GameWidgetPrTextEnum.LEVEL,
    GameWidgetPrTextEnum.LEVEL,
    GameWidgetPrTextEnum.CLICK_COUNT,
    GameWidgetPrTextEnum.MS,
    GameWidgetPrTextEnum.MS,
    GameWidgetPrTextEnum.MS,
    GameWidgetPrTextEnum.MS,
    GameWidgetPrTextEnum.MS,
    GameWidgetPrTextEnum.MS,
    GameWidgetPrTextEnum.MS,
    GameWidgetPrTextEnum.MS,
    GameWidgetPrTextEnum.MS,
    GameWidgetPrTextEnum.MS,
    GameWidgetPrTextEnum.MS,
    GameWidgetPrTextEnum.MS,
    GameWidgetPrTextEnum.LEVEL,
  ];

  List<Widget> gamesWidgets = [
    ReactionTime(),
    NumbersMemory(),
    SequenceMemoryMenu(),
    const FastFingersMenu(),
    const VibrationMenu(),
    const FindNumberMenu(),
    const FindColorMenu(),
    const CatchColorMenu(),
    const ColoredTextMenu(),
    const MathMenu(),
    const CountOneByOneMenu(),
    const ColorCellCountMenu(),
    const FallingBallsMenu(),
    const HoldAndClickMenu(),
    const VisualMemoryMenu(),
    AimTrainerMenu(),
    BlindNumbersMenu(),
  ];

  void fillModels() {
    for (var i = 0; i < 17; i++) {
      var model = HomePageGameWidgetModel(
        route: gamesWidgets[i],
        onPressed: gameRegisterFunctions[i],
        name: gameNames[i],
        gameNumber: (i + 1).toString(),
        boxName: historyBoxNames[i],
        highScoreBoxName: highScoreBoxNames[i],
        prTextEnum: prTextEnum[i],
      );
      gameWidgetModels.add(model);
    }
  }

  @override
  Widget build(BuildContext buildContext) {
    fillModels();
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
      body: FutureBuilder(
        future: setupAppFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      child: _gamesLyt(),
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(color: MyColors.secondaryColor),
          );
        },
      ),
    );
  }

  Future<void> get setupAppFuture => SetupApp.setup();

  Widget _gamesLyt() {
    return MasonryGridView.count(
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 1,
      shrinkWrap: true,
      itemCount: 17,
      itemBuilder: (context, index) {
        return GamesWidget(model: gameWidgetModels[index]);
      },
    );
  }
}

class HomePageGameWidgetModel {
  Widget route;
  Function onPressed;
  String name;
  String gameNumber;
  String boxName;
  String highScoreBoxName;
  GameWidgetPrTextEnum prTextEnum;

  HomePageGameWidgetModel({
    required this.route,
    required this.onPressed,
    required this.name,
    required this.gameNumber,
    required this.boxName,
    required this.highScoreBoxName,
    required this.prTextEnum,
  });
}
