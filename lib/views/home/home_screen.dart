import 'package:app_chat_firebase/services/auth_firebase.dart';
import 'package:app_chat_firebase/shared/constants/ColorsConstants.dart';
import 'package:app_chat_firebase/shared/widgets/navigator_bottom.dart';
import 'package:app_chat_firebase/views/home/widgets/list_user.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home Page'),
      // ),
      appBar: null,
      backgroundColor: ColorsConstants.light100,
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const ListUsers(),
      )),
      bottomNavigationBar: const NavigatorBottom(),
    );
  }
}
