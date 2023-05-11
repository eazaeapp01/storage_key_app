import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/constants/colors.dart';
import '../../app/core/components/custom_button.dart';
import '../../app/core/components/custom_text_form_field.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
                    'Hi!\nLogin to your dashboard.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: context.height * .07),
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
                    hintText: 'Email',
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Email field should not by empty.';
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
                      hintText: 'Password',
                      obscureText: controller.obscureValue.value,
                      onFieldSubmitted: (value) {
                        if (!controller.obscureValue.value) {
                          controller.obscureValue.value = true;
                        }
                      },
                      validator: (value) {
                        if (value.isEmpty || value == null) {
                          return 'Password field should not be empty.';
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        onPressed: () => controller.obscureValue.value =
                            !controller.obscureValue.value,
                        icon: Icon(
                          controller.obscureValue.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => controller.rememberMe.value =
                            controller.rememberMe.value == true ? false : true,
                        child: Row(
                          children: [
                            Obx(() {
                              return Checkbox(
                                value: controller.rememberMe.value,
                                activeColor: AppColors.primaryColor,
                                onChanged: (value) =>
                                    controller.rememberMe.value = value,
                              );
                            }),
                            const Text('Remember me')
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  Obx(() {
                    return CustomButton(
                      onPressed: controller.loading.value
                          ? null
                          : () => controller.login(),
                      height: 50,
                      width: context.isTablet ? context.height * .4 : null,
                      disableColor: AppColors.primaryColor,
                      child: controller.loading.value
                          ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(color: Colors.white),
                          )
                          : const Text(
                              'Login',
                              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
