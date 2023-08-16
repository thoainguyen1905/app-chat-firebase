import 'package:get/get.dart';

class UserController extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;
  void updateEmail(String value) {
    email.value = value;
    update();
  }

  void updatePassword(String value) {
    password.value = value;
    update();
  }
}
