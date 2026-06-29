import 'package:flutter/material.dart';

class Redirect extends StatelessWidget {
  final String registerText;
  final String register;
  final VoidCallback onPressed;
  const Redirect({
    super.key,
    required this.registerText,
    required this.register,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          registerText,
          style: TextStyle(
            color: const Color.fromARGB(255, 70, 64, 179),
            fontSize: 15,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            register,
            style: TextStyle(color: const Color.fromARGB(255, 70, 64, 179)),
          ),
        ),
      ],
    );
  }
}
