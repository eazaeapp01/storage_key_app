import 'package:get/get.dart';

import '../../modules/dashboard/dashboard_binding.dart';
import '../../modules/dashboard/dashboard_view.dart';
import '../../modules/login/login_binding.dart';
import '../../modules/login/login_view.dart';
import '../../modules/sign_up/register_binding.dart';
import '../../modules/sign_up/register_view.dart';
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
      name: Routes.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    )
  ];
}
