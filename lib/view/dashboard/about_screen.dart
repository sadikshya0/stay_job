import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/widgets/profile_widgets/info_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
          "About",
          style: CustomTextStyles.f18W600(color: AppColors.primaryColor),
        ),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: AppColors.primaryColor,
                    size: 40,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Connecting people with purpose",
                  style: CustomTextStyles.f14W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),

                Text(
                  "StayJob is more than just a platform: it's a community dedicated to simplifying the most important transition of life ",
                  style: CustomTextStyles.f12W400(color: AppColors.textColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                InfoCard(
                  icon: Icons.verified_outlined,
                  title: "Trust & Safety",
                  iconColor: AppColors.primaryColor,
                  description:
                      "We prioritize the security of our vendors and users. Every listing and profile undergoes a rigorous verification process to ensure a safe environment for everyone.",
                ),
                SizedBox(height: 20),
                InfoCard(
                  icon: Icons.language,
                  title: "Global Reach ",
                  iconColor: AppColors.orange,
                  description:
                      "Our platform is built on the feedback of thousands of landlords and employers. We evolve with your needs to provide the best recruitment and property management tools.",
                ),
                SizedBox(height: 20),
                InfoCard(
                  icon: Icons.people,
                  title: "Community Driven",
                  iconColor: AppColors.green,
                  description:
                      "Whether you're hiring for a local startup or managing properties across borders, NestHire provides the infrastructure to scale your operations globally.",
                ),
                SizedBox(height: 20),
                Text(
                  "Version 2.4.0",
                  style: CustomTextStyles.f12W600(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                Text(
                  "2026 Stay Job Technologies Inc.",
                  style: CustomTextStyles.f10W600(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                Text(
                  "All rights reserved",
                  style: CustomTextStyles.f10W600(
                    color: AppColors.secondaryTextColor,
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
