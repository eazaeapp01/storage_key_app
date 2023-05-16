import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/constants/colors.dart';
import '../../app/core/components/custom_button.dart';
import '../../app/core/components/custom_text_form_field.dart';
import '../../app/core/components/grey_container.dart';
import 'register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: context.height * .05),
                  Image.asset(
                    'assets/images/ska_logo.png',
                    height: context.height * .2,
                    width: context.width * .7,
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Hi!\nConfirm your account.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: context.height * .07),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'First Name',
                      style: TextStyle(color: Colors.deepOrangeAccent),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: controller.firstNameController,
                    hintText: 'Enter your first name',
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'First name should not be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Last Name',
                      style: TextStyle(color: Colors.deepOrangeAccent),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: controller.lastNameController,
                    hintText: 'Enter your last name',
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: TextStyle(color: Colors.deepOrangeAccent),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: controller.emailController,
                    hintText: 'username@storagekeys.com',
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email field should not be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(color: Colors.deepOrangeAccent),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(() {
                    return CustomTextFormField(
                      controller: controller.passwordController,
                      hintText: 'Enter your password',
                      obscureText: controller.obscureValueP1.value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password field should not be empty';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        if (!controller.obscureValueP1.value) {
                          controller.obscureValueP1.value = true;
                        }
                      },
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.obscureValueP1.toggle();
                        },
                        icon: Icon(
                          controller.obscureValueP1.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 40),
                  const GreyContainer(
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        'The password should contain one upper case, one lower case, '
                        'number, one special character and it should be minimum 8 '
                        'characters.',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(color: Colors.deepOrangeAccent),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: 'Please confirm your password',
                    obscureText: controller.obscureValueP2.value,
                    validator: (value) {
                      if (value != controller.passwordController.text) {
                        return 'Password does not match';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      if (!controller.obscureValueP2.value) {
                        controller.obscureValueP2.value = true;
                      }
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.obscureValueP2.toggle();
                      },
                      icon: Icon(
                        controller.obscureValueP2.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Obx(() {
                    return CustomButton(
                      onPressed: controller.loading.value
                          ? null
                          : () => controller.register(),
                      height: 50,
                      width: context.isTablet ? context.height * .4 : null,
                      disableColor: AppColors.primaryColor,
                      child: controller.loading.value
                          ? const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            )
                          : const Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                    );
                  }),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Copyright@2023 by Storage Keys',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
