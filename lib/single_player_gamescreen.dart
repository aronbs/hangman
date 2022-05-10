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
  String word = 'Avengers infinity War';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.green,
              child: GridView.count(
                crossAxisCount: 7,
                children: word
                    .split('')
                    .map((e) => letter(e.toUpperCase(), false))
                    .toList(),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 7
                        : 11,
                children: alphabet.map((e) {
                  return RawMaterialButton(
                    fillColor: Colors.blue,
                    onPressed: () {
                      print(e);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      e,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> alphabet = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];

Widget letter(String character, bool hidden) {
  return Container(
    margin: EdgeInsets.all(2),
    //height: 65.0,
    //width: 50.0,
    padding: EdgeInsets.all(3.0),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(4.0),
    ),
    child: Visibility(
      visible: !hidden,
      child: Center(
        child: Text(
          character,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
            fontSize: 35.0,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
