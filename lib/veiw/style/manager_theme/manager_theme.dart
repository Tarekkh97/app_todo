// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:todo_app/veiw/style/manager_colors/manager_colors.dart';

class apptheme {
  static final ThemeData ligththeme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: colorstyle.white,
      unselectedItemColor: colorstyle.darkgrey,
      selectedIconTheme: const IconThemeData(size: 30),
      unselectedIconTheme: const IconThemeData(size: 18),
      backgroundColor: colorstyle.primary,
    ),
    scaffoldBackgroundColor: colorstyle.white,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        backgroundColor: colorstyle.primary,
        centerTitle: true,
        iconTheme: IconThemeData(color: colorstyle.white)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          backgroundColor: const Color(0xff8875FF)),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            textStyle: TextStyle(color: colorstyle.white))),
  );

  static final ThemeData darktheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: colorstyle.white,
      unselectedItemColor: colorstyle.white,
      selectedIconTheme: const IconThemeData(size: 33),
      unselectedIconTheme: const IconThemeData(size: 18),
      backgroundColor: colorstyle.black,
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: colorstyle.grey,
    appBarTheme: AppBarTheme(
        backgroundColor: colorstyle.black,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: colorstyle.white)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          backgroundColor: const Color(0xff8875FF)),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            textStyle: TextStyle(color: colorstyle.white))),
  );
}
