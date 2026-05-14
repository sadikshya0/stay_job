import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/view/dashboard/explore_screen.dart';
import 'package:safe_job/view/dashboard/home_screen.dart';
import 'package:safe_job/view/dashboard/job_screen.dart';
import 'package:safe_job/view/dashboard/profile_screen.dart';
import 'package:safe_job/view/dashboard/room_screen.dart';

class DashScreenController extends GetxController {
  final key = GlobalKey<ScaffoldState>();
  RxList<Widget> pages = RxList([
    HomeScreen(),
    JobScreen(),
    ExploreScreen(),
    RoomScreen(),
    ProfileScreen(),
  ]);
  RxInt currentIndex = RxInt(0);
  void changetab(int index) {
    currentIndex.value = index;
  }
}
