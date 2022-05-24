import 'package:flutter/material.dart';

Widget hangmanImage(bool visible, String path) {
  return Visibility(
      visible: visible,
      child: Container(
        width: 250,
        height: 250,
        child: Image.asset(path),
      ));
}

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
