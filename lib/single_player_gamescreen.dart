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
                  //foregroundPainter: DemoForegroundPainter(),
                  //painter: DemoPainter(),
                  child: Container(
                    color: Colors.white,
                    width: 300.0,
                    height: 350.0,
                  ),
                ),
              ],
            ),
            GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              // Generate 100 widgets that display their index in the List.
              children: List.generate(10, (index) {
                return Center(
                  child: Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
