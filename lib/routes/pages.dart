import 'package:get/get.dart';
import 'package:latihan_11pplg2/pages/calculator_page.dart';
import 'package:latihan_11pplg2/pages/edit_football_page.dart';
import 'package:latihan_11pplg2/pages/football_player.dart';
import 'package:latihan_11pplg2/pages/main_page.dart';
import 'package:latihan_11pplg2/pages/profile_page.dart';
import 'package:latihan_11pplg2/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.mainPage, page: () => MainPage()),
    GetPage(name: AppRoutes.calculatorPage, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.football, page: () => FootballPlayer()),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),
    GetPage(name: AppRoutes.editFootball, page: () => EditFootballPage()),
  ];
}
