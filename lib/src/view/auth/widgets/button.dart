import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.name, this.onPressed});

  final String name;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(16)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          name,
          style: const TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
    );
  }
}
