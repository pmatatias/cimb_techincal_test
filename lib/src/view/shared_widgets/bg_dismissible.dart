import 'package:cimb_technical_test/src/utils/pallete.dart';
import 'package:flutter/material.dart';

class BGDissmissible extends StatelessWidget {
  final String text;
  final Color background;
  const BGDissmissible(
      {Key? key, this.text = 'Remove', this.background = Palette.cRed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.only(right: 20),
      color: background,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
