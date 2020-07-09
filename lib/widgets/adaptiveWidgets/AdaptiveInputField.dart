import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveInputField extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final Function handler;

  AdaptiveInputField({this.placeholder, this.controller, this.handler});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            placeholder: placeholder,
            controller: controller,
          )
        : TextField(
            decoration: InputDecoration(labelText: placeholder),
            controller: controller,
          );
  }
}
