import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_light_color.dart';


  ThemeData getAppLightTheme(context) => ThemeData(
      primaryColor: primaryColor,
      primaryColorLight: secondaryColor,
      primaryColorDark: backgroundDark,
      scaffoldBackgroundColor: secondaryColor,
      appBarTheme: AppBarTheme(color: secondaryColor,iconTheme: IconThemeData(color: thirdColor)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor:primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
      textTheme: TextTheme(
          titleSmall: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 19),
          bodySmall: GoogleFonts.poppins(fontSize:17,color:thirdColor )));

