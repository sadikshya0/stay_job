import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safe_job/controller/dashboard/dash_screen_controller.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/image_path.dart';

class DashScreen extends StatelessWidget {
  final c = Get.put(DashScreenController());
  DashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Obx(() => c.pages[c.currentIndex.value]),

      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 18,
            top: 12,
          ),

          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.lGrey.withOpacity(0.4),
                blurRadius: 2,
                spreadRadius: 1.5,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(
                    () => CustomBottomBar(
                      svgPath: ImagePath.home,
                      isActive: c.currentIndex.value == 0,
                      onTap: () => c.currentIndex.value = 0,
                    ),
                  ),
                  Obx(
                    () => CustomBottomBar(
                      svgPath: ImagePath.jobs,

                      isActive: c.currentIndex.value == 1,
                      onTap: () => c.currentIndex.value = 1,
                    ),
                  ),
                  Obx(
                    () => CustomBottomBar(
                      svgPath: ImagePath.explore,
                      isActive: c.currentIndex.value == 2,
                      onTap: () => c.currentIndex.value = 2,
                    ),
                  ),

                  Obx(
                    () => CustomBottomBar(
                      svgPath: ImagePath.rooms,
                      isActive: c.currentIndex.value == 3,
                      onTap: () => c.currentIndex.value = 3,
                    ),
                  ),
                  Obx(
                    () => CustomBottomBar(
                      svgPath: ImagePath.profile,
                      isActive: c.currentIndex.value == 4,
                      onTap: () => c.currentIndex.value = 4,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  final String svgPath;
  final bool isActive;
  final VoidCallback onTap;

  const CustomBottomBar({
    super.key,
    required this.svgPath,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: isActive ? 40 : 38,
              width: isActive ? 40 : 38,
              child: SvgPicture.asset(
                svgPath,
                color: isActive
                    ? AppColors.primaryColor
                    : AppColors.secondaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
