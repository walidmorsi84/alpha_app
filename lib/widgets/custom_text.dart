import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      'Press on any $text to view',
      style: const TextStyle(fontSize: 30, color: Colors.grey),
      textAlign: TextAlign.center,
    );
  }
}
