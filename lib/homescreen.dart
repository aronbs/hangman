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
        backgroundColor: Colors.blue,
        title: Text('Hangman'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/Injustice-3-Marvel-vs-DC-Characters-Fighting-Game.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: Column(
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
            ReusableCard(
                text: Text(
                  'About',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: kReusableCardTextSize,
                  ),
                ),
                onpress: () {
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.blue,
                      title: Text(
                        'Try to guess the superhero or villain from the DC and Marvel universe!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 50.0),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
