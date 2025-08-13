import 'package:get/get.dart';
import 'package:latihan_11pplg2/model/PlayersModel.dart';

class FootballPlayerController extends GetxController {
  var players = <PlayersModel>[
    PlayersModel(
      nama: "Banyu",
      posisi: "Wasit",
      nomorPunggung: 11,
      image: "images/05545.jpg",
    ),
    PlayersModel(
      nama: "Awan Neysa",
      posisi: "Wartawan",
      nomorPunggung: 33,
      image: "images/05542.jpg",
    ),
  ].obs;

  void updatePlayer(int index, PlayersModel newPlayer) {
    players[index] = newPlayer;
  }
}
