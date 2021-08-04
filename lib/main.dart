import 'package:book_a_driver/consts/app_colors.dart';
import 'package:book_a_driver/screens/driver_book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: whiteColor,
        textTheme: Theme.of(context).textTheme.copyWith(
          bodyText2: TextStyle(
            fontSize: 16.0,
          fontFamily: 'Mulish',
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Mulish'
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            primary: buttonColor,
          )
        )
      ),
      home: DriverBook(),
    );
  }
}
