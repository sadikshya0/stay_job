import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:safe_job/model/book.dart';
import 'package:safe_job/repo/cancel_booking_repo.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/view/dashboard/appointment_detail_screen.dart';

class VisitCard extends StatelessWidget {
  final Book book;
  const VisitCard({super.key, required this.book});

  Color _bgColor() {
    switch (book.booking?.status?.toLowerCase()) {
      case "approved":
        return Colors.green.withOpacity(0.2);
      case "cancelled":
        return Colors.red.withOpacity(0.2);
      default:
        return Colors.amberAccent.withOpacity(0.3); // pending
    }
  }

  Color _textColor() {
    switch (book.booking?.status?.toLowerCase()) {
      case "approved":
        return Colors.green;
      case "cancelled":
        return Colors.red;
      default:
        return AppColors.orange; // pending
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => AppointmentDetailScreen(book: book));
      },
      child: Container(
        height: 110,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.lGrey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  book.room?.image ?? "",
                  height: 80,
                  width: 90,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 80,
                      width: 90,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported),
                    );
                  },
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      book.room?.title ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.f14W600(
                        color: AppColors.textColor,
                      ),
                    ),

                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          size: 14,
                          color: AppColors.secondaryTextColor,
                        ),
                        Text(
                          book.booking?.date ?? "",
                          style: CustomTextStyles.f12W600(
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: AppColors.secondaryTextColor,
                        ),

                        Text(
                          "${book.slot?.startTime ?? ""}- ${book.slot?.endTime ?? ""}",
                          style: CustomTextStyles.f12W600(
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),

                    // STATUS
                    InkWell(
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
                        height: 20,
                        width: 90,
                        decoration: BoxDecoration(
                          color: _bgColor(),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            book.booking?.status ?? "".toUpperCase(),
                            style: CustomTextStyles.f12W600(
                              color: _textColor(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
