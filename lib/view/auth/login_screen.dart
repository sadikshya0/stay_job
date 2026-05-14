import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:safe_job/controller/auth/login_screen_controller.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/utils/validator.dart';
import 'package:safe_job/view/auth/register_screen.dart';
import 'package:safe_job/view/dashboard/dash_screen.dart';
import 'package:safe_job/widgets/custom/custom_password.dart';
import 'package:safe_job/widgets/custom/custom_textfield.dart';
import 'package:safe_job/widgets/custom/elevated_button.dart';

class LoginScreen extends StatelessWidget {
  final c = Get.put(LoginScreenController());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset(ImagePath.logo, height: 80, width: 85),
                  Text(
                    "Welcome Back",
                    style: CustomTextStyles.f28W600(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text(
                    "Sign in to continue searching your home and job",
                    style: CustomTextStyles.f12W700(color: AppColors.textColor),
                  ),
                ],
              ),
              SizedBox(height: 60),
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Text(
                  "PHONE NUMBER",
                  style: CustomTextStyles.f16W600(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),

              CustomTextField(
                hint: "Enter your phone number",
                preIconPath: Icons.mobile_friendly,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.phone,
              ),
              SizedBox(height: 20),

              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Text(
                  "PASSWORD",
                  style: CustomTextStyles.f16W600(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),

              Obx(
                () => CustomPasswordField(
                  validator: Validators.checkPasswordField,
                  preIconPath: Icons.lock,
                  hint: "Enter your password",
                  eye: c.passwordobscure.value,
                  onEyeClick: c.onEyeClick,
                  controller: c.passwordController,
                  textInputAction: TextInputAction.done,
                ),
              ),

              SizedBox(height: 20),

              Align(
                alignment: AlignmentGeometry.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: CustomTextStyles.f16W600(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              CustomElevatedButton(
                title: "Login",
                onTap: () {
                  Get.offAll(() => DashScreen());
                },
              ),

              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: CustomTextStyles.f16W600(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Get.offAll(() => RegisterScreen());
                    },
                    child: Text(
                      "Sign Up",
                      style: CustomTextStyles.f16W600(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 2,
                      width: 140,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    "or continue with",
                    style: CustomTextStyles.f14W600(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  SizedBox(width: 4),

                  Expanded(
                    child: Container(
                      height: 2,
                      width: 140,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  InkWell(
                    child: Expanded(
                      child: Container(
                        height: 50,
                        width: 170,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.lGrey, width: 2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              ImagePath.google,
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(width: 4),

                            Text(
                              "Google",
                              style: CustomTextStyles.f14W600(
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    child: Expanded(
                      child: Container(
                        height: 50,
                        width: 170,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.lGrey, width: 2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.facebook, color: Colors.blueAccent),
                            SizedBox(width: 4),
                            Text(
                              "Facebook",
                              style: CustomTextStyles.f14W600(
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
