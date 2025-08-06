import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg2/components/MyButton.dart';
import 'package:latihan_11pplg2/components/MyTextField.dart';
import 'package:latihan_11pplg2/controllers/calculator_controller.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final CalculatorController calculatorController = Get.put(
    CalculatorController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyTextField(
              controller: calculatorController.txtAngka1,
              labelText: "Input Angka 1",
              isNumber: true,
            ),
            SizedBox(height: 16),

            MyTextField(
              controller: calculatorController.txtAngka2,
              labelText: "Input Angka 2",
              isNumber: true,
            ),
            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  buttonText: "+",
                  onPressed: () {
                    calculatorController.tambah();
                  },
                ),
                SizedBox(width: 16),
                Button(
                  buttonText: "-",
                  onPressed: () {
                    calculatorController.kurang();
                  },
                ),
              ],
            ),
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  buttonText: "*",
                  onPressed: () {
                    calculatorController.kali();
                  },
                ),
                SizedBox(width: 16),
                Button(
                  buttonText: "/",
                  onPressed: () {
                    calculatorController.bagi();
                  },
                ),
              ],
            ),
            SizedBox(height: 24),

            Center(
              child: Button(
                buttonText: "Reset",
                onPressed: () {
                  calculatorController.clear();
                },
              ),
            ),
            SizedBox(height: 24),

            Obx(() {
              return Center(
                child: Text(
                  "Hasil: ${calculatorController.textHasil.value}",
                  style: TextStyle(fontSize: 18),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
