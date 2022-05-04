import 'package:flutter/material.dart';
import 'constants.dart';
import 'option_cards.dart';
import 'single_player_gamescreen.dart';

enum Category {
  marvel,
  dogs,
  tv,
  sports,
  games,
  music,
}

class SinglePlayerOptions extends StatelessWidget {
  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              'Pick a category',
              style: TextStyle(
                fontSize: 50.0,
              ),
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OptionCards(
                  text: Text(
                    'Marvel Movies',
                    style: TextStyle(
                      fontSize: kOptionCardTextSize,
                    ),
                  ),
                  onpress: () {
                    selectedCategory = Category.marvel;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SinglePlayer(1),
                      ),
                    );
                  }),
              OptionCards(
                  text: Text(
                    'Dog Breeds',
                    style: TextStyle(
                      fontSize: kOptionCardTextSize,
                    ),
                  ),
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SinglePlayer(2),
                      ),
                    );
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OptionCards(
                  text: Text(
                    'Computer Games',
                    style: TextStyle(
                      fontSize: kOptionCardTextSize,
                    ),
                  ),
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SinglePlayer(3),
                      ),
                    );
                  }),
              OptionCards(
                  text: Text(
                    'Sports',
                    style: TextStyle(
                      fontSize: kOptionCardTextSize,
                    ),
                  ),
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SinglePlayer(4),
                      ),
                    );
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OptionCards(
                  text: Text(
                    'TV shows',
                    style: TextStyle(
                      fontSize: kOptionCardTextSize,
                    ),
                  ),
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SinglePlayer(5),
                      ),
                    );
                  }),
              OptionCards(
                  text: Text(
                    'Music Artists',
                    style: TextStyle(
                      fontSize: kOptionCardTextSize,
                    ),
                  ),
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SinglePlayer(6),
                      ),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
