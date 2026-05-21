import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safe_job/controller/dashboard/profile_screen_controller.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/view/auth/login_screen.dart';
import 'package:safe_job/view/dashboard/edit_profile_screen.dart';
import 'package:safe_job/widgets/profile_widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,

        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        shadowColor: AppColors.lGrey,
        toolbarHeight: 80,

        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Profile",
                style: CustomTextStyles.f16W600(color: AppColors.primaryColor),
              ),
              Row(
                children: [
                  Icon(Icons.settings, color: AppColors.textColor, size: 24),
                  SizedBox(width: 10),
                  Icon(
                    Icons.dark_mode_outlined,
                    color: AppColors.textColor,
                    size: 24,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 16,
            right: 16,
            bottom: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Stack(
                    children: [
                      Obx(
                        () => Container(
                          height: 95,
                          width: 95,
                          decoration: BoxDecoration(
                            color: AppColors.lGrey,
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: controller.selectedImage.value != null
                                ? Image.file(
                                    controller.selectedImage.value!,
                                    fit: BoxFit.cover,
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      ImagePath.person,
                                      height: 60,
                                      width: 60,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                            );
                          },

                          child: InkWell(
                            onTap: () {
                              Get.to(() => EditProfileScreen());
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.amber,

                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.secondaryTextColor,
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 0.5),
                                  ),
                                ],
                              ),

                              child: const Center(
                                child: Icon(
                                  Icons.edit_outlined,
                                  size: 20,
                                  color: AppColors.textColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Jeremiah Gislason",
                  style: CustomTextStyles.f14W600(color: AppColors.textColor),
                ),
                Text(
                  "Senior Backend Developer",
                  style: CustomTextStyles.f14W400(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "04",
                              style: CustomTextStyles.f14W600(
                                color: AppColors.whiteColor,
                              ),
                            ),
                            Text(
                              "Saved Jobs",
                              style: CustomTextStyles.f14W400(
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "02",
                              style: CustomTextStyles.f14W600(
                                color: AppColors.whiteColor,
                              ),
                            ),
                            Text(
                              "Saved Rooms",
                              style: CustomTextStyles.f14W400(
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                ProfileCard(
                  leadingIcon: Icons.calendar_month_outlined,
                  title: "Appointments and Visits",
                  iconColor: AppColors.primaryColor,
                ),
                SizedBox(height: 10),
                ProfileCard(
                  leadingIcon: Icons.bookmark_outline,
                  title: "Saved",
                  iconColor: AppColors.orange,
                ),
                SizedBox(height: 10),
                ProfileCard(
                  leadingIcon: Icons.wallet_outlined,
                  title: "Payments",
                  iconColor: AppColors.green,
                ),
                SizedBox(height: 10),
                ProfileCard(
                  leadingIcon: Icons.info,
                  title: "About Us",
                  iconColor: Colors.redAccent,
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Get.offAll(() => LoginScreen());
                  },
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Sign Out",
                        style: CustomTextStyles.f16W600(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.facebook, color: Colors.blue),
                    SizedBox(width: 20),
                    SvgPicture.asset(ImagePath.google),
                    SizedBox(width: 20),

                    SvgPicture.asset(ImagePath.instagram),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
