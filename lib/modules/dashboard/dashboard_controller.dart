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
  final Rx<AnnouncementModel?> announcementModel = (null as AnnouncementModel?).obs;


  @override
  void onInit() async {
    final loggedIn = LocalStore.readValue(key: 'logged_inf');
    if (loggedIn ?? false) {
      user = UserModel.fromJson(LocalStore.readValue(key: 'user'));
    }
    await fetchAnnouncement();
    debugPrint('here reached');
    super.onInit();
  }

  Future<void> fetchAnnouncement() async {
    bool connectionAvailable = await InternetChecker.getConnectionStatus();
    
    if (connectionAvailable) {
      Response? response = await AnnouncementRepository.getAnnouncements();
      if (response != null && response.statusCode == 200) {
        announcementModel.value = AnnouncementModel.fromJson(response.body);
        debugPrint(announcementModel.value!.announcements![0].name);
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
