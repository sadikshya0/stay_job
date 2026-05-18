import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/controller/dashboard/application_screen_controller.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/widgets/custom/custom_textfield.dart';

class ApplicationScreen extends StatelessWidget {
  final ApplicationScreenController controller = Get.put(
    ApplicationScreenController(),
  );
  ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 140,
                    width: 160,
                    decoration: BoxDecoration(color: AppColors.whiteColor),
                    child: Column(
                      children: [
                        Image.asset(ImagePath.job, height: 90, width: 160),
                        Text(
                          "Frontend Developer",
                          style: CustomTextStyles.f16W600(
                            color: AppColors.textColor,
                          ),
                        ),
                        Text(
                          "ABC Solution",
                          style: CustomTextStyles.f14W400(
                            color: AppColors.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lGrey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Fill Form",
                          style: CustomTextStyles.f16W600(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(height: 30),

                        CustomTextField(
                          hint: "Name",
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(height: 20),

                        CustomTextField(
                          hint: "Email",
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20),

                        CustomTextField(
                          hint: "Phone Number",
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.phone,
                        ),
                        SizedBox(height: 20),

                        GestureDetector(
                          onTap: () {
                            controller.pickFile();
                          },
                          child: DottedBorder(
                            options: RectDottedBorderOptions(
                              color: AppColors.secondaryTextColor,
                              strokeWidth: 1,
                              dashPattern: const [6, 4],
                            ),
                            child: Container(
                              height: 90,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "+ Upload Resume",
                                      style: CustomTextStyles.f12W600(
                                        color: AppColors.secondaryTextColor,
                                      ),
                                    ),
                                    Icon(
                                      Icons.file_open_outlined,
                                      color: AppColors.secondaryTextColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Obx(() {
                  return SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.isApplied.value
                            ? Colors.green
                            : AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      onPressed: () {
                        controller.isApplied.value = true;
                      },

                      child: Text(
                        controller.isApplied.value
                            ? "Applied Successfully"
                            : "Apply Now",
                        style: CustomTextStyles.f14W600(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
