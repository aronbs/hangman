import 'package:flutter/material.dart';
import 'package:hangman/gamescreen.dart';
import 'reusable_card.dart';
import 'constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hangman'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ReusableCard(
            text: Text(
              'Start Game!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: kReusableCardTextSize,
              ),
            ),
            onpress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Gamescreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
