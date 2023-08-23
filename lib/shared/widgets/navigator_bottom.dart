import 'package:app_chat_firebase/services/auth_firebase.dart';
import 'package:app_chat_firebase/shared/constants/ColorsConstants.dart';
import 'package:app_chat_firebase/shared/helpers/logger.dart';
import 'package:app_chat_firebase/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavigatorBottom extends StatefulWidget {
  const NavigatorBottom({super.key});

  @override
  State<NavigatorBottom> createState() => _NavigatorBottomState();
}

class _NavigatorBottomState extends State<NavigatorBottom> {
  var _currentIndex = 0;
  final FirebaseServices _firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: _currentIndex,
      onTap: (i) {
        setState(() => _currentIndex = i);
        logger.w(i);
        if (i == 3) {
          _firebaseServices.signOut();
          Get.toNamed('/sign_in');
        }
      },
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: const Icon(Icons.chat),
          title: const Text("Home"),
          selectedColor: ColorsConstants.light200,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: const Icon(Icons.favorite_border),
          title: const Text("Likes"),
          selectedColor: Colors.pink,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: GestureDetector(
            onTap: () {
              Get.to(const ProfileScreen());
            },
            child: const Icon(Icons.person),
          ),
          title: GestureDetector(
            onTap: () {},
            child: const Text("Profile"),
          ),
          selectedColor: Colors.teal,
        ),

        /// Sign out
        SalomonBottomBarItem(
          icon: const Icon(Icons.output),
          title: GestureDetector(
            onTap: () {},
            child: const Text("Sign Out"),
          ),
          selectedColor: Colors.orange,
        ),
      ],
    );
  }
}
