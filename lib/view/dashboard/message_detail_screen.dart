import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/controller/dashboard/message_controller.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/widgets/custom/custom_textfield.dart';

class MessageDetailScreen extends StatelessWidget {
  MessageDetailScreen({super.key});
  final controller = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColor,

      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Row(
          children: [
            Image.asset(ImagePath.building, height: 30, width: 30),
            SizedBox(width: 4),
            Text(
              "ABC Solution",
              style: CustomTextStyles.f16W600(color: AppColors.textColor),
            ),
          ],
        ),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        shadowColor: AppColors.lGrey,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 45,
                        width: 310,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Hi I would like to get more information about this job",
                            style: CustomTextStyles.f12W400(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "sent",
                        style: CustomTextStyles.f14W400(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "1 hour ago",
                  style: CustomTextStyles.f14W400(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                SizedBox(height: 5),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      color: AppColors.lOrange.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Hi Jeremiah ! Sure, Would you like to schedule interview for the job?",
                        style: CustomTextStyles.f12W400(
                          color: AppColors.textColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 12,
          top: 10,
        ),

        child: CustomTextField(
          hint: "Type Message...",
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.text,
          suffixIconPath: Icons.send,
        ),
      ),
    );
  }
}
