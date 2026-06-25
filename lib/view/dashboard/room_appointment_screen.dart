import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/model/room.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/view/dashboard/dash_screen.dart';

class RoomAppointmentScreen extends StatelessWidget {
  RoomAppointmentScreen({super.key});

  final Map<String, dynamic> args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final Room room = args["room"];
    final DateTime? selectedDate = args["date"];
    final String selectedTime = args["time"] ?? "";

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
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Text(
                "Visit Schedule",
                style: CustomTextStyles.f20W600(color: AppColors.textColor),
              ),

              Text(
                "Your appointment has been successfully scheduled.",
                textAlign: TextAlign.center,
                style: CustomTextStyles.f14W400(color: AppColors.textColor),
              ),

              const SizedBox(height: 40),

              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lGrey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              room.image ?? "",
                              height: 70,
                              width: 90,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) {
                                return Image.asset(
                                  ImagePath.bedroom,
                                  height: 70,
                                  width: 90,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),

                          const SizedBox(width: 8),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  room.title ?? "",
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

                                    Expanded(
                                      child: Text(
                                        room.location ?? "",
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles.f14W400(
                                          color: AppColors.secondaryTextColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                size: 18,
                                color: AppColors.secondaryTextColor,
                              ),
                              const SizedBox(width: 4),
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
                                size: 18,
                                color: AppColors.secondaryTextColor,
                              ),
                              const SizedBox(width: 4),
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

                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedDate != null
                                ? "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"
                                : "-",
                            style: CustomTextStyles.f14W600(
                              color: AppColors.textColor,
                            ),
                          ),

                          Text(
                            selectedTime,
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

              const SizedBox(height: 40),

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
