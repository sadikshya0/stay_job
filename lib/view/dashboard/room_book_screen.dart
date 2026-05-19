import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomBookScreen extends StatelessWidget {
  const RoomBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back, size: 24),
        ),
      ),
    );
  }
}
