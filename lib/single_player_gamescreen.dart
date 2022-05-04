import 'package:flutter/material.dart';
import 'single_player_word_options.dart';

class SinglePlayer extends StatefulWidget {
  SinglePlayer(this.number);
  int number;

  List<String>? categoryListSelection(int number) {
    if (number == 1) {
      List<String> marvel = ['eikka', 'anna', 'test'];
      return marvel;
    } else if (number == 2) {
      List<String> dogBreed = ['chiuahua', 'labbi', 'bc'];
      return dogBreed;
    } else if (number == 3) {
      List<String> games = ['halo', 'minecraft'];
      return games;
    } else if (number == 4) {
      List<String> sport = ['bolti', 'karfa'];
      return sport;
    } else if (number == 5) {
      List<String> tvShow = ['friends', 'himym'];
      return tvShow;
    } else if (number == 6) {
      List<String> music = ['akon', 'eminem'];
      return music;
    }
  }

  @override
  State<SinglePlayer> createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                CustomPaint(
                  child: Container(
                    color: Colors.white,
                    width: 300.0,
                    height: 350.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
