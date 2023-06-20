import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcheck/core/apptheme/light_theme_data.dart';
import 'package:goldcheck/view/density_test/silver_density_test_screen.dart';
import 'package:goldcheck/view/help_screen.dart';
import 'package:goldcheck/view/home/home_screen.dart';
import 'package:goldcheck/view/onboard/onboard_screen.dart';
import 'package:goldcheck/view/onboard/onboard_start_screen.dart';
import 'package:goldcheck/view/splash_screen.dart';
import 'package:goldcheck/view_model/home_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();

  final sharedPref=await SharedPreferences.getInstance();
  bool onboardSkip=sharedPref.getBool('onboardSkip')?? false;

  runApp(MyApp(onboardSkip: onboardSkip,));

}

class MyApp extends StatelessWidget {
   MyApp({super.key,required this.onboardSkip});

  bool onboardSkip;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    print(onboardSkip);
    // SystemChrome.setEnabledSystemUIOverlays([]); // hide status bar
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values); // show status bar


    return MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeViewModel>(create: (context)=>HomeViewModel(context)),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'gold check',
        theme: getAppLightTheme(context),
        home: SplashScreen(onboardSkip: onboardSkip,),
      ),
      );

  }
}
