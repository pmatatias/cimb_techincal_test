import 'package:flutter/material.dart';

class ParamRequired extends StatelessWidget {
  const ParamRequired({super.key, required this.param});
  final String param;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: RichText(
        text: TextSpan(
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: param),
              const TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
            ]),
      ),
    );
  }
}
