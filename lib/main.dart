import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'style.dart';
import 'ui/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: ColorStyle.background,
        backgroundColor: ColorStyle.blackBackground,
        dividerColor: ColorStyle.iconColorDark,
        accentColor: ColorStyle.primaryColor,
        primaryColor: ColorStyle.primaryColor,
        hintColor: ColorStyle.fontSecondaryColorDark,
        buttonColor: ColorStyle.primaryColor,
        canvasColor: ColorStyle.grayBackground,
        cardColor: ColorStyle.grayBackground,
        textSelectionTheme: TextSelectionTheme.of(context).copyWith(
          selectionColor: ColorStyle.fontColorDark,
          selectionHandleColor: ColorStyle.fontColorDarkTitle,
        ),
      ),
      home: HomePage(),
    );
  }
}
