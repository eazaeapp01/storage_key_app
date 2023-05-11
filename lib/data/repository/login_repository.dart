import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../app/constants/app_constants.dart';

class LoginRepository extends GetConnect implements GetxService {
  Future login({required String userName, required String password}) async {

    debugPrint('login url: ${AppConstants.baseUrl + AppConstants.login}');

    Map<String, String> body = {'email': userName, 'password': password};
    Response response = await post(
      AppConstants.baseUrl + AppConstants.login,
      body,
    );
    return response;
  }
}
