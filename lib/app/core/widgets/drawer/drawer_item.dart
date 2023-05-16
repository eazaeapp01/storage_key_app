import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/colors.dart';
import 'drawer_controller.dart';

class DrawerItem extends StatelessWidget {
  final controller = Get.put(DrawerMenuController());
  final String prefixIcon;
  final Icon? suffixIcon;
  final String title;
  final int value;

  DrawerItem({
    Key? key,
    required this.prefixIcon,
    required this.title,
    this.suffixIcon, required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => controller.selected.value = value,
      child: ListTile(
        leading: Obx(() {
          return Container(
            padding: const EdgeInsets.all(10),
            color: controller.selected.value == value
                ? AppColors.primaryColor
                : Colors.blue,
            child: SvgPicture.asset(
              prefixIcon,
              color: Colors.white,
            ),
          );
        }),
        title: Text(title, style: const TextStyle(fontSize: 18),),
        trailing: suffixIcon,
      ),
    );
  }
}
