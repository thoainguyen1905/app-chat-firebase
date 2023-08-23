import 'package:app_chat_firebase/views/profile/widgets/info.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        // height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, right: 40, left: 40),
        child: SingleChildScrollView(
          child: Container(
            child: const InfoWidget(),
          ),
        ),
      ),
    );
  }
}
