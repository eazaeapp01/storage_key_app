import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/repository/local_repository/storage_repository.dart';
import '../constants/app_constants.dart';
import '../routes/routes.dart';

class GlobalFunctions {
  static void logout(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20,
              ),
              child: Dialog(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Are you sure you want to logout?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            // It first directly takes the user to the Login Screen
                            Get.offAllNamed(Routes.login);

                            // then remove the saved user from local storage
                            LocalStore.removeValue(key: 'user');
                            // and then remove 'access_token' from the local
                            //  storage
                            LocalStore.removeValue(key: 'access_token');
                            // and at the end, let's remove tha flag 'logged_in'
                            // from the local storage.
                            LocalStore.removeValue(key: 'logged_in');

                            // Also remove credentials saved in local storage
                            LocalStore.removeValue(key: AppConstants.rememberMe);


                            debugPrint('logged out successfully!');
                          },
                          child: const Text('Logout'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
