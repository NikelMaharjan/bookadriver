

import 'package:book_a_driver/consts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DateTimePicker extends StatelessWidget {

  final TextEditingController? datetimeController;
  final String hint;
  final String icon;
  final VoidCallback onTap;
   const DateTimePicker({Key? key,
    required this.icon,
    required this.hint,
     this.datetimeController,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: whiteColor,
      child: TextField(
        controller: datetimeController,
        readOnly: true,
        onTap: onTap,
        decoration:  InputDecoration(
          suffixIconConstraints: BoxConstraints(
              minHeight: 8,
              minWidth: 8
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(icon,
            ),
          ),
          border: OutlineInputBorder(
          ),
          hintText: hint,
        ),
      ),
    );
  }
}
