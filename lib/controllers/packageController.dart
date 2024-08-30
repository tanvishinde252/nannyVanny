import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nanny_vanny/models/packageModel.dart';

class PackageController extends GetxController {
  var packages = <Package>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPackages();
  }

  Future<void> fetchPackages() async {
    try {
      final response = await http.get(
          Uri.parse('https://www.cgprojects.in/lens8/api/dummy/packages_list'));

      if (response.statusCode == 200) {
        final List<Package> fetchedPackages =
            Package.fromJsonList(response.body);
        packages.assignAll(fetchedPackages);
        errorMessage.value = '';
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
