import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.color,
    required this.shadowColor,
    this.iconSize = 125,
  });
  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback onTap;
  final double iconSize;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            color: Colors.white,
            shadowColor: color.withOpacity(0.5),
            elevation: 16,
            child: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              width: 220,
              height: 170,
              child: Text(
                textAlign: TextAlign.center,
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Center(
            child: Icon(
              icon,
              size: iconSize,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
