import 'package:alpha/models/model.dart';
import 'package:flutter/material.dart';

class CustomGridViewItem extends StatelessWidget {
  const CustomGridViewItem({super.key, required this.alphaModel});

  //final ColorModel colorModel;
  final AlphaModel alphaModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 0.1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                colors: [
                  alphaModel.color.withOpacity(0.5),
                  alphaModel.color,
                ],
              ),
            ),
            width: double.infinity,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                alphaModel.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
