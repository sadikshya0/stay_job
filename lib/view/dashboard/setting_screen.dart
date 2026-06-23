import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/view/auth/login_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool pushNotification = false;
  bool emailUpdates = false;
  bool locationServices = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 2,
        shadowColor: AppColors.lGrey,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Settings",
          style: CustomTextStyles.f16W600(color: AppColors.primaryColor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 210,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.secondaryTextColor.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildSwitchTile(
                        title: "Push Notifications",
                        subtitle: "Get alerts for new jobs and rooms",
                        value: pushNotification,
                        onChanged: (val) {
                          setState(() => pushNotification = val);
                        },
                      ),
                      const SizedBox(height: 15),

                      _buildSwitchTile(
                        title: "Email Updates",
                        subtitle: "Weekly digest of top picks",
                        value: emailUpdates,
                        onChanged: (val) {
                          setState(() => emailUpdates = val);
                        },
                      ),
                      const SizedBox(height: 15),

                      _buildSwitchTile(
                        title: "Location Services",
                        subtitle: "Find spaces near you",
                        value: locationServices,
                        onChanged: (val) {
                          setState(() => locationServices = val);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.secondaryTextColor.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Language",
                            style: CustomTextStyles.f16W600(
                              color: AppColors.textColor,
                            ),
                          ),
                          Text(
                            "English(US)",
                            style: CustomTextStyles.f16W600(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Currency",
                            style: CustomTextStyles.f16W600(
                              color: AppColors.textColor,
                            ),
                          ),
                          Text(
                            "USD(\$)",
                            style: CustomTextStyles.f16W600(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  Get.to(() => LoginScreen());
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.3),
                    border: Border.all(color: Colors.red.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Delete Account",
                      style: CustomTextStyles.f16W600(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CustomTextStyles.f14W600(color: AppColors.textColor),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: CustomTextStyles.f12W400(
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: Switch(
            value: value,

            activeColor: AppColors.whiteColor,
            activeTrackColor: AppColors.primaryColor,
            inactiveTrackColor: AppColors.whiteColor,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
