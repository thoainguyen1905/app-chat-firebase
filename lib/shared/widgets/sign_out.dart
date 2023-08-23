import 'package:app_chat_firebase/services/auth_firebase.dart';
import 'package:app_chat_firebase/shared/constants/ColorsConstants.dart';
import 'package:app_chat_firebase/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignOutWidget extends StatefulWidget {
  const SignOutWidget({super.key});

  @override
  State<SignOutWidget> createState() => _SignOutWidgetState();
}

class _SignOutWidgetState extends State<SignOutWidget> {
  final FirebaseServices _firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: const Icon(Icons.output),
        onTap: () => showDialog<String>(
              context: context,
              useSafeArea: true,
              builder: (BuildContext context) => AlertDialog(
                title: Image.asset('assets/images/robot_sab.png'),
                content: Column(
                  children: [
                    const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Are you sure you want to log out?'),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        _firebaseServices.signOut();
                        Navigator.pop(context, 'OK');
                        Get.to(const HomePageScreen());
                      },
                      child: const Center(
                        child: Text('Yes, Logout'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'Cancel');
                      },
                      style: OutlinedButton.styleFrom(
                          foregroundColor: ColorsConstants.light200,
                          backgroundColor: ColorsConstants.light100),
                      // style: const ButtonStyle(
                      //     backgroundColor: MaterialStateColor.resolveWith(
                      //         (states) => ColorsConstants.light100)),
                      child: const Text('Cancel'),
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              ),
            ));
  }
}
