import 'package:get/get.dart';

class UserController extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString phone = ''.obs;
  RxString name = ''.obs;
  RxString photo = ''.obs;
  RxString uid = ''.obs;
  void updateEmail(String value) {
    email.value = value;
    update();
  }

  void updatePassword(String value) {
    password.value = value;
    update();
  }

  void updatePhone(dynamic value) {
    phone.value = value;
    update();
  }

  void updateName(String value) {
    name.value = value;
    update();
  }

  void updatePhoto(String value) {
    photo.value = value;
    update();
  }

  void setUser(dynamic userData) {
    email.value = userData.email ?? "";
    phone.value = userData.phoneNumber ?? "";
    name.value = userData.displayName ?? "";
    photo.value = userData.photoURL ?? "";
    uid.value = userData.uid ?? "";
  }
}
