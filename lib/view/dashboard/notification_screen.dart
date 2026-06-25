import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/controller/dashboard/notification_controller.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/view/dashboard/dash_screen.dart';
import 'package:safe_job/widgets/custom/custom_textfield.dart';
import 'package:safe_job/widgets/home_screen_widget/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());

  NotificationScreen({super.key});

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
          child: Icon(Icons.arrow_back, size: 18),
        ),

        title: Text(
          "Notification",
          style: CustomTextStyles.f16W600(color: AppColors.primaryColor),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        elevation: 2,
        shadowColor: AppColors.lGrey,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final notifications = controller.filteredNotifications;
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// SEARCH
              CustomTextField(
                hint: "Search",
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.text,
                preIconPath: Icons.search,
                fillColor: AppColors.lGrey,
                border: AppColors.lGrey,
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Wrap(
                      spacing: 8,
                      children: [
                        GestureDetector(
                          onTap: () => controller.changeTab(0),
                          child: _buildTab(
                            "All",
                            controller.allCount,
                            controller.selectedTab.value == 0,
                          ),
                        ),

                        GestureDetector(
                          onTap: () => controller.changeTab(1),
                          child: _buildTab(
                            "Unread",
                            controller.unreadCount,
                            controller.selectedTab.value == 1,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: controller.markAllAsRead,
                        child: Text(
                          "Mark All as Read",
                          style: CustomTextStyles.f12W600(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          Get.dialog(
                            AlertDialog(
                              title: Text(
                                "Delete all notifications?",
                                style: CustomTextStyles.f14W600(
                                  color: AppColors.textColor,
                                ),
                              ),
                              content: Text(
                                "This action will permanently remove all notifications.",
                                style: CustomTextStyles.f14W400(
                                  color: AppColors.textColor,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Get.back(),
                                  child: Text(
                                    "Cancel",
                                    style: CustomTextStyles.f12W600(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  onPressed: () {
                                    Get.back();
                                    controller.deleteAllNotifications();
                                  },
                                  child: Text(
                                    "Delete",
                                    style: CustomTextStyles.f12W600(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: Icon(Icons.delete_sweep, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final n = notifications[index];

                    return Column(
                      children: [
                        NotificationCard(
                          title: n.title ?? "",
                          description: n.message ?? "",
                          time: n.createdAt ?? "",
                          showMarkAsRead: !(n.isRead ?? false),
                          onMarkAsRead: () {
                            controller.markAsRead(n.id.toString());
                          },
                          onDelete: () {
                            Get.dialog(
                              AlertDialog(
                                title: Text(
                                  "Delete Notification",
                                  style: CustomTextStyles.f18W600(
                                    color: AppColors.textColor,
                                  ),
                                ),
                                content: Text(
                                  "Are you sure you want to delete this notification?",
                                  style: CustomTextStyles.f16W400(
                                    color: AppColors.textColor,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Get.back(),
                                    child: Text(
                                      "Cancel",
                                      style: CustomTextStyles.f16W600(
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                      controller.deleteNotification(
                                        n.id.toString(),
                                      );
                                    },
                                    child: Text(
                                      "Delete",
                                      style: CustomTextStyles.f16W600(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Divider(
                          color: AppColors.secondaryTextColor.withOpacity(0.5),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildTab(String title, int count, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isActive
            ? AppColors.primaryColor
            : AppColors.primaryColor.withOpacity(0.2),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: isActive ? Colors.white : Colors.black),
          ),
          SizedBox(width: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: isActive ? Colors.white : AppColors.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              count.toString(),
              style: TextStyle(
                color: isActive ? AppColors.primaryColor : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
