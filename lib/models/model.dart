import 'package:flutter/cupertino.dart';

class AlphaModel {
  final Color color;
  final String letter;
  final String name;
  //final VoidCallback onTap;
  final String sound;
  final Alignment alignment;
  final String image;

  const AlphaModel({
    required this.color,
    required this.letter,
    required this.name,
    required this.sound,
    required this.image,
    required this.alignment,
  });
}

// class ColorModel {
//   //final Color color;
//   final Alignment alignment;
//   final String image;
//
//   const ColorModel({
//     //required this.color,
//     required this.alignment,
//     required this.image,
//   });
// }
