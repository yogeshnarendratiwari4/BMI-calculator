import 'package:flutter/material.dart';
import 'Screen/input_page.dart';

void main() {
  runApp( MaterialApp(
    theme: ThemeData.dark().copyWith(
      primaryColor: const Color(0xFF0A0E21),
      scaffoldBackgroundColor: const Color(0xFF0A0E21),
      // accentColor: Colors.purple,
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
        )
      ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.purple)
    ),
    home: const InputPage(
    ),
  ));
}

