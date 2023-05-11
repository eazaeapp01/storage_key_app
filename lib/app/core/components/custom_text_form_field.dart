import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final controller;
  final obscureText;
  final prefix;
  final prefixIcon;
  final suffix;
  final suffixIcon;
  final hintText;
  final textInputAction;

  // functions
  final validator;
  final onFieldSubmitted;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.obscureText,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.hintText,
    this.textInputAction,
    this.validator, this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      // onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        hintText: hintText,
        prefix: prefix,
        prefixIcon: prefixIcon,
        suffix: suffix,
        suffixIcon: suffixIcon,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.primaryColor,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
