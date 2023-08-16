import 'package:app_chat_firebase/controllers/UserController.dart';
import 'package:app_chat_firebase/services/auth_firebase.dart';
import 'package:app_chat_firebase/shared/constants/ColorsConstants.dart';
import 'package:app_chat_firebase/shared/helpers/logger.dart';
import 'package:app_chat_firebase/shared/widgets/alert_dialog.dart';
import 'package:app_chat_firebase/shared/widgets/button_login_social.dart';
import 'package:app_chat_firebase/shared/widgets/custom_button.dart';
import 'package:app_chat_firebase/shared/widgets/custom_input.dart';
import 'package:app_chat_firebase/shared/widgets/text_title_widget.dart';
import 'package:app_chat_firebase/views/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SignUpWidget();
  }
}

class _SignUpWidget extends StatefulWidget {
  const _SignUpWidget();

  @override
  State<_SignUpWidget> createState() => __SignUpWidgetState();
}

class __SignUpWidgetState extends State<_SignUpWidget> {
  final userController = Get.put(UserController());
  final FirebaseServices _firebaseServices = FirebaseServices();

  Future<void> signUp() async {
    try {
      dynamic res = await _firebaseServices.createUserwithEmailandPassword(
          userController.email.value, userController.password.value);
      Get.snackbar(
        'Đăng ký thành công!',
        'Chúc mừng bạn đã là thành viên Young Team',
        backgroundColor: ColorsConstants.light200,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    } catch (e) {
      Get.snackbar(
        'Đăng ký không thành công!',
        'Tài khoản đã tồn tại',
        backgroundColor: Colors.red[700],
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
      Get.delete<UserController>(force: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Column(
          children: [
            Image.asset('assets/images/robot_stars.png'),
            TextTitleWidget(text: "Create your Account"),
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
                  signUp();
                },
                accentColor: ColorsConstants.light200,
                text: "Sign up"),
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
            ),
            ButtonLoginSocial(
              icon: 'assets/images/google_sign_in.png',
              text: 'Login with Google',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                      color: ColorsConstants.gray200,
                      fontSize: 14,
                      decoration: TextDecoration.none),
                ),
                GestureDetector(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        color: ColorsConstants.light200,
                        fontSize: 14,
                        decoration: TextDecoration.none),
                  ),
                  onTap: () {
                    Get.to(const SignInScreen());
                  },
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
