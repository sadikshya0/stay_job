import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/controller/auth/register_screen.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/utils/validator.dart';
import 'package:safe_job/view/auth/login_screen.dart';
import 'package:safe_job/widgets/custom/custom_password.dart';
import 'package:safe_job/widgets/custom/custom_textfield.dart';
import 'package:safe_job/widgets/custom/elevated_button.dart';

class RegisterScreen extends StatelessWidget {
  final c = Get.put(RegisterScreenController());
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    ImagePath.logo,
                    fit: BoxFit.scaleDown,
                    height: 80,
                    width: 85,
                  ),
                ),

                Center(
                  child: Text(
                    "Get Started",
                    style: CustomTextStyles.f28W600(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Create an account to find your home and job",
                    style: CustomTextStyles.f16W600(color: AppColors.textColor),
                  ),
                ),
                SizedBox(height: 40),

                Text(
                  "Full Name",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),

                CustomTextField(
                  hint: "Enter your full name",
                  preIconPath: Icons.person,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 20),
                Text(
                  " Email Address",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),

                CustomTextField(
                  hint: "Enter your email address",
                  preIconPath: Icons.email,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),

                Text(
                  "Phone Number",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hint: "Enter your phone number",
                  preIconPath: Icons.phone,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.phone,
                ),
                SizedBox(height: 20),

                Text(
                  "Password",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),
                Obx(
                  () => CustomPasswordField(
                    validator: Validators.checkPasswordField,
                    preIconPath: Icons.lock,
                    hint: "Enter your password",
                    eye: c.passwordobscure.value,
                    onEyeClick: c.onPasswordEyeClick,
                    controller: c.passwordController,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                SizedBox(height: 20),

                Text(
                  "Confirm Password",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),
                Obx(
                  () => CustomPasswordField(
                    validator: Validators.checkPasswordField,
                    preIconPath: Icons.lock,
                    hint: "Enter your confirm password",
                    eye: c.confirmPasswordobscure.value,
                    onEyeClick: c.onPasswordEyeClick,
                    controller: c.passwordController,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                SizedBox(height: 40),

                CustomElevatedButton(
                  title: "Create Account",
                  onTap: () {
                    Get.offAll(() => ());
                  },
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: CustomTextStyles.f16W600(
                        color: AppColors.textColor,
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Get.offAll(() => LoginScreen());
                      },
                      child: Text(
                        "Sign In",
                        style: CustomTextStyles.f16W600(
                          color: AppColors.primaryColor,
                        ),
                      ),
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
