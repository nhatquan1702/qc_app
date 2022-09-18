import 'package:chat_app/constant/color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primaryColor: ConstantColor.mainPrimaryDark,
        cardColor: ConstantColor.myContentColorDarkTheme,
        canvasColor: ConstantColor.myContentColorLightTheme,
        //font
        //fontFamily: ,
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primaryColor: ConstantColor.mainPrimaryDark,
        brightness: Brightness.dark,
        cardColor: ConstantColor.myContentColorLightTheme,
        canvasColor: ConstantColor.myContentColorDarkTheme
        //font
        //fontFamily: ,
      );
}