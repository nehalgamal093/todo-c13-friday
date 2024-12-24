import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c13_friday/providers/dark_light_theme.dart';
import 'package:todo_c13_friday/providers/onboarding_index.dart';
import 'package:todo_c13_friday/screens/onboarding_screen/widgets/navigation.dart';
import 'package:todo_c13_friday/screens/onboarding_screen/widgets/page_viewer.dart';
import '../../providers/my_provider.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';

  OnBoardingScreen({super.key});
  PageController controller =
      PageController(viewportFraction: 1, keepPage: true);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MyProvider myProvider = Provider.of<MyProvider>(context);
    LightOrDarkTheme lightOrDarkTheme =
        LightOrDarkTheme(myProvider: myProvider);
    lightOrDarkTheme.changeListDarkLight();
    return ChangeNotifierProvider(
        create: (context) => OnBoardingIndexProvider(),
        builder: (context, child) {
          OnBoardingIndexProvider indexProvider =
              Provider.of<OnBoardingIndexProvider>(context);
          return Scaffold(
            appBar: AppBar(
              title: Image.asset('assets/images/app_logo.png'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  PageViewer(
                      controller: controller,
                      lightOrDarkTheme: lightOrDarkTheme,
                      indexProvider: indexProvider,
                      size: size),
                  Navigation(
                      controller: controller,
                      lightOrDarkTheme: lightOrDarkTheme,
                      indexProvider: indexProvider)
                ],
              ),
            ),
          );
        });
  }
}
