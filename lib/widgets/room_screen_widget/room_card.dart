import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/view/dashboard/room_book_screen.dart';
import 'package:safe_job/view/dashboard/room_view_screen.dart';

class RoomCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String location;

  final VoidCallback? onViewTap;
  final VoidCallback? onBookTap;
  final VoidCallback? onBookmarkTap;

  const RoomCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.location,
    this.onViewTap,
    this.onBookTap,
    this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      width: double.infinity,

      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15),

        border: Border.all(
          color: AppColors.secondaryTextColor.withOpacity(0.3),
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.all(8),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE SECTION
            Stack(
              alignment: Alignment.topRight,

              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),

                  child: Image.asset(
                    image,
                    height: 179,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 8,
                  right: 8,
                  child: InkWell(
                    onTap: onBookmarkTap,
                    child: Icon(Icons.bookmark_border, size: 20),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // TITLE + PRICE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,

                    style: CustomTextStyles.f16W600(color: AppColors.textColor),
                  ),
                ),

                const SizedBox(width: 10),

                Text(
                  price,
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
              ],
            ),

            const SizedBox(height: 5),

            // LOCATION
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.primaryColor,
                  size: 16,
                ),

                const SizedBox(width: 3),

                Expanded(
                  child: Text(
                    location,
                    overflow: TextOverflow.ellipsis,

                    style: CustomTextStyles.f12W600(color: AppColors.textColor),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => RoomViewScreen());
                    },

                    child: Container(
                      height: 35,

                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),

                      child: Center(
                        child: Text(
                          "View",
                          style: CustomTextStyles.f12W600(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => RoomBookScreen());
                    },

                    child: Container(
                      height: 35,

                      decoration: BoxDecoration(
                        color: AppColors.green.withOpacity(0.8),

                        borderRadius: BorderRadius.circular(8),
                      ),

                      child: Center(
                        child: Text(
                          "Book Visit",
                          style: CustomTextStyles.f12W600(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
