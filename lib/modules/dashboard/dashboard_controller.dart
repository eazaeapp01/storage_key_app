import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/utils/internet_checker.dart';
import '../../app/utils/snackbar.dart';
import '../../data/model/announcement_model.dart';
import '../../data/repository/local_repository/storage_repository.dart';
import '../../data/model/user_model.dart';
import '../../data/repository/remote_repository/announcement_repository.dart';

class DashboardController extends GetxController {
  late final String accessToken;

  UserModel? user;
  AnnouncementModel? announcementModel;


  @override
  void onInit() async {
    final loggedIn = LocalStore.readValue(key: 'logged_inf');
    if (loggedIn) {
      user = UserModel.fromJson(LocalStore.readValue(key: 'user'));
    }
    super.onInit();
  }

  Future<void> fetchAnnouncement() async {
    bool connectionAvailable = await InternetChecker.getConnectionStatus();
    
    if (connectionAvailable) {
      Response? response = await AnnouncementRepository.getAnnouncements();
      if (response != null && response.statusCode == 200) {
        announcementModel = AnnouncementModel.fromJson(response.body);
      } else {
        AppUtils.showSnackBar(
          context: Get.context!,
          message: 'Error ::: ${response!.body['message']}',
          color: Colors.red[900],
        );
      }
    } else {
      AppUtils.showSnackBar(
        context: Get.context!,
        message: 'Error ::: No, internet connection available!',
        color: Colors.red[900],
      );
    }
  }



}
