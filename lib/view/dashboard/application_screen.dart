import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/controller/dashboard/application_screen_controller.dart';
import 'package:safe_job/model/job.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';

class ApplicationScreen extends StatelessWidget {
  final Job job;
  final ApplicationScreenController controller = Get.put(
    ApplicationScreenController(),
  );
  ApplicationScreen({super.key, required this.job});

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
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Image.asset(ImagePath.job, height: 100, width: 160),
                      Text(
                        job.title ?? "",
                        style: CustomTextStyles.f16W600(
                          color: AppColors.textColor,
                        ),
                      ),
                      Text(
                        job.companyName ?? "",
                        style: CustomTextStyles.f14W400(
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lGrey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Upload Resume",
                          style: CustomTextStyles.f16W600(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(height: 30),
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
                                    Obx(() {
                                      return Text(
                                        controller.fileName.value.isEmpty
                                            ? "+ Upload Resume"
                                            : controller.fileName.value,
                                        style: CustomTextStyles.f12W600(
                                          color: AppColors.secondaryTextColor,
                                        ),
                                      );
                                    }),
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
                      ),
                      onPressed: controller.isLoading.value
                          ? null
                          : () {
                              controller.applyJob(jobId: job.id.toString());
                            },
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              controller.isApplied.value
                                  ? "Applied Successfully"
                                  : "Apply Now",
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
