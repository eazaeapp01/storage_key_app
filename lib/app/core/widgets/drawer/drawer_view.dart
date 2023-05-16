import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:storage_key_app/app/constants/colors.dart';

import '../../../constants/app_constants.dart';
import 'drawer_controller.dart';
import 'drawer_item.dart';

class DrawerMenuView extends StatelessWidget {
  DrawerMenuView({Key? key}) : super(key: key);
  final controller = Get.put(DrawerMenuController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: LayoutBuilder(builder: (cts, ctx) {
        return Container(
          width: 300,
          color: Colors.white,
          child: ListView(
            children: [
              const DrawerHeader(
                child: Center(
                  child: Text('hello world'),
                ),
              ),
              DrawerItem(
                prefixIcon: AppConstants.dashboardIcon,
                title: 'Dashboard',
                value: 0,
              ),
              const Divider(),
              DrawerItem(
                prefixIcon: AppConstants.payrollIcon,
                title: 'Job Desk',
                value: 1,
              ),
              const Divider(),
              DrawerItem(
                prefixIcon: AppConstants.personIcon,
                title: 'Profile',
                value: 2,
              ),
              const Divider(),
              DrawerItem(
                prefixIcon: AppConstants.timerIcon,
                title: 'Summary',
                value: 3,
              ),
              const Divider(),
            ],
          ),
        );
      }),
    );
  }
}
