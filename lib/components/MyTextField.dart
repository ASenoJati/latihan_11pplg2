import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final bool isNumber;
  final TextInputType keyboardType;
  final Function(String)? onChange;

  const MyTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.onChange,
    this.isNumber = false,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.isNumber
          ? [FilteringTextInputFormatter.digitsOnly]
          : [],
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
