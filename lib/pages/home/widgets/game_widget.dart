import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helpers/colors.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/button/elevated_button.dart';
import '../../sequence_memory/view_model/sequence_memory_view_model.dart';

class GamesWidget {
  static CustomElevatedButton create({
    required String text,
    required Widget route,
    Function? onPressed,
  }) {
    return CustomElevatedButton(
      primary: MyColors.mySemiDarkYellow,
      borderSideWidth: 3,
      borderRadius: 15,
      onPressed: () {
        if (onPressed != null) onPressed();
        Get.to(route);
      },
      child: Center(
        child: FittedBox(
          child: AutoSizeText(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'GemunuLibre',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxFontSize: 60,
            minFontSize: 24,
          ),
        ),
      ),
    );
  }
}
