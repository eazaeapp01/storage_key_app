
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/routes.dart';
import '../../app/utils/internet_checker.dart';
import '../../app/utils/snackbar.dart';
import '../../data/repository/remote_repository/register_repository.dart';

class RegisterController extends GetxController {

  final formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final obscureValueP1 = true.obs;
  final obscureValueP2 = true.obs;


  final loading = false.obs;


  Future<void> register() async {

    FocusManager.instance.primaryFocus!.unfocus();
    if (formKey.currentState!.validate()) {
      bool connectionAvailable = await InternetChecker.getConnectionStatus();
      if (connectionAvailable) {
        loading.value = true;
        final Response response = await RegisterRepository().register(
          name: firstNameController.text + lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
        );
        loading.value = false;
        if (response.statusCode == 200 && response.body['status']) {
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