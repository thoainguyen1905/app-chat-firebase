import 'package:app_chat_firebase/services/auth_firebase.dart';
import 'package:app_chat_firebase/shared/widgets/alert_dialog.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePageScreen extends StatelessWidget {
  HomePageScreen({super.key});
  FirebaseServices _firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(children: [
        GestureDetector(
          onTap: () {
            _firebaseServices.signOut();
          },
          child: const Text("Sign out"),
        ),
        GestureDetector(
          onTap: () {
            _firebaseServices.userInformation();
          },
          child: const Text("get"),
        ),
      ]),
    );
  }
}
