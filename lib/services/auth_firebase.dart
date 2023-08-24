import 'dart:async';

import 'package:app_chat_firebase/controllers/UserController.dart';
import 'package:app_chat_firebase/services/notificaition_firebase.dart';
import 'package:app_chat_firebase/shared/helpers/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final userController = Get.put(UserController());
  final NotificationFirebase _notificationFirebase = NotificationFirebase();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> getToken() async {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        logger.w('User is currently signed out!');
      } else {
        logger.w('User is signed in!');
      }
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      //  await _firebaseFirestore
      //       .collection('users')
      //       .doc(credential.user!.uid)
      //       .set({'uid': credential.user!.uid, 'email': email});
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      logger.w(e);
      return throw Exception(e);
    }
  }

  Future<void> getCurrentUser() async {
    dynamic current = FirebaseAuth.instance.currentUser;
    if(current != null) {
    userController.setUser(current);
    }
  }

  Future<void> updateInforUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    logger.w(user);
    if (user != null) {
      await user.updateDisplayName(userController.name.value);
      await user.updateEmail(userController.email.value);
      // await user.updatePhoneNumber(userController.phone.value);
      await user.updatePhotoURL(userController.photo.value);
      logger.w(userController.email.value);
    }
    // if (user != null) {
    //   String uid = user.uid;
    //   DocumentReference userRef =
    //       FirebaseFirestore.instance.collection('users').doc(uid);
    //   Map<String, dynamic> newData = {
    //     'email': userController.email.value,
    //     'phoneNumber': userController.phone.value,
    //     'photoURL': userController.photo.value,
    //     'displayName': userController.name.value
    //   };
    //   logger.w(newData);
    //   userRef.set(newData, SetOptions(merge: true));
    // }
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
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      await _firebaseFirestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'uid': userCredential.user!.uid,
        'email': email,
        // 'tokenDevice': _notificationFirebase.getToken()
      }, SetOptions(merge: true));
      return userCredential;
    } on FirebaseAuthException catch (e) {
      logger.w(e);
      throw Exception(e.code);
    }
  }

  Future<void> userInformation() async {
    CollectionReference users = _firebaseFirestore.collection('users');
    logger.w(users);
  }

  Future<UserCredential> createUserwithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await _firebaseFirestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'uid': userCredential.user!.uid,
        'email': email,
        // 'tokenDevice': _notificationFirebase.getToken()
      });
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
