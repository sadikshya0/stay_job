import 'package:get/get.dart';

class RoomScreenController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final List<Map<String, dynamic>> room = [
    {
      "title": "Modern 2BHK Flat",
      "price": "NPR 18K/ month",
      "location": "Masbar-7, pokhara",
    },
    {
      "title": "Single Room",
      "price": "NPR 25K/ month",
      "location": "Masbar-7, pokhara",
    },
    {
      "title": "Modern lift Downtown",
      "price": "NPR 15K/ month",
      "location": "Masbar-7, pokhara",
    },
  ];
}
