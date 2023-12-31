import 'package:app_chat_firebase/controllers/UserController.dart';
import 'package:app_chat_firebase/services/auth_firebase.dart';
import 'package:app_chat_firebase/shared/constants/ColorsConstants.dart';
import 'package:app_chat_firebase/shared/widgets/button_login_social.dart';
import 'package:app_chat_firebase/shared/widgets/custom_button.dart';
import 'package:app_chat_firebase/shared/widgets/custom_input.dart';
import 'package:app_chat_firebase/shared/widgets/text_title_widget.dart';
import 'package:app_chat_firebase/views/home/home_screen.dart';
import 'package:app_chat_firebase/views/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignInWidget();
  }
}

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final userController = Get.put(UserController());
  final FirebaseServices _firebaseServices = FirebaseServices();
  Future<void> signIn() async {
    try {
      dynamic res = await _firebaseServices.signInWithEmailandPassword(
          userController.email.value, userController.password.value);
      Get.snackbar(
        'Đăng nhập thành công!',
        'Chúc mừng bạn đã là thành viên Young Team',
        backgroundColor: ColorsConstants.light200,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      Get.delete<UserController>(force: true);
      Get.to(const HomePageScreen());
    } catch (e) {
      Get.snackbar(
        'Đăng nhập không thành công!',
        'Tài khoản không chính xác',
        backgroundColor: Colors.red[700],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      Get.delete<UserController>(force: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, left: 30, right: 30),
          child: Column(
            children: [
              Image.asset('assets/images/robot_amazing.jpg'),
              TextTitleWidget(text: "Login to your Account"),
              CustomTextInput(
                userTyped: (value) {
                  userController.updateEmail(value);
                },
                obscure: false,
                leading: Icons.email,
                hintText: 'Email',
              ),
              CustomTextInput(
                userTyped: (value) {
                  userController.updatePassword(value);
                },
                obscure: true,
                leading: Icons.password,
                hintText: 'Password',
              ),
              CustomButton(
                  onpress: () {
                    signIn();
                  },
                  accentColor: ColorsConstants.light200,
                  text: "Sign in"),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Container(
                    color: ColorsConstants.gray200,
                    height: 1,
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'or continue with',
                    style: TextStyle(
                        color: ColorsConstants.gray200,
                        fontSize: 14,
                        decoration: TextDecoration.none),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    color: ColorsConstants.gray200,
                    height: 1,
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonLoginSocial(
                icon: 'assets/images/facebook.png',
                text: 'Login with Facebook',
                onpress: () {},
              ),
              ButtonLoginSocial(
                icon: 'assets/images/google_sign_in.png',
                text: 'Login with Google',
                onpress: () {
                  _firebaseServices.signInWithGoogle();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an account?',
                    style: TextStyle(
                        color: ColorsConstants.gray200,
                        fontSize: 14,
                        decoration: TextDecoration.none),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const SignUpScreen());
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          color: ColorsConstants.light200,
                          fontSize: 14,
                          decoration: TextDecoration.none),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
