import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

Future <DateTime?> chooseTimePicker(BuildContext context) async{
  final DateTime? date;

  date = await DatePicker.showTimePicker(context,
     showTitleActions: true,
      onConfirm: (date) {
        date = date;
      },
      currentTime: DateTime.now());
  return date;
}