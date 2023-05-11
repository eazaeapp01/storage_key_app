import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:storage_key_app/app/constants/app_constants.dart';

import '../../app/routes/routes.dart';
import '../../app/utils/snackbar.dart';
import '../../data/repository/login_repository.dart';
import '../../app/utils/internet_checker.dart';
import '../../data/repository/storage_repository.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Rx<bool?> rememberMe = (null as bool?).obs;
  final obscureValue = true.obs;

  final loading = false.obs;

  @override
  void onInit() {

    final credentials = LocalStore.readValue(key: AppConstants.rememberMe);
    if (credentials != null) {
      emailController.text = credentials['email'];
      passwordController.text = credentials['password'];
      rememberMe.value = true;
    } else {
      rememberMe.value = false;
    }

    emailController.text = 'salmanrazabwn@gmail.com';
    super.onInit();
  }

  Future<void> login() async {

    if (rememberMe.value == true) {
      Map<String, String> credentials = {
        'email': emailController.text,
        'password': passwordController.text
      };
      LocalStore.writeValue(key: AppConstants.rememberMe, value: credentials);
    } else {
      LocalStore.removeValue(key: AppConstants.rememberMe);
    }

    loading.value = true;
    FocusManager.instance.primaryFocus!.unfocus();
    if (formKey.currentState!.validate()) {
      bool connectionAvailable = await InternetChecker.getConnectionStatus();
      if (connectionAvailable) {
        final Response response = await LoginRepository().login(
          userName: emailController.text,
          password: passwordController.text,
        );
        loading.value = false;
        if (response.statusCode == 200 && response.body['status']) {
          debugPrint('logged in');
          Get.offAllNamed(Routes.dashboard);
        } else {
          AppUtils.showSnackBar(
            context: Get.context!,
            message: 'Error ::: ${response.body['message']}',
            color: Colors.red[900],
          );
        }
      }
    }
  }
}
