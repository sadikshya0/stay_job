import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/controller/dashboard/edit_profile_controller.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/widgets/custom/custom_textfield.dart';

class EditProfileScreen extends StatelessWidget {
  final EditProfileController controller = Get.put(EditProfileController());

  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: AppColors.textColor, size: 22),
        ),
        title: Text(
          "Edit Profile",
          style: CustomTextStyles.f18W600(color: AppColors.primaryColor),
        ),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      Obx(
                        () => Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
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
                                      height: 110,
                                      width: 110,
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

                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.camera_alt),
                                      title: const Text("Camera"),
                                      onTap: () async {
                                        Get.back();
                                        await controller.pickFromCamera();
                                      },
                                    ),

                                    ListTile(
                                      leading: const Icon(Icons.photo),
                                      title: const Text("Gallery"),
                                      onTap: () async {
                                        Get.back();
                                        await controller.pickFromGallery();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
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
                                Icons.camera_alt,
                                size: 16,
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  "FULL NAME",
                  style: CustomTextStyles.f14W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),

                CustomTextField(
                  hint: "Enter your name",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                ),

                SizedBox(height: 20),
                Text(
                  "EMAIL ADDRESS",
                  style: CustomTextStyles.f14W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hint: "Enter your email address",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 20),
                Text(
                  "PHONE NUMBER",
                  style: CustomTextStyles.f14W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hint: "Enter your phone number",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 20),
                Text(
                  "LOCATION",
                  style: CustomTextStyles.f14W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hint: "Enter your location",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 20),

                SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Save Changes",
                        style: CustomTextStyles.f14W600(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
