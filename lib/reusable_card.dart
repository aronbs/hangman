import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.text, required this.onpress});

  final Widget text;
  final void Function() onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Card(
        color: Colors.blue,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: text,
          ),
        ),
      ),
    );
  }
}
