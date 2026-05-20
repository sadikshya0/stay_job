import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/view/dashboard/room_appointment_screen.dart';
import 'package:safe_job/widgets/custom/custom_textfield.dart';
import 'package:safe_job/widgets/room_screen_widget/day_date_card.dart';
import 'package:safe_job/widgets/room_screen_widget/time_slot_card.dart';

class RoomScheduleScreen extends StatelessWidget {
  const RoomScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 4,
        shadowColor: AppColors.lGrey,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Schedule Visit",
          style: CustomTextStyles.f16W600(color: AppColors.primaryColor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    border: Border.all(color: AppColors.lGrey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(ImagePath.bedroom),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Modern 2BHK Flat",
                              style: CustomTextStyles.f16W600(
                                color: AppColors.textColor,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.primaryColor,
                                  size: 16,
                                ),
                                Text(
                                  "Masbar-7, POkhara",
                                  style: CustomTextStyles.f12W600(
                                    color: AppColors.secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "NPR 18K/month",
                              style: CustomTextStyles.f16W600(
                                color: AppColors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select Date",
                      style: CustomTextStyles.f16W600(
                        color: AppColors.textColor,
                      ),
                    ),
                    Text(
                      "February 2026",
                      style: CustomTextStyles.f14W600(
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: 8),

                      DayDateCard(day: "Sun", date: "22"),
                      SizedBox(width: 15),

                      DayDateCard(day: "Mon", date: "23"),
                      SizedBox(width: 15),

                      DayDateCard(day: "Tue", date: "24"),
                      SizedBox(width: 15),

                      DayDateCard(day: "Wed", date: "25"),
                      SizedBox(width: 15),

                      DayDateCard(day: "Thu", date: "26"),
                      SizedBox(width: 15),

                      DayDateCard(day: "Fri", date: "27"),
                      SizedBox(width: 15),

                      DayDateCard(day: "Sat", date: "28"),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Available Slots",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        TimeSlotCard(time: "09:30 AM"),
                        SizedBox(height: 20),

                        TimeSlotCard(time: "12:00 PM"),
                        SizedBox(height: 20),

                        TimeSlotCard(time: "02:30 PM"),
                      ],
                    ),
                    Column(
                      children: [
                        TimeSlotCard(time: "11:00 AM"),
                        SizedBox(height: 20),

                        TimeSlotCard(time: "01:30 PM"),
                        SizedBox(height: 20),

                        TimeSlotCard(time: "04:00 PM"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Note to the owner (optional)",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  maxLines: null,
                  minLines: 4,
                  decoration: InputDecoration(
                    hintText:
                        "Tell a bit about yourself or ask any question...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.lGrey),
                    ),
                    filled: false,
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
                SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    Get.to(() => RoomAppointmentScreen());
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
                        "Confirm Visit Schedule",
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
