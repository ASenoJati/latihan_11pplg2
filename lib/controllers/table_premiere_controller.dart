import 'dart:convert';

import 'package:get/get.dart';
import 'package:latihan_11pplg2/model/table_premiere_model.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_11pplg2/routes/AppConstant.dart';

class TablePremiereController extends GetxController {
  var isLoading = false.obs;
  var tableStandings = <Table>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAPITablePremiere();
  }

  Future<void> fetchAPITablePremiere() async {
    const url =
        '${AppConstant.baseUrlSportDB}/json/3/lookuptable.php?l=4328&s=2025-2026';

    try {
      isLoading.value = true;

      final response = await http.get(Uri.parse(url));

      print("status code: ${response.statusCode}");
      print("response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List standings = data['table'];
        tableStandings.assignAll(
          standings.map((e) => Table.fromJson(e)).toList(),
        );
      } else {
        Get.snackbar('Error', 'Failed to load data from API');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
