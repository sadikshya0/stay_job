import 'package:flutter/material.dart';
import 'package:safe_job/model/room.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';

class FlatCard extends StatelessWidget {
  final Room room;
  FlatCard({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lGrey),
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: room.image != null && room.image!.isNotEmpty
                  ? Image.network(
                      room.image!,
                      height: 55,
                      width: 55,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.image),
                    )
                  : SizedBox(height: 55, width: 55, child: Icon(Icons.image)),
            ),

            SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        room.title ?? "",
                        style: CustomTextStyles.f14W600(
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 4),

                  // LOCATION
                  Text(
                    room.location ?? "",
                    style: CustomTextStyles.f14W400(
                      color: AppColors.secondaryTextColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 6),

                  // PRICE
                  Text(
                    room.rentAmount ?? "",
                    style: CustomTextStyles.f14W600(color: AppColors.textColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
