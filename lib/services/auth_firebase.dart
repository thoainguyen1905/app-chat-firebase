import 'dart:async';

import 'package:app_chat_firebase/shared/helpers/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> getToken() async {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        logger.w('User is currently signed out!');
      } else {
        logger.w('User is signed in!');
      }
    });
  }

  Future<void> getCurrentUser() async {
    dynamic current = FirebaseAuth.instance.currentUser;
    logger.w(current);
  }

  Future<void> authStateChanges() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        logger.w('User is currently signed out!');
      } else {
        logger.w('User is signed in!');
      }
    });
  }

  Future<UserCredential> signInWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      logger.w(e);
      throw Exception(e.code);
    }
  }

  Future<UserCredential> createUserwithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        logger.w('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        logger.w('The account already exists for that email.');
      }
      return throw Exception(e);
    } catch (e) {
      logger.w(e);
      return throw Exception(e);
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
