import 'package:cimb_technical_test/src/utils/pallete.dart';
import 'package:cimb_technical_test/src/view/appstate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page404 extends StatelessWidget {
  const Page404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Nothing to see here!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50, color: Palette.cRed),
            ),
            TextButton(
                onPressed: () => context.read<AppState>().setActivepage(0),
                child: const Text("Back to posts screen"))
          ],
        ),
      ),
    );
  }
}
