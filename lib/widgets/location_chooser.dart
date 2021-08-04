
import 'package:flutter/material.dart';

class LocationChooser extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final IconData icon;

  final FocusNode? focusNode;

  const LocationChooser({
    Key? key,
    required this.controller,
    required this.name,
    required this.icon,
    this.focusNode,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),

          labelText: name,),
    );
  }
}
