import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_c13_friday/models/OnBoardingModel.dart';
import 'package:todo_c13_friday/providers/my_provider.dart';
import 'package:todo_c13_friday/theme/base_colors.dart';
import '../resources/strings_manager.dart';
import '../theme/dark_color_manager.dart';
import '../theme/light_color_manager.dart';

class LightOrDarkTheme {
  late List<OnBoardingModel> list;
  late BaseColors baseColors;
  MyProvider myProvider;

  LightOrDarkTheme({required this.myProvider});

  List<OnBoardingModel> onBoardingListDark = [
    OnBoardingModel(
        title: StringsManager.title1,
        desc: StringsManager.desc1,
        image: 'assets/images/group.png'),
    OnBoardingModel(
        title: StringsManager.title2,
        desc: StringsManager.desc2,
        image: 'assets/images/wireframe.png'),
    OnBoardingModel(
        title: StringsManager.title3,
        desc: StringsManager.desc3,
        image: 'assets/images/uploading.png')
  ];
  List<OnBoardingModel> onBoardingListLight = [
    OnBoardingModel(
        title: StringsManager.title1,
        desc: StringsManager.desc1,
        image: 'assets/images/being_creative.png'),
    OnBoardingModel(
        title: StringsManager.title2,
        desc: StringsManager.desc2,
        image: 'assets/images/being_creative_1.png'),
    OnBoardingModel(
        title: StringsManager.title3,
        desc: StringsManager.desc3,
        image: 'assets/images/being_creative_2.png')
  ];
  ThemeMode themeMode = ThemeMode.light;
  void changeListDarkLight() {
    if (myProvider.themeMode == themeMode) {
      list = onBoardingListLight;
      baseColors = LightColorManager();
    } else {
      list = onBoardingListDark;
      baseColors = DarkColorManager();
    }
  }
}
