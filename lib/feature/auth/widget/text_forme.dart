import 'package:flutter/material.dart';

class TextForme extends StatelessWidget {
  final TextEditingController controller;
  final IconData prefixIcon;
  final String labelText;
  final TextInputType? keyboardType;

  const TextForme({
    super.key,
    required this.labelText,
    required this.controller,
    required this.prefixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: const Color.fromARGB(253, 168, 167, 250),
        ),
        labelText: labelText,
        labelStyle: TextStyle(color: const Color.fromARGB(253, 168, 167, 250)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: const Color.fromARGB(253, 168, 167, 250),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: const Color.fromARGB(252, 87, 85, 255)),
        ),
      ),
    );
  }
}
