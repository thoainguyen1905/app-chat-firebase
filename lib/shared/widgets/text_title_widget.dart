import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {
  TextTitleWidget({super.key, required this.text});
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
        text.toString(),
        style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 22,
            color: Colors.black,
            fontFamily: 'Roboto-400',
            decoration: TextDecoration.none),
      ),
    );
  }
}
