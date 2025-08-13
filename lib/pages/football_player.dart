import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:latihan_11pplg2/controllers/football_player_controller.dart';
import 'package:latihan_11pplg2/pages/edit_football_page.dart';
import 'package:latihan_11pplg2/routes/routes.dart';

class FootballPlayer extends StatelessWidget {
  FootballPlayer({super.key});

  final FootballPlayerController footballPlayerController = Get.put(
    FootballPlayerController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Man. United Players")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx(
          () => ListView.builder(
            itemCount: footballPlayerController.players.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.editFootball,
                    arguments: {'index': index},
                  );
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    footballPlayerController.players[index].image,
                  ),
                ),
                title: Text(footballPlayerController.players[index].nama),
              );
            },
          ),
        ),
      ),
    );
  }
}
