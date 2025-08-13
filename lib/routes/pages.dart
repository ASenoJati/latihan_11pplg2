import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg2/pages/calculator_page.dart';
import 'package:latihan_11pplg2/pages/edit_football_page.dart';
import 'package:latihan_11pplg2/pages/football_player.dart';
import 'package:latihan_11pplg2/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.calculatorPage, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.football, page: () => FootballPlayer()),
    GetPage(name: AppRoutes.editFootball, page: () => EditFootballPage()),
  ];
}
