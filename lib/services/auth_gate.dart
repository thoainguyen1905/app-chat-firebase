import 'package:app_chat_firebase/views/home/home_screen.dart';
import 'package:app_chat_firebase/views/sign_in/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePageScreen();
            } else {
              return const SignInScreen();
            }
          }),
    );
  }
}
