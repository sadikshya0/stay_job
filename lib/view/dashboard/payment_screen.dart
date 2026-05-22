import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/widgets/profile_widgets/payment_card.dart';
import 'package:safe_job/widgets/profile_widgets/payment_history_card.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: AppColors.textColor, size: 22),
        ),
        title: Text(
          "Payments & Subscriptions",
          style: CustomTextStyles.f18W600(color: AppColors.primaryColor),
        ),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment Methods",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),
                PaymentCard(
                  iconPath: ImagePath.visa,
                  cardNumber: "****2026",
                  cardType: "Credit Card",
                  iconBorderColor: Colors.red,
                ),
                SizedBox(height: 10),
                PaymentCard(
                  iconPath: ImagePath.esewa,
                  cardNumber: "984*******",
                  cardType: "Digital Wallet",
                  iconBorderColor: Colors.green,
                ),
                SizedBox(height: 10),
                PaymentCard(
                  iconPath: ImagePath.paypal,
                  cardNumber: "Jeremiah1@gmail.com",
                  cardType: "PayPal Express",
                  iconBorderColor: AppColors.primaryColor,
                ),
                SizedBox(height: 20),
                Text(
                  "Promotions",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.lOrange.withOpacity(0.3),
                    ),
                    color: Colors.amberAccent.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 45,
                              width: 50,
                              decoration: BoxDecoration(
                                color: AppColors.lOrange.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.card_giftcard_outlined,
                                  color: AppColors.orange.withOpacity(0.8),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Have a promo code?",
                                  style: CustomTextStyles.f14W600(
                                    color: AppColors.textColor,
                                  ),
                                ),
                                Text(
                                  "Redeem for booking credits",
                                  style: CustomTextStyles.f12W600(
                                    color: AppColors.secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "Apply",
                          style: CustomTextStyles.f16W600(
                            color: AppColors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Recent Invoices",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),
                PaymentHistoryCard(
                  date: "Feb 28, 2026",
                  title: "Room Booking fee",
                  amount: "NPR 1000",
                ),
                SizedBox(height: 10),
                PaymentHistoryCard(
                  date: "Jan 28, 2026",
                  title: "Room Booking fee",
                  amount: "NPR 850",
                ),
                SizedBox(height: 10),
                PaymentHistoryCard(
                  date: "Dec 28, 2025",
                  title: "Room Booking fee",
                  amount: "NPR 1200",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
