import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/widgets/profile_widgets/visit_card.dart';

class AppointmentScreen extends StatelessWidget {
  AppointmentScreen({super.key});

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
          "Appointment",
          style: CustomTextStyles.f18W600(color: AppColors.primaryColor),
        ),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                VisitCard(
                  image: ImagePath.bedroom,
                  title: "Modern 2BHK Flat",
                  date: "March 15, 2026",
                  time: "12:00 PM",
                  status: "Pending",
                ),
                SizedBox(height: 20),
                VisitCard(
                  image: ImagePath.bedroom,
                  title: "Single Room",
                  date: "March 15, 2026",
                  time: "12:00 PM",
                  status: "Pending",
                ),
                SizedBox(height: 20),
                VisitCard(
                  image: ImagePath.bedroom,
                  title: "Modern 2BHK Flat",
                  date: "March 15, 2026",
                  time: "12:00 PM",
                  status: "Rejected",
                ),
                SizedBox(height: 20),
                VisitCard(
                  image: ImagePath.bedroom,
                  title: "Modern 2BHK Flat",
                  date: "March 15, 2026",
                  time: "12:00 PM",
                  status: "confirmed",
                ),
                SizedBox(height: 20),
                VisitCard(
                  image: ImagePath.bedroom,
                  title: "Modern 2BHK Flat",
                  date: "March 15, 2026",
                  time: "12:00 PM",
                  status: "Pending",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
