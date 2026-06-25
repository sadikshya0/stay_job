import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/model/book.dart';
import 'package:safe_job/repo/cancel_booking_repo.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/view/dashboard/appointment_screen.dart';

class AppointmentDetailScreen extends StatelessWidget {
  final Book book;

  const AppointmentDetailScreen({super.key, required this.book});

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
          "Appointment Details",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    // IMAGE
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        book.room?.image ?? "",
                        height: 270,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Positioned(
                      top: 10,
                      right: 12,
                      child: Container(
                        height: 32,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.orange,
                        ),
                        child: Center(
                          child: Text(
                            book.booking?.status ?? "",
                            style: CustomTextStyles.f12W600(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  book.room?.roomType ?? "",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),

                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.primaryColor,
                          size: 16,
                        ),
                        Text(
                          book.room?.location ?? "",
                          style: CustomTextStyles.f12W600(
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.lGrey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date",
                                style: CustomTextStyles.f12W600(
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    size: 16,
                                    color: AppColors.secondaryTextColor,
                                  ),
                                  Text(
                                    book.booking?.date ?? "",
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
                    ),
                    SizedBox(width: 2),
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.lGrey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Time",
                                style: CustomTextStyles.f12W600(
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 16,
                                    color: AppColors.secondaryTextColor,
                                  ),
                                  Text(
                                    "${book.slot?.startTime ?? ""} - ${book.slot?.endTime ?? ""}",
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
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  height: 65,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lGrey,
                            ),
                            child: ClipOval(
                              child: Image.network(
                                book.room?.vendor?.profileImage ?? "",
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                book.room?.vendor?.name ?? "",
                                style: CustomTextStyles.f12W600(
                                  color: AppColors.whiteColor,
                                ),
                              ),

                              Text(
                                book.room?.vendor?.vendorType ?? "",
                                style: CustomTextStyles.f12W400(
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Icon(
                            Icons.messenger_outline_outlined,
                            color: Colors.amberAccent.withOpacity(0.9),
                            size: 20,
                          ),

                          SizedBox(width: 20),

                          Icon(
                            Icons.phone,
                            color: AppColors.green.withOpacity(0.9),
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Note",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lGrey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        book.booking?.notes ?? "",
                        style: CustomTextStyles.f12W400(
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.defaultDialog(
                        title: "Cancel Booking",
                        middleText: "Do you want to cancel this booking?",
                        textConfirm: "Yes",
                        textCancel: "No",
                        confirmTextColor: Colors.white,
                        buttonColor: Colors.red,
                        cancelTextColor: AppColors.primaryColor,
                        radius: 12,
                        onConfirm: () {
                          // Close the confirmation dialog first
                          Get.back();

                          CancelBookingRepo.cancelBookingRepo(
                            bookingId: book.booking?.id ?? "",
                            onSuccess: (message) {
                              Get.snackbar(
                                "Success",
                                message,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            },
                            onError: (message) {
                              Get.snackbar(
                                "Error",
                                message,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: CustomTextStyles.f16W600(
                            color: AppColors.whiteColor,
                          ),
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
