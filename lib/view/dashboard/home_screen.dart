import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/view/dashboard/message_screen.dart';
import 'package:safe_job/view/dashboard/notification_screen.dart';
import 'package:safe_job/widgets/home_screen_widget/circle_icon_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back,",
                  style: CustomTextStyles.f12W600(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                Text(
                  "Jeremiah Gislason",
                  style: CustomTextStyles.f18W600(color: AppColors.textColor),
                ),
              ],
            ),

            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.offAll(() => MessageScreen());
                  },
                  child: CircleIconButton(icon: Icons.messenger_outline),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Get.offAll(() => NotificationScreen());
                  },
                  child: CircleIconButton(icon: Icons.notifications_none),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
