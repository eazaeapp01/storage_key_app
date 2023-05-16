import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storage_key_app/app/constants/app_constants.dart';

import '../../app/routes/routes.dart';
import '../../app/utils/snackbar.dart';
import '../../data/model/user_model.dart';
import '../../data/repository/remote_repository/login_repository.dart';
import '../../app/utils/internet_checker.dart';
import '../../data/repository/local_repository/storage_repository.dart';

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
      emailController.text = 'salmanrazabwn@gmail.com';
    }

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

    FocusManager.instance.primaryFocus!.unfocus();
    if (formKey.currentState!.validate()) {
      bool connectionAvailable = await InternetChecker.getConnectionStatus();
      if (connectionAvailable) {
        loading.value = true;
        final Response response = await LoginRepository().login(
          userName: emailController.text,
          password: passwordController.text,
        );
        loading.value = false;
        if (response.statusCode == 200 && response.body['status']) {
          final user = UserModel.fromJson(response.body);

          // write user to local storage
          LocalStore.writeValue(key: 'user', value: user.toJson());

          // now write access token to local storage
          LocalStore.writeValue(key: 'access_token', value: user.token);

          // now also make it logged in
          if (rememberMe.value == true) {
            LocalStore.writeValue(key: 'logged_in', value: true);
          }

          Get.offAllNamed(Routes.dashboard);
        } else {
          AppUtils.showSnackBar(
            context: Get.context!,
            message: 'Error ::: ${response.body['message']}',
            color: Colors.red[900],
          );
        }
      } else {
        AppUtils.showSnackBar(
            context: Get.context!,
            message: 'Error ::: No, internet connection available!',
            color: Colors.red[900],
        );
      }
    }
  }
}
