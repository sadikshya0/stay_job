import 'package:get/get.dart';
import 'package:safe_job/view/landing_page.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Simulate a delay for the splash screen (e.g., 3 seconds)
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => LandingPage());
    });
  }
}
