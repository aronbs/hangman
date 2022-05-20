import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Gamescreen extends StatefulWidget {
  @override
  State<Gamescreen> createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  String? word;
  int guesses = 0;
  int checkIfWordIsDone = 0;
  List<String> selectedLetters = []; //nota þetta fyrir litina?
  List<String> wordList = ['abc', 'flutter', 'batman', 'superman'];
  List<String> chosenWord = [];
  Random random = Random();

  @override
  void initState() {
    super.initState();

    //chosenWord.add(wordList[random.nextInt(wordList.length)].toUpperCase());
    //word = chosenWord[0].toString();
    chosenWord.add(wordList[0].toUpperCase());
    word = chosenWord[0].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white30,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  hangmanImage(guesses >= 0, 'images/Mistake-1.png'),
                  hangmanImage(guesses >= 1, 'images/Mistake-2.png'),
                  hangmanImage(guesses >= 2, 'images/Mistake-3.png'),
                  hangmanImage(guesses >= 3, 'images/Mistake-4.png'),
                  hangmanImage(guesses >= 4, 'images/Mistake-5.png'),
                  hangmanImage(guesses >= 5, 'images/Mistake-6.png'),
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
                                //print(e);
                                //print(word);
                                selectedLetters.add(e);

                                if (word!.contains(e)) {
                                  for (int i = 0; i < word!.length; i++) {
                                    if (word![i].contains(e)) {
                                      checkIfWordIsDone += 1;
                                      //print(checkIfWordIsDone);
                                    }
                                  }
                                  if (checkIfWordIsDone == word!.length) {
                                    print('YOU WON!!!');
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
                                  //print(selectedLetters);

                                  //print('bebe');
                                } else {
                                  //print('loser');
                                  guesses++;
                                  //print(guesses);
                                  if (guesses == 6) {
                                    print('gameover');
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
                                            Text('WRONG!'),
                                          ],
                                        ),
                                        actions: [
                                          Center(
                                            child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    wordList.removeAt(0);
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
      visible: hidden,
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

Widget hangmanImage(bool visible, String path) {
  return Visibility(
      visible: visible,
      child: Container(
        width: 250,
        height: 250,
        child: Image.asset(path),
      ));
}