import 'package:cimb_technical_test/src/utils/pallete.dart';
import 'package:flutter/material.dart';

const bxShadow = [
  BoxShadow(
    color: Colors.black12,
    blurRadius: 6.0,
    offset: Offset(0, 2),
  ),
];

const InputDecoration kInputDecor = InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Palette.cGreen, width: 0.8),
    ),
    filled: true,
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Palette.cRed, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey, width: 0.8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Palette.cRed, width: 0.8),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 0.8),
    ),
    isCollapsed: true,
    contentPadding: EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 8,
    ));

const String emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

const String passwordPattern =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
