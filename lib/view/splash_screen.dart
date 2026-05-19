import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:safe_job/controller/splash_screen_controller.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImagePath.logo, height: 115, width: 155),
              Text(
                "“Find your place. Build your career”",
                style: CustomTextStyles.f16W600(color: AppColors.primaryColor),
              ),
              SizedBox(height: 230),
              SpinKitChasingDots(color: AppColors.primaryColor, size: 50),
            ],
          ),
        ),
      ),
    );
  }
}
