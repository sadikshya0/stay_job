import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/view/dashboard/dash_screen.dart';
import 'package:safe_job/widgets/custom/custom_textfield.dart';
import 'package:safe_job/widgets/home_screen_widget/message_card.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: InkWell(
          onTap: () {
            Get.offAll(() => DashScreen());
          },
          child: Icon(Icons.arrow_back, size: 16),
        ),

        title: Text(
          "Messages",
          style: CustomTextStyles.f16W600(color: AppColors.primaryColor),
        ),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        shadowColor: AppColors.lGrey,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomTextField(
                  hint: "Search message..",
                  preIconPath: Icons.search,
                  textInputAction: TextInputAction.search,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      children: [
                        MessageCard(
                          image: ImagePath.building,
                          companyName: "TechFlow Solution",
                          message: "Lorem ipsum dolor sit amet consectetur.",
                          time: "5 hour ago",
                        ),
                        SizedBox(height: 20),

                        MessageCard(
                          image: ImagePath.building,
                          companyName: "ABC Solution",
                          message: "Lorem ipsum dolor sit amet consectetur.",
                          time: "1 hour ago",
                          isRead: true,

                          readFontSize: 13,
                          readFontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 20),

                        MessageCard(
                          image: ImagePath.building,
                          companyName: "ABC Solution",
                          message: "Lorem ipsum dolor sit amet consectetur.",
                          time: "1 hour ago",
                          isRead: true,

                          readFontSize: 13,
                          readFontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 20),

                        MessageCard(
                          image: ImagePath.building,
                          companyName: "TechFlow Solution",
                          message: "Lorem ipsum dolor sit amet consectetur.",
                          time: "5 hour ago",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
