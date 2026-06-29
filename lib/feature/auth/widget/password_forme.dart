import 'package:flutter/material.dart';

class PasswordForme extends StatefulWidget {
  final TextEditingController controller;
  const PasswordForme({super.key, required this.controller});

  @override
  State<PasswordForme> createState() => _PasswordFormeState();
}

class _PasswordFormeState extends State<PasswordForme> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isPasswordVisible ? false : true,
      decoration: InputDecoration(
        labelText: 'password',
        labelStyle: TextStyle(color: const Color.fromARGB(253, 168, 167, 250)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: const Color.fromARGB(253, 168, 167, 250),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: const Color.fromARGB(252, 111, 109, 250),
          ),
        ),
        prefixIcon: Icon(Icons.lock_open),
        prefixIconColor: const Color.fromARGB(253, 168, 167, 250),
        suffixIconColor: const Color.fromARGB(253, 168, 167, 250),

        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          icon: Icon(
            isPasswordVisible
                ? Icons.remove_red_eye_outlined
                : Icons.remove_red_eye,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return ('enter your pass word');
        } else if (value.length <= 6) {
          return ('nember of caracters must be>=6');
        }
        return null;
      },
    );
  }
}
