import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg2/helper/db_helper.dart';

class ContactController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final names = <Map<String, dynamic>>[].obs; // simpan id + name
  final _dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    fetchNames();
  }

  Future<void> fetchNames() async {
    final data = await _dbHelper.getNames();
    names.value = data; // data berisi list<Map<String, dynamic>>
  }

  Future<void> addName() async {
    final text = nameController.text.trim();
    if (text.isEmpty) return;
    await _dbHelper.insertName(text);
    nameController.clear();
    fetchNames();
  }

  Future<void> updateName(int id, String newName) async {
    if (newName.trim().isEmpty) return;
    await _dbHelper.updateName(id, newName.trim());
    fetchNames();
  }

  Future<void> deleteName(int id) async {
    await _dbHelper.deleteName(id);
    fetchNames();
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
