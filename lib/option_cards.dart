import 'package:flutter/material.dart';

class OptionCards extends StatelessWidget {
  OptionCards({required this.text, required this.onpress});

  final Widget text;
  final void Function() onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Card(
        elevation: 10.0,
        margin: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 10.0),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: text,
          ),
        ),
      ),
    );
  }
}
