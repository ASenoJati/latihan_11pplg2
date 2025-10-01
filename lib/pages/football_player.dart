import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg2/controllers/football_player_controller.dart';
import 'package:latihan_11pplg2/routes/routes.dart';

class FootballPlayer extends StatelessWidget {
  FootballPlayer({super.key});

  final FootballPlayerController footballPlayerController = Get.put(
    FootballPlayerController(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
