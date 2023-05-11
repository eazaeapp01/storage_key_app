import 'package:flutter/material.dart';

import '../../app/core/components/custom_button.dart';
import '../../app/core/components/custom_text_form_field.dart';
import '../../app/core/components/grey_container.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool? rememberMe = false;
  bool obscureValueP1 = true;
  bool obscureValueP2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Image.asset(
                  'assets/images/ska_logo.png',
                  height: 100,
                  width: 300,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Hi!\nConfirm your account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 60),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'First Name',
                    style: TextStyle(color: Colors.deepOrangeAccent),
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: firstNameController,
                  hintText: 'Enter your first name',
                  textInputAction: TextInputAction.next,
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
                  controller: lastNameController,
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
                  controller: emailController,
                  hintText: 'username@storagekeys.com',
                  textInputAction: TextInputAction.next,
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
                CustomTextFormField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  obscureText: obscureValueP1,
                  onFieldSubmitted: (value) {
                    setState(() {
                      if (!obscureValueP1) {
                        obscureValueP1 = true;
                      }
                    });
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureValueP1 = !obscureValueP1;
                      });
                    },
                    icon: Icon(
                      obscureValueP1 ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
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
                  obscureText: obscureValueP2,
                  onFieldSubmitted: (value) {
                    setState(() {
                      if (!obscureValueP2) {
                        obscureValueP2 = true;
                      }
                    });
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureValueP2 = !obscureValueP2;
                      });
                    },
                    icon: Icon(
                      obscureValueP2 ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 50),
                CustomButton(onPressed: () {}, height: 40, child: const Text('Sign Up')),
                const SizedBox(height: 100),
              ],
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
