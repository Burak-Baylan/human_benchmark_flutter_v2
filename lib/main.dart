import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:human_benchmark_flutter_v2/pages/home/home_page.dart';
import 'helpers/colors.dart';
import 'helpers/phone_properties.dart';
import 'helpers/setup_app.dart';
import 'pages/main_view_model.dart';
import 'pages/onboarding/view/onboarding_view.dart';

MainViewModel mainVm = MainViewModel();

void main() async {
  await SetupApp.setup();
  Phone.changeStatusBarAndNavigationBarColor(Colors.white);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    mainVm.setContext(context);
    return ScreenUtilInit(
      designSize: Size(360, 844),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          theme: ThemeData(
            primaryColor: MyColors.secondaryColor,
            accentColor: MyColors.secondaryColor,
          ),
          debugShowCheckedModeBanner: false,
          home: Builder(builder: (context) {
            if (mainVm.seenOnboard) return HomePage();
            return const OnboardingView();
          }),
        );
      },
    );
  }
}
