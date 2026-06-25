import 'package:get/get.dart';
import 'package:safe_job/model/book.dart';
import 'package:safe_job/repo/get_bookings_repo.dart';

class AppointmentController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Book> bookings = <Book>[].obs;

  @override
  void onInit() {
    super.onInit();
    getBookings();
  }

  Future<void> getBookings() async {
    isLoading.value = true;

    await GetBookingsRepo.bookingRepo(
      onSuccess: (bookList) {
        bookings.assignAll(bookList);
        isLoading.value = false;
      },
      onError: (message) {
        isLoading.value = false;
        Get.snackbar("Error", message);
      },
    );
  }
}
