import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../cache/cache_helper.dart';
import '../../../providers/dark_light_theme.dart';
import '../../../providers/onboarding_index.dart';
import '../../login_screen.dart';

class Navigation extends StatelessWidget {
  final PageController controller;
  final LightOrDarkTheme lightOrDarkTheme;
  final OnBoardingIndexProvider indexProvider;

  const Navigation({
    super.key,
    required this.controller,
    required this.lightOrDarkTheme,
    required this.indexProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        indexProvider.currIndex == 0
            ? const SizedBox()
            : InkWell(
                onTap: () {
                  previousPage();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                      border:
                          Border.all(color: Theme.of(context).primaryColor)),
                  child: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
        SmoothPageIndicator(
            controller: controller,
            count: lightOrDarkTheme.list.length,
            effect: ExpandingDotsEffect(
                dotColor: lightOrDarkTheme.baseColors.dotColor),
            onDotClicked: (index) {
              moveToPage(index);
            }),
        InkWell(
          onTap: () {
            if (indexProvider.currIndex == lightOrDarkTheme.list.length - 1) {
              CacheHelper.saveEligibility();
              Navigator.pushNamed(context, LoginScreen.routeName);
            } else {
              nextPage();
            }
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Theme.of(context).primaryColor)),
            child: Icon(
              Icons.arrow_forward,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  void nextPage() {
    controller.animateToPage(controller.page!.toInt() + 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  void previousPage() {
    controller.animateToPage(controller.page!.toInt() - 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  void moveToPage(int index) {
    controller.animateToPage(index,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }
}
