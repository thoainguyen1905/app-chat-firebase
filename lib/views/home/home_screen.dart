import 'package:app_chat_firebase/shared/widgets/alert_dialog.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        child: CustomDialogWidget(
          des: 'Congratulations',
          errorDialog: true,
        ),
      ),
    );
  }
}
