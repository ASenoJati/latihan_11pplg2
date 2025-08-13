import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg2/controllers/football_player_controller.dart';
import 'package:latihan_11pplg2/model/PlayersModel.dart';

class EditFootballPlayerController extends GetxController {
  final nama = TextEditingController();
  final posisi = TextEditingController();
  final nomorPunggung = TextEditingController();

  final playerController = Get.find<FootballPlayerController>();
  late int index;

  @override
  void onInit() {
    super.onInit();
    index = Get.arguments['index'] as int;

    final player = playerController.players[index];
    nama.text = player.nama;
    posisi.text = player.posisi;
    nomorPunggung.text = player.nomorPunggung.toString();
  }

  void save() {
    playerController.updatePlayer(
      index,
      PlayersModel(
        nama: nama.text,
        posisi: posisi.text,
        nomorPunggung: int.parse(nomorPunggung.text),
        image: playerController.players[index].image,
      ),
    );
    Get.back();
  }

  @override
  void onClose() {
    nama.dispose();
    posisi.dispose();
    nomorPunggung.dispose();
    super.onClose();
  }
}
