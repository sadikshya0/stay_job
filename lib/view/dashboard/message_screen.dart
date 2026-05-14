import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/view/dashboard/dash_screen.dart';
import 'package:safe_job/widgets/custom/custom_textfield.dart';

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
        child: Column(
          children: [
            CustomTextField(
              hint: "Search message..",
              preIconPath: Icons.search,
              textInputAction: TextInputAction.search,
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 20),

            Row(children: [
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
