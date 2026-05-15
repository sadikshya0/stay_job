import 'package:flutter/material.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';

class FlatCard extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final String price;
  final String rating;

  const FlatCard({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
  });

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
            // IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                height: 55,
                width: 55,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 10),

            // CONTENT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // TITLE + RATING
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: CustomTextStyles.f14W600(
                          color: AppColors.textColor,
                        ),
                      ),

                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: AppColors.orange,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            rating,
                            style: CustomTextStyles.f12W700(
                              color: AppColors.textColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // LOCATION
                  Text(
                    location,
                    style: CustomTextStyles.f14W400(
                      color: AppColors.secondaryTextColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 6),

                  // PRICE
                  Text(
                    price,
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
