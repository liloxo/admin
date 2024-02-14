import 'package:flutter/material.dart';
import 'color.dart';

ThemeData themeEnglish = ThemeData(
  appBarTheme: const AppBarTheme(color: AppColor.primaryColor),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColor.primaryColor),
        fontFamily: "PlayfairDisplay",
        primarySwatch: Colors.blue,
        textTheme:  const TextTheme(
            displayLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColor.black),
            displayMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: AppColor.black),
            bodyLarge: TextStyle(
                height: 2,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14)),
      );

ThemeData themeArabic = ThemeData(
        fontFamily: "Cairo",
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColor.black),
            displayMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: AppColor.black),
            bodyLarge: TextStyle(
                height: 2,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14)),
      );