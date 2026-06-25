import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/controller/dashboard/appointment_controller.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/widgets/profile_widgets/visit_card.dart';

class AppointmentScreen extends StatelessWidget {
  AppointmentScreen({super.key});

  final AppointmentController controller = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
        title: Text(
          "Appointment",
          style: CustomTextStyles.f18W600(color: AppColors.primaryColor),
        ),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.bookings.isEmpty) {
          return const Center(child: Text("No appointments found"));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: controller.bookings.length,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            final item = controller.bookings[index];

            return VisitCard(book: item);
          },
        );
      }),
    );
  }
}
