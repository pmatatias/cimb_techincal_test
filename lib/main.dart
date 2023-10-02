import 'package:cimb_technical_test/src/view/appstate.dart';
import 'package:cimb_technical_test/src/view/auth/login.dart';
import 'package:cimb_technical_test/src/view/favorites/fav_state.dart';
import 'package:cimb_technical_test/src/view/home.dart';
import 'package:cimb_technical_test/src/view/posts/post_state.dart';
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
        ChangeNotifierProvider(create: (context) => AppState()),
        ChangeNotifierProvider(create: (context) => PostState()),
        ChangeNotifierProxyProvider<PostState, FavState>(
          create: (context) => FavState(),
          update: (context, value, previous) {
            if (previous == null) throw ArgumentError.notNull('posts');
            previous.posts = value.postList;
            return previous;
          },
        ),
      ],
      child: MaterialApp(
        title: 'CIMB Technical Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}
