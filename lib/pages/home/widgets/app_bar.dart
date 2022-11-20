import 'package:flutter/material.dart';
import '../../../helpers/colors.dart';

class HomeAppBar {
  static AppBar create() => AppBar(
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: MyColors.myBlue,
        elevation: 0,
      );
}
