import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

Future <DateTime?> chooseDatePicker(BuildContext context) async{
  final DateTime? date;

  date = await DatePicker.showDatePicker(context,
      showTitleActions: true,
      minTime: DateTime(2021, 1, 5),
      maxTime: DateTime(2021, 12, 7),
      onConfirm: (date) {
        date = date;
      },
      currentTime: DateTime.now());
   return date;
}