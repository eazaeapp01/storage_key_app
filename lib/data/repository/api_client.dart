import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'local_repository/storage_repository.dart';

class ApiClient extends GetConnect implements GetxService {

  Future<Response?> getData(String uri) async {
    String token = LocalStore.readValue(key: "access_token");
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    debugPrint('$headers');
    debugPrint(uri);
    try {
      Response response =
      await get(uri, headers: headers).timeout(const Duration(seconds: 20));
      return response;
    } catch (e) {
      debugPrint("catch: $uri");
      return null;
    }
  }

  Future<Response?> postData(String uri, dynamic body) async {
    String token = LocalStore.readValue(key: "access_token");
    debugPrint(token);
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      Response response = await post(uri, body, headers: headers);
      return response;
    } catch (e) {
      debugPrint("catch: $uri");
      return null;
    }
  }
}
