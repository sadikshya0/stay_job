import 'package:flutter/material.dart';
import 'package:safe_job/model/room.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';

class TimeSlotCard extends StatelessWidget {
  final double height;
  final double? width;
  final bool isSelected;
  final VoidCallback? onTap;
  final AvailabilitySlots availabilitySlots;

  const TimeSlotCard({
    super.key,
    this.height = 50,
    this.width,
    required this.isSelected,
    required this.onTap,
    required this.availabilitySlots,
  });

  @override
  Widget build(BuildContext context) {
    final bool booked = availabilitySlots.isBooked ?? false;

    return InkWell(
      onTap: booked ? null : onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.whiteColor,
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.lGrey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            booked
                ? "${availabilitySlots.startTime} (Booked)"
                : availabilitySlots.startTime ?? "",
            style: CustomTextStyles.f12W700(
              color: booked
                  ? Colors.grey.shade700
                  : isSelected
                  ? AppColors.whiteColor
                  : AppColors.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
