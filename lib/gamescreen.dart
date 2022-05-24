import 'package:flutter/material.dart';
import 'dart:math';
import 'visability_functions.dart';

class Gamescreen extends StatefulWidget {
  @override
  State<Gamescreen> createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  String? word;
  int guesses = 0;
  int checkIfWordIsDone = 0;
  List<String> selectedLetters = [];
  List<String> chosenWord = [];
  List<String> finishedWords = [];

  @override
  void initState() {
    super.initState();

    wordList.shuffle();
    chosenWord.add(wordList[0].toUpperCase());
    word = chosenWord[0].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white30,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  hangmanImage(guesses >= 0, 'images/Gallows.png'),
                  hangmanImage(guesses >= 1, 'images/Mistake-1.png'),
                  hangmanImage(guesses >= 2, 'images/Mistake-2.png'),
                  hangmanImage(guesses >= 3, 'images/Mistake-3.png'),
                  hangmanImage(guesses >= 4, 'images/Mistake-4.png'),
                  hangmanImage(guesses >= 5, 'images/Mistake-5.png'),
                  hangmanImage(guesses >= 6, 'images/Mistake-6.png'),
                  hangmanImage(
                      checkIfWordIsDone == word!.length, 'images/win.png'),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white30,
              child: Center(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 8,
                  children: word!
                      .split('')
                      .map((e) =>
                          letter(e.toUpperCase(), selectedLetters.contains(e)))
                      .toList(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white30,
              child: Center(
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
                      fillColor: selectedLetters.contains(e)
                          ? Colors.white30
                          : Colors.black,
                      onPressed: selectedLetters.contains(e)
                          ? null
                          : () {
                              setState(() {
                                selectedLetters.add(e);

                                if (word!.contains(e)) {
                                  for (int i = 0; i < word!.length; i++) {
                                    if (word![i].contains(e)) {
                                      checkIfWordIsDone += 1;
                                    }
                                  }
                                  if (checkIfWordIsDone == word!.length) {
                                    guesses = 0;
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        backgroundColor: Colors.blue,
                                        title: Icon(
                                          Icons.check,
                                          color: Colors.green,
                                          size: 100.0,
                                        ),
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('CORRECT!'),
                                          ],
                                        ),
                                        actions: [
                                          Center(
                                            child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    wordList.removeAt(0);
                                                    wordList.add(chosenWord[0]);
                                                    chosenWord.clear();
                                                    chosenWord.add(wordList[0]
                                                        .toUpperCase());
                                                    word = chosenWord[0]
                                                        .toString();
                                                    selectedLetters.clear();
                                                    checkIfWordIsDone = 0;
                                                    guesses = 0;
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Text(
                                                  'Next Word',
                                                  style: TextStyle(
                                                      fontSize: 30.0,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                } else {
                                  guesses++;
                                  if (guesses == 6) {
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        backgroundColor: Colors.blue,
                                        title: Icon(
                                          Icons.clear,
                                          color: Colors.red,
                                          size: 100.0,
                                        ),
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('WRONG!\n The word was $word!')
                                          ],
                                        ),
                                        actions: [
                                          Center(
                                            child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    wordList.removeAt(0);
                                                    wordList.add(chosenWord[0]);
                                                    chosenWord.clear();
                                                    chosenWord.add(wordList[0]
                                                        .toUpperCase());
                                                    word = chosenWord[0]
                                                        .toString();
                                                    selectedLetters.clear();
                                                    checkIfWordIsDone = 0;
                                                    guesses = 0;
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Text(
                                                  'Next Word',
                                                  style: TextStyle(
                                                      fontSize: 30.0,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                }
                              });
                            },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        e,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0,
                            color: Colors.red),
                      ),
                    );
                  }).toList(),
                ),
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

List<String> wordList = [
  'thanos',
  'death',
  'galactus',
  'mephisto',
  'ego',
  'sentry',
  'dormammu',
  'surtur',
  'ultron',
  'hyperion',
  'thor',
  'hulk',
  'loki',
  'odin',
  'eternals',
  'deadpool',
  'magneto',
  'hercules',
  'nova',
  'thing',
  'vision',
  'namor',
  'spectrum',
  'colussus',
  'storm',
  'rouge',
  'iceman',
  'cyclops',
  'beast',
  'antman',
  'wasp',
  'batman',
  'superman',
  'joker',
  'robin',
  'batwoman',
  'stargirl',
  'darkseid',
  'aquaman',
  'kilowog',
  'sinestro',
  'krypto',
  'zatanna',
  'bane',
  'bizarro',
  'deadshot',
  'starfire',
  'catwoman',
  'venom',
  'penguin',
  'brainiac',
  'flash',
  'nebula',
  'mystique',
];
