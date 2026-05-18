import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/view/dashboard/application_screen.dart';
import 'package:safe_job/view/dashboard/job_screen.dart';
import 'package:safe_job/widgets/job_screen_widget/info.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: InkWell(
          onTap: () {
            Get.offAll(() => JobScreen());
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fresh Elements Restaurant and Bar",
                        style: CustomTextStyles.f16W400(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Waiter",
                        style: CustomTextStyles.f18W600(
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: 10),

                      Row(
                        children: [
                          Container(
                            height: 25,
                            width: 80,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              border: Border.all(
                                color: AppColors.secondaryTextColor,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                "FULL TIME",
                                style: CustomTextStyles.f14W600(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 25,
                            width: 130,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              border: Border.all(
                                color: AppColors.secondaryTextColor,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                "REMOTE WORKING",
                                style: CustomTextStyles.f14W600(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(ImagePath.job, height: 100, width: 100),
                ],
              ),
              SizedBox(height: 10),
              Divider(color: AppColors.secondaryTextColor),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Info(
                        description: "12K-18K/ month",
                        title: "Salary",
                        icon: Icons.monetization_on,
                      ),
                      SizedBox(height: 10),
                      Info(
                        description: "Lakeside, Pokhara",
                        title: "Location",
                        icon: Icons.location_on,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Info(
                        description: "March 3, 2026",
                        title: "Expiry Date",
                        icon: Icons.calendar_month,
                      ),
                      SizedBox(height: 10),

                      Info(
                        description: "4",
                        title: "Applicants",
                        icon: Icons.people_alt_outlined,
                      ),
                    ],
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
                "Responsible and are not limited to, assisting and welcoming guests, taking orders, and serving meals, clearing tables then setting them up for new arrivals.",
                style: CustomTextStyles.f14W400(color: AppColors.textColor),
                textAlign: TextAlign.left,
              ),
              FeatureRow(text: "Architecto beatae vitae dicta "),
              SizedBox(height: 10),

              FeatureRow(text: "Doloremque laudantium"),
              SizedBox(height: 10),

              FeatureRow(text: "Ipsa quae ab illo inventore"),
              SizedBox(height: 10),

              FeatureRow(text: "Architecto beatae vitae dicta"),
              SizedBox(height: 10),

              FeatureRow(text: "Sunt explicabo"),
              SizedBox(height: 30),
              Divider(color: AppColors.secondaryTextColor),
              SizedBox(height: 5),
              Text(
                "For more inquiry",
                style: CustomTextStyles.f16W600(color: AppColors.textColor),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.maps_ugc_outlined, color: Colors.amber, size: 26),
                  SizedBox(width: 5),
                  Text(
                    "Message us",
                    style: CustomTextStyles.f14W400(color: AppColors.textColor),
                  ),
                  SizedBox(width: 30),
                  Icon(Icons.phone, color: Colors.green, size: 26),
                  SizedBox(width: 5),
                  Text(
                    "Contact us",
                    style: CustomTextStyles.f14W400(color: AppColors.textColor),
                  ),
                ],
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Get.offAll(() => ApplicationScreen());
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
