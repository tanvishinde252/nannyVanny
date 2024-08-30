import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:nanny_vanny/controllers/packageController.dart';

class PackageDataWidget extends StatelessWidget {
  const PackageDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: GetX<PackageController>(
        init: PackageController(),
        builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage.value.isNotEmpty) {
            return Center(child: Text(controller.errorMessage.value));
          }

          if (controller.packages.isEmpty) {
            return const Center(child: Text('No data available'));
          }

          return ListView.builder(
            itemCount: controller.packages.length,
            itemBuilder: (context, index) {
              final package = controller.packages[index];
              final isEven = index.isEven;
              String calIcon = "";
              if (package.title == "One Day Package") {
                calIcon = "01";
              } else if (package.title == "Three Day Package") {
                calIcon = "03";
              }
              if (package.title == "Five Day Package") {
                calIcon = "05";
              }

              return Container(
                height: 150,
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: !isEven
                      ? const Color.fromARGB(255, 133, 213, 247)
                      : const Color.fromARGB(255, 247, 174, 198),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 25, // Increase size for better visibility
                              color: !isEven
                                  ? Colors.white
                                  : const Color.fromARGB(255, 220, 30, 94),
                            ),
                            if (calIcon != "")
                              Text(
                                calIcon,
                                style: TextStyle(
                                  color: !isEven
                                      ? Colors.white
                                      : const Color.fromARGB(255, 220, 30, 94),
                                  fontSize:
                                      12, // Adjust font size to fit within the icon
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            if (calIcon == "")
                              const Icon(
                                Icons.sunny,
                                color: Colors.white,
                                size: 15,
                              )
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: !isEven
                                ? const Color.fromARGB(255, 6, 171, 242)
                                : const Color.fromARGB(
                                    255, 220, 30, 94), // Blue background color
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 5), // Padding around the text
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(30),
                                right: Radius.circular(30),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Book Now',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          package.title,
                          // package.desc,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 46, 41, 121),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.currency_rupee,
                              size: 16,
                              color: Color.fromARGB(255, 46, 41, 121),
                            ),
                            Text(
                              package.price,
                              // package.desc,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 46, 41, 121),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      package.desc,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
