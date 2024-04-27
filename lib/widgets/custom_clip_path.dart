import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  final double value;

  CustomClipPath({
    super.reclip,
    required this.value,
    required this.alignment,
  });

  final Alignment alignment;
  @override
  Path getClip(Size size) {
    Path path = Path();
    if (alignment == Alignment.topLeft) {
      buildPath(path, size, const Offset(0, 0));
    } else if (alignment == Alignment.topCenter) {
      buildPath(path, size, Offset(size.width / 2, 0));
    } else if (alignment == Alignment.topRight) {
      buildPath(path, size, Offset(size.width, 0));
    } else if (alignment == Alignment.centerRight) {
      buildPath(path, size, Offset(size.width, size.height / 2));
    } else if (alignment == Alignment.center) {
      buildPath(path, size, Offset(size.width / 2, size.height / 2));
    } else if (alignment == Alignment.centerLeft) {
      buildPath(path, size, Offset(0, size.height / 2));
    } else if (alignment == Alignment.bottomLeft) {
      buildPath(path, size, Offset(0, size.height));
    } else if (alignment == Alignment.bottomCenter) {
      buildPath(path, size, Offset(size.width / 2, size.height));
    } else if (alignment == Alignment.bottomRight) {
      buildPath(path, size, Offset(size.width, size.height));
    } else if (alignment == Alignment.center) {
      buildPath(path, size, Offset(size.width / 2, size.height / 2));
    }

    return path;
  }

  void buildPath(Path path, Size size, Offset offset) {
    path.addOval(
      Rect.fromCenter(
        center: offset,
        width: size.width * 3 * value,
        height: size.height * 3 * value,
      ),
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
