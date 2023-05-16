import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../app/constants/app_constants.dart';

class RegisterRepository extends GetConnect implements GetxService {
  Future<Response> register({required String name, required String email, required String password}) async {

    debugPrint('register url: ${AppConstants.baseUrl + AppConstants.register}');

    Map<String, String> body = {'name': name, 'email': email, 'password': password};
    Response response = await post(
      AppConstants.baseUrl + AppConstants.register,
      body,
    );
    return response;
  }
}
