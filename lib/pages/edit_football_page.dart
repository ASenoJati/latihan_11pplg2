import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg2/components/MyTextField.dart';
import 'package:latihan_11pplg2/controllers/edit_football_player_controller.dart';
import 'package:latihan_11pplg2/controllers/football_player_controller.dart';
import 'package:latihan_11pplg2/model/PlayersModel.dart';

class EditFootballPage extends StatelessWidget {
  EditFootballPage({super.key});

  final editController = Get.put(EditFootballPlayerController());
  final playerController = Get.find<FootballPlayerController>();

  @override
  Widget build(BuildContext context) {
    final player = playerController.players[editController.index];

    return Scaffold(
      appBar: AppBar(title: Text("Edit Pemain")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(player.image),
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: MyTextField(
                controller: editController.nama,
                labelText: "Nama",
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: MyTextField(
                controller: editController.posisi,
                labelText: "Posisi",
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: MyTextField(
                controller: editController.nomorPunggung,
                labelText: "Nomor Punggung",
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: editController.save,
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
