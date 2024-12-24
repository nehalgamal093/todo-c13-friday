import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c13_friday/cache/cache_helper.dart';
import 'package:todo_c13_friday/providers/my_provider.dart';
import 'package:todo_c13_friday/screens/create_event.dart';
import 'package:todo_c13_friday/screens/home/home.dart';
import 'package:todo_c13_friday/screens/introduction_screen.dart';
import 'package:todo_c13_friday/screens/login_screen.dart';
import 'package:todo_c13_friday/screens/onboarding_screen/onboarding_screen.dart';
import 'package:todo_c13_friday/screens/register_screen.dart';
import 'package:todo_c13_friday/theme/dark_theme.dart';
import 'package:todo_c13_friday/theme/light_theme.dart';
import 'package:todo_c13_friday/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    BaseTheme lightTheme = LightTheme();
    BaseTheme darkTheme = DarkTheme();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: lightTheme.themeData,
      darkTheme: darkTheme.themeData,
      themeMode: provider.themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute:IntroductionScreen.routeName,
      routes: {
        IntroductionScreen.routeName: (context) => IntroductionScreen(),
        LoginScreen.routeName: (context) =>CacheHelper.getEligibility() ==true? LoginScreen():OnBoardingScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        CreateEvent.routeName: (context) => CreateEvent()
      },
    );
  }
}
