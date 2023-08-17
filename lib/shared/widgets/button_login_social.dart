import 'package:app_chat_firebase/shared/constants/ColorsConstants.dart';
import 'package:flutter/material.dart';

class ButtonLoginSocial extends StatefulWidget {
  ButtonLoginSocial(
      {super.key,
      required this.icon,
      required this.text,
      required this.onpress});
  String icon = '';
  String text;
  Function onpress;
  @override
  State<ButtonLoginSocial> createState() =>
      _ButtonLoginSocialState(icon: icon, text: text);
}

class _ButtonLoginSocialState extends State<ButtonLoginSocial> {
  _ButtonLoginSocialState({required this.icon, required this.text});
  String icon = '';
  String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onpress();
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            border: Border.all(color: ColorsConstants.gray200, width: 1),
            color: Colors.white,
            borderRadius: BorderRadius.circular(50)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(8),
            child: Image.asset(icon),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text.toString(),
            style: const TextStyle(
                fontFamily: 'Roboto-300',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none),
          ),
        ]),
      ),
    );
  }
}
