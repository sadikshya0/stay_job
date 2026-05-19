import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class RoomScheduleScreen extends StatelessWidget {
  const RoomScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
