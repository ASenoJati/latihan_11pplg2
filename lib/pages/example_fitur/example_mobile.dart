import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExampleMobile extends StatelessWidget {
  const ExampleMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ini Mobile Layout')),
      body: const Center(
        child: Text('This is the mobile version of the example page.'),
      ),
    );
  }
}
