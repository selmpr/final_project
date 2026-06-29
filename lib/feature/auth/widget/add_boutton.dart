import 'package:flutter/material.dart';

class Adding extends StatelessWidget {
  final String addText;
  final VoidCallback onPressed;
  const Adding({super.key, required this.addText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          const Color.fromARGB(252, 153, 151, 249),
        ),
      ),

      child: Text(addText, style: TextStyle(color: Colors.white, fontSize: 15)),
    );
  }
}
