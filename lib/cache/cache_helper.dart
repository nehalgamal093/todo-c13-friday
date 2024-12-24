import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
 static late final SharedPreferences sharedPref;

 static init() async{
   sharedPref = await SharedPreferences.getInstance();
 }

 static void saveEligibility(){
   sharedPref.setBool('onBoarding',true);
 }

 static bool? getEligibility() {
   return sharedPref.getBool('onBoarding');
 }
}