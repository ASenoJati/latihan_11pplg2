import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExampleWidescreen extends StatelessWidget {
  const ExampleWidescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ini Widescreen Layout')),
      body: const Center(
        child: Text('This is the widescreen version of the example page.'),
      ),
    );
  }
}
