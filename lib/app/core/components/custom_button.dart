import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomButton extends StatelessWidget {
  final double? height, width;
  final Color? disableColor;
  final Widget child;
  final onPressed;

  const CustomButton({
    Key? key,
    required this.child,
    this.height,
    this.width,
    required this.onPressed, this.disableColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColors.primaryColor,
        disabledColor: disableColor ?? Colors.grey,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: child,
      ),
    );
  }
}
