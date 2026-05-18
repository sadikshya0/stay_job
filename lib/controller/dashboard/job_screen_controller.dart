import 'package:get/get.dart';

class JobScreenController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final List<Map<String, dynamic>> job = [
    {
      "title": "Senior Backend Developer",
      "company": "TechFlow Solution",
      "type": "FULL TIME",
      "salary": "NPR 70k - 90k",
      "location": "0km, Pokhara",
    },
    {
      "title": "Waiter",
      "company": "Fresh Elements Restaurant & Bar",
      "type": "FULL TIME",
      "salary": "NPR 10k - 15k",
      "location": "Lakeside, Pokhara",
    },
    {
      "title": "Frontend Developer",
      "company": "ABC Solution",
      "type": "FULL TIME",
      "salary": "NPR 60k - 85k",
      "location": "Chipledhunga, Pokhara",
    },
  ];
}
