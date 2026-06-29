import 'package:flutter/material.dart';

class Container1 extends StatelessWidget {
  final Widget child;
  const Container1({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),

      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 245, 246),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(15),
      child: child,
    );
  }
}
