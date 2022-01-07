import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/login_page.dart';

import 'features/ecommerce/presentation/pages/tab_bar_page.dart';

void main() {
  runApp(
    CupertinoApp(
      title: "eCommerce Sample",
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginPage(),
        "/main": (context) => const TabBarPage(),
      },
      theme: CupertinoThemeData(
        textTheme: _textTheme,
        scaffoldBackgroundColor: _mainColor,
        primaryColor: _mainColor,
        brightness: Brightness.light,
        primaryContrastingColor: Colors.black,
        barBackgroundColor: Colors.white,
      ),
    ),
  );
}

final Color _mainColor = Color(0xFFF9F9F9);

final TextStyle _textStyle =
    TextStyle(fontFamily: "Metropolis", color: Colors.black);

final CupertinoTextThemeData _textTheme = CupertinoTextThemeData(
  textStyle: _textStyle,
  actionTextStyle: _textStyle,
  tabLabelTextStyle: _textStyle,
  navTitleTextStyle: _textStyle,
  navLargeTitleTextStyle: _textStyle,
  navActionTextStyle: _textStyle,
  pickerTextStyle: _textStyle,
  dateTimePickerTextStyle: _textStyle,
);
