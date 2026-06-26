import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:safe_job/model/job.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/view/dashboard/application_screen.dart';
import 'package:safe_job/widgets/job_screen_widget/info.dart';

class JobDetailScreen extends StatelessWidget {
  final Job job;
  JobDetailScreen({super.key, required this.job});

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
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Job Detail",
          style: CustomTextStyles.f16W600(color: AppColors.primaryColor),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        elevation: 4,
        toolbarHeight: 70,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // LEFT SIDE TEXT
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            job.title ?? "",
                            style: CustomTextStyles.f16W400(
                              color: AppColors.secondaryTextColor,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            job.companyName ?? "",
                            style: CustomTextStyles.f18W600(
                              color: AppColors.textColor,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Row(
                            children: [
                              Container(
                                height: 25,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  border: Border.all(
                                    color: AppColors.secondaryTextColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    job.jobType ?? "",
                                    style: CustomTextStyles.f12W600(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10),

                    // RIGHT SIDE IMAGE
                    Image.asset(
                      ImagePath.job,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(color: AppColors.secondaryTextColor),
                SizedBox(height: 10),
                Column(
                  children: [
                    Info(
                      description: "${job.salaryMin} - ${job.salaryMax}",
                      title: "Salary",
                      icon: Icons.monetization_on,
                    ),
                    SizedBox(height: 10),
                    Info(
                      description: job.location ?? "",
                      title: "Location",
                      icon: Icons.location_on,
                    ),
                    SizedBox(height: 10),

                    Info(
                      description: job.createdAt ?? "",
                      title: "Assigned Date",
                      icon: Icons.calendar_month,
                    ),
                    SizedBox(height: 10),

                    Info(
                      description: job.experienceRequired ?? "",
                      title: "Experience Required",
                      icon: Icons.people_alt_outlined,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(color: AppColors.secondaryTextColor),
                SizedBox(height: 10),

                Text(
                  "Job Description",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),
                Text(
                  job.description ?? "",
                  style: CustomTextStyles.f14W400(color: AppColors.textColor),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Text(
                  "For more inquiry",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.maps_ugc_outlined,
                      color: Colors.amber,
                      size: 26,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Message us",
                      style: CustomTextStyles.f14W400(
                        color: AppColors.textColor,
                      ),
                    ),
                    SizedBox(width: 30),
                    Icon(Icons.phone, color: Colors.green, size: 26),
                    SizedBox(width: 5),
                    Text(
                      "Contact us",
                      style: CustomTextStyles.f14W400(
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Get.to(() => ApplicationScreen(job: job));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Apply Now",
                        style: CustomTextStyles.f16W600(
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

class FeatureRow extends StatelessWidget {
  final String text;

  const FeatureRow({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: AppColors.primaryColor, size: 18),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: CustomTextStyles.f14W400(
              color: AppColors.secondaryTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
