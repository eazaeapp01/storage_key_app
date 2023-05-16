import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/router.dart';
import 'app/routes/routes.dart';
import 'data/repository/local_repository/storage_repository.dart';

void main() async {
  await GetStorage.init();
  LocalStore.initialize();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ).then(
    (value) {
      bool? loggedIn = LocalStore.readValue(key: 'logged_in');
      debugPrint('logged in: $loggedIn');
      runApp(StorageKeyApp(loggedIn: loggedIn));
    },
  );
}

class StorageKeyApp extends StatelessWidget {
  final bool? loggedIn;

  const StorageKeyApp({super.key, required this.loggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Storage Key App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: loggedIn == true ? Routes.dashboard : Routes.login,
      getPages: AppRoutes.routes,
    );
  }
}
