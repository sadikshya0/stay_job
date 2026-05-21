import 'package:flutter/material.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/view/auth/login_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  void goToPage(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void nextPage() {
    if (currentIndex < 2) {
      goToPage(currentIndex + 1);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: [
          OnboardPage(
            title: 'Find a Job',
            description:
                'Browse thousands of career opportunities tailored to your skills and preferences.',
            image: ImagePath.job,
            currentIndex: currentIndex,
            pageIndex: 0,
            onNext: nextPage,
          ),
          OnboardPage(
            title: 'Secure a Room',
            description:
                'Discover comfortable rooms and apartments exactly where you need to be',
            image: ImagePath.room,
            currentIndex: currentIndex,
            pageIndex: 1,
            onNext: nextPage,
          ),
          OnboardPage(
            title: 'Smart Sync',
            description:
                'Our AI automatically finds rooms near your new workplace to save your commute time.',
            image: ImagePath.sync,
            currentIndex: currentIndex,
            pageIndex: 2,
            onNext: nextPage,
          ),
        ],
      ),
    );
  }
}

class OnboardPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final int currentIndex;
  final int pageIndex;
  final VoidCallback onNext;
  final Function(int)? onDotTap;

  const OnboardPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.currentIndex,
    required this.pageIndex,
    required this.onNext,
    this.onDotTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // IMAGE
        Expanded(
          child: Image.asset(image, width: double.infinity, fit: BoxFit.cover),
        ),

        // BOTTOM CONTAINER
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: const [
              BoxShadow(blurRadius: 8, spreadRadius: 2, color: Colors.black12),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: CustomTextStyles.f18W600(color: AppColors.primaryColor),
              ),

              const SizedBox(height: 15),

              Text(
                description,
                textAlign: TextAlign.center,
                style: CustomTextStyles.f14W600(color: AppColors.textColor),
              ),

              const SizedBox(height: 20),

              // DOTS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  final isActive = currentIndex == index;

                  return GestureDetector(
                    onTap: () => onDotTap?.call(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.all(5),
                      width: isActive ? 40 : 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: isActive
                            ? AppColors.primaryColor
                            : AppColors.lGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    currentIndex == 2 ? "Continue" : "Continue",
                    style: CustomTextStyles.f16W600(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
