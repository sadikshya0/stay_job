import 'package:flutter/material.dart';
import 'package:safe_job/utils/colors.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const CircleIconButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2),
              color: AppColors.secondaryTextColor,
            ),
          ],
        ),
        child: Center(child: Icon(icon, size: 18)),
      ),
    );
  }
}
