import 'package:flutter/material.dart';

class SignOutWidget extends StatefulWidget {
  const SignOutWidget({super.key});

  @override
  State<SignOutWidget> createState() => _SignOutWidgetState();
}

class _SignOutWidgetState extends State<SignOutWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: const Text('AlertDialog Title'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Image.asset(
        'assets/images/robot_amazing.jpg',
        height: 150,
        width: MediaQuery.of(context).size.width * 0.6,
      ),
      content:
          const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Logout ? ',
          style: TextStyle(
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
