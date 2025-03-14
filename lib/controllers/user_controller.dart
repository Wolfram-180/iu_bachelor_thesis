import 'package:get/get.dart';

class UserController extends GetxController {
  var isLoggedIn = false.obs;

  void toggleLogin() {
    isLoggedIn.value = !isLoggedIn.value;
  }
}
