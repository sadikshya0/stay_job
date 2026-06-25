class Api {
  static const String baseUrl = "http://192.168.1.154/stay_job/api";

  static const String loginUrl = "$baseUrl/login.php";
  static const String registerUrl = "$baseUrl/register.php";
  static const String getRoomUrl = "$baseUrl/get_room.php";
  static const String bookRoomUrl = "$baseUrl/book_room.php";
  static const String getBookingsUrl = "$baseUrl/get_bookings.php";
  static const String cancelBookingUrl = "$baseUrl/cancel_booking.php";
  static const String notificationUrl = "$baseUrl/get_notification.php";
  static const String markNotificationUrl = "$baseUrl/mark_notification.php";
  static const String markAllNotificationUrl =
      "$baseUrl/read_all_notification.php";
  static const String deleteNotificationUrl =
      "$baseUrl/delete_notification.php";
  static const String deleteAllNotificationUrl =
      "$baseUrl/delete_all_notification.php";
}
