import 'package:cimb_technical_test/src/view/appstate.dart';
import 'package:cimb_technical_test/src/view/auth/login.dart';
import 'package:cimb_technical_test/src/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppState(),
        )
      ],
      child: MaterialApp(
        title: 'CIMB Technical Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
