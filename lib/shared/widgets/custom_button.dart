import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color accentColor;
  final Color? mainColor;
  final String text;
  final Function()? onpress;
  const CustomButton(
      {super.key,
      required this.accentColor,
      required this.text,
      this.mainColor,
      this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            border: Border.all(color: accentColor, width: 2),
            color: accentColor,
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 16,
                decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
