import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg2/pages/calculator_page.dart';
import 'package:latihan_11pplg2/pages/football_player.dart';
import 'package:latihan_11pplg2/pages/profile_page.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    CalculatorPage(),
    FootballPlayer(),
    ProfilePage(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
