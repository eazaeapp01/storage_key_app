import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppUtils {

  static void showSnackBar({
    required BuildContext context,
    required String message,
    Color? color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ),
        backgroundColor: color ?? AppColors.primaryColor,
      ),
    );
  }

}
