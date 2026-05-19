import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/image_path.dart';

class RoomPhotoScreen extends StatelessWidget {
  const RoomPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundDark,

        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () => Get.back(),
              child: Positioned(top: 8, left: 8, child: Icon(Icons.cancel)),
            ),
          ),
        ],
      ),
      body: Center(
        child: SafeArea(
          child: CarouselSlider(
            items: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(ImagePath.bedroom),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(ImagePath.bedroom),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(ImagePath.bedroom),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],

            options: CarouselOptions(
              height: 220,

              autoPlay: true,
              enlargeCenterPage: true,

              viewportFraction: 0.9,

              autoPlayAnimationDuration: Duration(milliseconds: 800),
            ),
          ),
        ),
      ),
    );
  }
}
