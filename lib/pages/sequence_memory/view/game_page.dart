import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../values/const_values.dart';
import '../view_model/sequence_memory_view_model.dart';

class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>
    with SingleTickerProviderStateMixin {


  SequenceMemoryViewModel sequenceMemoryVm = getit<SequenceMemoryViewModel>();
  
  @override
  Widget build(BuildContext context) {
    _initializeValues();
    return Observer(
      builder: (context) => Scaffold(
        backgroundColor: sequenceMemoryVm.backGroundColor,
        body: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          color: sequenceMemoryVm.backGroundColor,
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: _levelText(),
                ),
              ),
              Flexible(
                flex: 10,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: GridView.count(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 3,
                    children: widgetList,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

   _levelText() {
    return LessText.lessFuturedText(
      text: 'Level: ${sequenceMemoryVm.levelCount}',
      color: Colors.white,
    );
  }
  
  late List<Widget> widgetList = [];

  _initializeValues() {
    widgetList = List.generate(9, (index) => _buildCard(index));
    sequenceMemoryVm.play();
  }

  Widget _buildCard(int index) {
    return Observer(
      builder: (context) {
        return InkWell(
        onTap: () => sequenceMemoryVm.cardClickController(index),
        onTapDown: (details) => sequenceMemoryVm.cardTapDown(index),
        onTapCancel: () => sequenceMemoryVm.cardTapCancel(index),
        child: AnimatedContainer(
          duration: Consts.cardAnimationDuration,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: sequenceMemoryVm.cardColors[index],
          ),
        ),
      );
      },
    );
  }
}
