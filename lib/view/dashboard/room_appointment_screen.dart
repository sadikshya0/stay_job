import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/view/dashboard/dash_screen.dart';

class RoomAppointmentScreen extends StatelessWidget {
  const RoomAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.check_circle_sharp,
                  color: AppColors.green.withOpacity(0.8),
                  size: 120,
                  shadows: [
                    Shadow(
                      color: AppColors.green.withOpacity(0.3),
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Visit Schedule",
                style: CustomTextStyles.f20W600(color: AppColors.textColor),
              ),
              Text(
                "Your appointment to visit Modern loft Downtown apartment has been successfully scheduled.",
                style: CustomTextStyles.f14W400(color: AppColors.textColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lGrey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              ImagePath.bedroom,
                              height: 70,
                              width: 90,
                            ),
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Modern loft Downtown",
                                style: CustomTextStyles.f16W600(
                                  color: AppColors.textColor,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 18,
                                    color: AppColors.primaryColor,
                                  ),
                                  Text(
                                    "Modern loft Downtown",
                                    style: CustomTextStyles.f14W400(
                                      color: AppColors.secondaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                color: AppColors.secondaryTextColor,
                                size: 18,
                              ),
                              Text(
                                "Date",
                                style: CustomTextStyles.f14W400(
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_outlined,
                                color: AppColors.secondaryTextColor,
                                size: 18,
                              ),
                              Text(
                                "Time",
                                style: CustomTextStyles.f14W400(
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "23 Feb, Mon",
                            style: CustomTextStyles.f14W600(
                              color: AppColors.textColor,
                            ),
                          ),
                          Text(
                            "11:00am",
                            style: CustomTextStyles.f14W600(
                              color: AppColors.textColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  Get.offAll(() => DashScreen());
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
                      "Done",
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
