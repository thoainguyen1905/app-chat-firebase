import 'package:app_chat_firebase/controllers/HomeBinding.dart';
import 'package:app_chat_firebase/services/auth_gate.dart';
import 'package:app_chat_firebase/views/chat/chat_screen.dart';
import 'package:app_chat_firebase/views/home/home_screen.dart';
import 'package:app_chat_firebase/views/profile/profile_screen.dart';
import 'package:app_chat_firebase/views/sign_in/sign_in_screen.dart';
import 'package:app_chat_firebase/views/sign_up/sign_up_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const INITIAL = "/auth_gate";
  static final routes = [
    GetPage(
        name: '/home',
        page: () => const HomePageScreen(),
        binding: HomeBinding()),
    GetPage(name: '/sign_in', page: () => const SignInScreen()),
    GetPage(name: '/profile', page: () => const ProfileScreen()),
    GetPage(name: '/chat', page: () => const ChatScreen()),
    GetPage(name: '/sign_up', page: () => const SignUpScreen()),
    GetPage(name: '/auth_gate', page: () => const AuthGate())
  ];
}
