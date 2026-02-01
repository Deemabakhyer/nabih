import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../scenes/home_screen.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final idController = TextEditingController();
  final passwordController = TextEditingController();

  var obscurePassword = true.obs;

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void login() {
    if (formKey.currentState!.validate()) {
      // ✅ Login success (mock)
      Get.offAll(() => const HomeScreen());
    }
  }

  @override
  void onClose() {
    idController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
