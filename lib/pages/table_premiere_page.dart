import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg2/controllers/table_premiere_controller.dart';

class TablePremierePage extends StatelessWidget {
  TablePremierePage({super.key});

  final controller = Get.find<TablePremiereController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Table Premiere Page')),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: controller.fetchAPITablePremiere, // fungsi refresh
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: controller.tableStandings.length,
              itemBuilder: (context, index) {
                final team = controller.tableStandings[index];
                return Card(
                  child: ListTile(
                    title: Text(team.strTeam),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(team.strBadge),
                      radius: 25,
                    ),
                    subtitle: Text('Points: ${team.intPoints}'),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
