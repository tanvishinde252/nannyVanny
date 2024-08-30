import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanny_vanny/controllers/currentBookingController.dart';

class CurrentBookingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<BookingController>(
      init: BookingController(), // Ensure the controller is initialized
      builder: (controller) {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        // Safely access booking
        final booking = controller.booking.value;

        if (booking == null) {
          return const Center(child: Text('No data available'));
        }

        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    booking.title,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 236, 107, 150),
                        fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 236, 107, 150),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30),
                          right: Radius.circular(30),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Start',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'From',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.calendar_month,
                              color: Colors.pinkAccent),
                          const SizedBox(width: 10),
                          Text(
                            '${booking.fromDate} ',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.access_time,
                              color: Colors.pinkAccent),
                          const SizedBox(width: 10),
                          Text(
                            ' ${booking.fromTime}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'To',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.calendar_month,
                              color: Colors.pinkAccent),
                          const SizedBox(width: 10),
                          Text(
                            '${booking.toDate} ',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.access_time,
                              color: Colors.pinkAccent),
                          const SizedBox(width: 10),
                          Text(
                            ' ${booking.toTime}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.star_border,
                      color: Colors.white,
                      size: 10,
                    ),
                    label: const Text(
                      'Rate Us',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 46, 41, 121),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(0, 0),
                      padding: EdgeInsets.all(8),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.location_pin,
                      color: Colors.white,
                      size: 10,
                    ),
                    label: const Text(
                      'Geolocation',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 46, 41, 121),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(0, 0),
                      padding: EdgeInsets.all(8),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shield,
                      color: Colors.white,
                      size: 10,
                    ),
                    label: const Text(
                      'Surveillance',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 46, 41, 121),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(0, 0),
                      padding: EdgeInsets.all(8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
