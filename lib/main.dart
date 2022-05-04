import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'single_player_gamescreen.dart';
import 'single_player_word_options.dart';
import 'multiplayer_gamescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
/*
initialRoute: 'homescreen',
      routes: {
        'homescreen': (context) => HomeScreen(),
        'singleplayer': (context) => SinglePlayer(),
        'multiplayer': (context) => MultiPlayer(),
        'singleplayeroptions': (context) => SinglePlayerOptions(),
 */
