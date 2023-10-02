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

showLoaderDialogLoading(BuildContext context) {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    content: Row(
      children: [
        const CircularProgressIndicator(),
        Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text("Loading...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
