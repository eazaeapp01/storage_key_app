import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/router.dart';
import 'app/routes/routes.dart';
import 'data/repository/storage_repository.dart';

void main() async {
  await GetStorage.init();
  LocalStore.initialize();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ).then(
    (value) => runApp(const StorageKeyApp()),
  );
}

class StorageKeyApp extends StatelessWidget {
  const StorageKeyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Storage Key App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.login,
      getPages: AppRoutes.routes,
    );
  }
}
