import 'package:get/get.dart';
import 'package:latihan_11pplg2/bindings/LoginAPIBinding.dart';
import 'package:latihan_11pplg2/bindings/calculator_binding.dart';
import 'package:latihan_11pplg2/bindings/contact_binding.dart';
import 'package:latihan_11pplg2/bindings/example_binding.dart';
import 'package:latihan_11pplg2/bindings/responsive_football_binding.dart';
import 'package:latihan_11pplg2/bindings/table_premiere_binding.dart';
import 'package:latihan_11pplg2/pages/LoginAPIPage.dart';
import 'package:latihan_11pplg2/pages/calculator_page.dart';
import 'package:latihan_11pplg2/pages/contact_page.dart';
import 'package:latihan_11pplg2/pages/edit_football_page.dart';
import 'package:latihan_11pplg2/pages/example_page.dart';
import 'package:latihan_11pplg2/pages/football_player.dart';
import 'package:latihan_11pplg2/pages/main_page.dart';
import 'package:latihan_11pplg2/pages/profile_page.dart';
import 'package:latihan_11pplg2/pages/table_premiere_page.dart';
import 'package:latihan_11pplg2/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.mainPage, page: () => MainPage()),
    GetPage(
      name: AppRoutes.calculatorPage,
      page: () => CalculatorPage(),
      binding: CalculatorBinding(),
    ),
    GetPage(
      name: AppRoutes.football,
      page: () => FootballPlayer(),
      binding: ResponsiveFootballBinding(),
    ),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),
    GetPage(name: AppRoutes.editFootball, page: () => EditFootballPage()),
    GetPage(
      name: AppRoutes.contactPage,
      page: () => ContactPage(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: AppRoutes.examplePage,
      page: () => ExamplePage(),
      binding: ExampleBinding(),
    ),
    GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginAPIPage(),
      binding: LoginAPIBinding(),
    ),
    GetPage(
      name: AppRoutes.premierePage,
      page: () => TablePremierePage(),
      binding: TablePremiereBinding(),
    ),
  ];
}
