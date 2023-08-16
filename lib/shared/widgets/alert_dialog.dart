import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDialogWidget extends StatefulWidget {
  CustomDialogWidget({super.key, required this.des, required this.errorDialog});
  String des = '';
  bool errorDialog = false;

  @override
  // ignore: no_logic_in_create_state
  State<CustomDialogWidget> createState() =>
      _CustomDialogWidgetState(des: des, errorDialog: errorDialog);
}

class _CustomDialogWidgetState extends State<CustomDialogWidget> {
  String des = '';
  bool errorDialog = false;
  _CustomDialogWidgetState({required this.des, required this.errorDialog});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: const Text('AlertDialog Title'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Image.asset(
        errorDialog
            ? 'assets/images/robot_amazing.jpg'
            : 'assets/images/robot_stars.png',
        height: 150,
        width: MediaQuery.of(context).size.width * 0.6,
      ),
      content: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          des,
          style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              fontFamily: 'Roboto-400'),
        ),
      ]),
      // actions: <Widget>[
      //   TextButton(
      //     onPressed: () => Navigator.pop(context, 'Cancel'),
      //     child: const Text('Cancel'),
      //   ),
      //   TextButton(
      //     onPressed: () => Navigator.pop(context, 'OK'),
      //     child: const Text('OK'),
      //   ),
      // ],
    );
  }
}
