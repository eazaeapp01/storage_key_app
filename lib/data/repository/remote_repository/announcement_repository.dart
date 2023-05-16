import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:storage_key_app/app/constants/app_constants.dart';

import '../api_client.dart';

class AnnouncementRepository {
  static Future<Response?> getAnnouncements() async {
    debugPrint('url: ${AppConstants.baseUrl + AppConstants.announcement}');
    Response? response = await ApiClient().getData(
      AppConstants.baseUrl + AppConstants.announcement,
    );
    return response;
  }
}
