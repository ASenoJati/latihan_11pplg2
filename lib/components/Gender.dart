import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  const Gender({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          value: widget.value,
          groupValue: widget.groupValue,
          onChanged: widget.onChanged,
        ),
        Text(widget.value),
      ],
    );
  }
}
