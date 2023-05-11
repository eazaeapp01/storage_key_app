import 'package:get/get.dart';

import '../../modules/dashboard/dashboard_binding.dart';
import '../../modules/dashboard/dashboard_view.dart';
import '../../modules/login/login_binding.dart';
import '../../modules/login/login_view.dart';
import '../../modules/sign_up/sign_up_binding.dart';
import '../../modules/sign_up/sign_up_view.dart';
import 'routes.dart';

class AppRoutes {

  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    )
  ];
}
