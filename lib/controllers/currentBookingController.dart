import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nanny_vanny/models/bookingModel.dart';

class BookingController extends GetxController {
  var booking = Rx<Booking?>(null);
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBooking();
  }

  Future<void> fetchBooking() async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.cgprojects.in/lens8/api/dummy/current_booking_list'));

      if (response.statusCode == 200) {
        final List<Booking> bookings = Booking.fromJsonList(response.body);
        if (bookings.isNotEmpty) {
          booking.value = bookings[0]; // Assuming there's only one booking
          errorMessage.value = '';
        } else {
          errorMessage.value = 'No bookings found';
        }
      } else {
        errorMessage.value = 'Failed to load data';
      }
    } catch (e) {
      errorMessage.value = 'An error occurred: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
