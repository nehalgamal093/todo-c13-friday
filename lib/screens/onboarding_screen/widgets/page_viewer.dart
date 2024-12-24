import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../providers/dark_light_theme.dart';
import '../../../providers/onboarding_index.dart';

class PageViewer extends StatelessWidget {
  final PageController controller;
  final LightOrDarkTheme lightOrDarkTheme;
  final OnBoardingIndexProvider indexProvider;
  final Size size;
  const PageViewer(
      {super.key,
      required this.controller,
      required this.lightOrDarkTheme,
      required this.indexProvider,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
          controller: controller,
          itemCount: lightOrDarkTheme.list.length,
          onPageChanged: (index) {
            indexProvider.changeIndex(index);
          },
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                height: size.height * .9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 48),
                    Image.asset(lightOrDarkTheme.list[index].image,
                        width: size.width * .8, height: size.height * .4),
                    const SizedBox(height: 38),
                    Text(
                      lightOrDarkTheme.list[index].title.tr(),
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: context.locale.languageCode == "en"
                          ? TextAlign.left
                          : TextAlign.right,
                    ),
                    const SizedBox(height: 39),
                    Text(
                      lightOrDarkTheme.list[index].desc.tr(),
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: context.locale.languageCode == "en"
                          ? TextAlign.left
                          : TextAlign.right,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
