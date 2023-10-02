import 'package:cimb_technical_test/src/utils/pallete.dart';
import 'package:flutter/material.dart';

void showMessenger(BuildContext context, String msg,
    {Color bgColor = Palette.cBlue}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
      backgroundColor: bgColor,
    ),
  );
}
