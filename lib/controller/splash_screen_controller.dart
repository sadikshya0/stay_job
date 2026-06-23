import 'package:get/get.dart';
import 'package:safe_job/controller/core_controller.dart';
import 'package:safe_job/view/dashboard/dash_screen.dart';
import 'package:safe_job/view/landing_page.dart';

class SplashScreenController extends GetxController {
  final c = Get.put(CoreController());
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      if (c.isUserLoggedIn()) {
        Get.offAll(() => DashScreen());
      } else {
        Get.offAll(() => LandingPage());
      }
    });
  }
}
