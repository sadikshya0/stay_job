import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/route_manager.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/view/dashboard/dash_screen.dart';
import 'package:safe_job/widgets/home_screen_widget/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: InkWell(
          onTap: () {
            Get.offAll(() => DashScreen());
          },
          child: Icon(Icons.arrow_back, size: 18),
        ),

        title: Text(
          "Notification",
          style: CustomTextStyles.f16W600(color: AppColors.primaryColor),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        elevation: 2,
        shadowColor: AppColors.lGrey,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
            child: Column(
              children: [
                NotificationCard(
                  title: "Apply Success",
                  description:
                      "You have applied for an job in ABC solution as a Frontend Developer.",
                  time: "8 hours ago",
                  containerColor: AppColors.primaryColor,
                ),
                SizedBox(height: 20),
                Divider(height: 2, color: AppColors.secondaryTextColor),
                SizedBox(height: 20),
                NotificationCard(
                  title: "Complete your profile",
                  description:
                      "Please verify your email information to  continue using this app.",
                  time: "24 jan",
                  containerColor: AppColors.whiteColor,
                  showMarkAsRead: false,
                  titleColor: Colors.black,
                  descriptionColor: Colors.grey,
                ),
                SizedBox(height: 20),
                Divider(height: 2, color: AppColors.secondaryTextColor),
                SizedBox(height: 20),
                NotificationCard(
                  title: "Apply Success",
                  description:
                      "You have applied for an job in TechFlow solution as a Frontend Developer.",
                  time: "12 jan",
                  containerColor: AppColors.whiteColor,
                  showMarkAsRead: false,
                  titleColor: Colors.black,
                  descriptionColor: Colors.grey,
                ),
                SizedBox(height: 20),
                Divider(height: 2, color: AppColors.secondaryTextColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
