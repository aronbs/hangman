import 'package:flutter/material.dart';
import 'dart:math';
import 'visability_functions.dart';
import 'dart:core';

class Gamescreen extends StatefulWidget {
  @override
  State<Gamescreen> createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  String? word;
  String? description;
  int guesses = 0;
  int checkIfWordIsDone = 0;
  List<String> selectedLetters = [];
  List<String> chosenWord = [];
  List<String> finishedWords = [];

  @override
  void initState() {
    super.initState();

    wordList.shuffle();
    chosenWord.add(wordList[0][0].toUpperCase());
    word = chosenWord[0].toString();
    description = wordList[0][1].toString().toUpperCase();
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
              child: Container(
            width: double.infinity,
            child: Center(
              child: Text(
                '$description',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            color: Colors.white30,
          )),
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
                                                    wordList.add(
                                                        [word, description]);
                                                    chosenWord.clear();
                                                    chosenWord.add(wordList[0]
                                                            [0]
                                                        .toUpperCase());
                                                    word = chosenWord[0]
                                                        .toString();
                                                    selectedLetters.clear();
                                                    checkIfWordIsDone = 0;
                                                    guesses = 0;
                                                    description = wordList[0][1]
                                                        .toString()
                                                        .toUpperCase();
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
                                                    wordList.add(
                                                        [word, description]);
                                                    chosenWord.clear();
                                                    chosenWord.add(wordList[0]
                                                            [0]
                                                        .toUpperCase());
                                                    word = chosenWord[0]
                                                        .toString();
                                                    selectedLetters.clear();
                                                    checkIfWordIsDone = 0;
                                                    guesses = 0;
                                                    description =
                                                        wordList[0][1];
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

List wordList = [
  ['thanos', 'the mad titan'],
  ['death', 'was in love with deadpool in the comics'],
  ['galactus', 'consumes planets'],
  ['mephisto', 'extra-dimensional demon'],
  ['ego', 'is a planet'],
  ['dormammu', 'lives within the dark dimension'],
  ['surtur', 'a fire demon'],
  ['ultron', 'is a robot'],
  ['hyperion', 'member of squadron sinister'],
  ['thor', 'has a weapon that few people can wield'],
  ['hulk', ''],
  ['loki', 'a cunning trickster'],
  ['odin', 'god of wisdom, poetry and death'],
  ['deadpool', 'disfigured mercenary'],
  ['magneto', 'a mutant'],
  ['hercules', 'considered the physically strongest character in marvel'],
  ['nova', 'called the human rocket'],
  ['thing', 'is a part of a four man team'],
  ['vision', 'has one of the infinity stones'],
  ['namor', 'likes the sea'],
  ['colussus', 'is big and strong'],
  ['storm', 'has white hair'],
  ['rouge', 'can absorb powers'],
  ['iceman', 'brrrr'],
  ['cyclops', 'has really powerful eyes'],
  ['beast', 'this one is blue'],
  ['antman', 'can get pretty small'],
  ['wasp', 'has wings'],
  ['batman', 'a great detective'],
  ['superman', 'came to earth when he was a small child'],
  ['joker', 'laughs alot'],
  ['robin', 'leader and founder of the teen titans'],
  ['batwoman', 'one of batman\'s allies'],
  ['stargirl', 'the proud wielder of the cosmic staff'],
  ['darkseid', 'one of superman\'s toughest enemy'],
  ['aquaman', 'can breathe underwater'],
  ['kilowog', 'a green lantern'],
  ['sinestro', 'a good guy turned bad'],
  ['krypto', 'a dog'],
  ['zatanna', 'magician in the dc universe'],
  ['bane', 'broke batman\'s back'],
  ['bizarro', 'superman\'s enemy'],
  ['deadshot', 'has great accuracy'],
  ['starfire', 'a member of the teen titans'],
  ['catwoman', 'has a whip'],
  ['venom', 'one of spiderman\'s nemesis'],
  ['penguin', 'one of batman\'s nemesis '],
  ['brainiac', 'super intelligent alien being from the planet colu'],
  ['flash', 'fastest man alive'],
  ['nebula', 'part robot'],
  ['mystique', 'can transform into anybody'],
  ['gamora', 'daughter of thanos'],
];
