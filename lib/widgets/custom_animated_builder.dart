import 'package:alpha/models/model.dart';
import 'package:alpha/widgets/custom_clip_path.dart';
import 'package:flutter/material.dart';

class CustomAnimatedBuilder extends StatelessWidget {
  const CustomAnimatedBuilder({
    super.key,
    required this.animationController,
    required this.currentColor,
    required this.currentImage,
  });

  final AnimationController animationController;
  final AlphaModel currentColor;
  final AlphaModel currentImage;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return ClipPath(
          clipper: CustomClipPath(
            value: animationController.value,
            alignment: currentColor.alignment,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            decoration: BoxDecoration(
              color: currentColor.color,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(currentImage.image),
              ),
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                colors: [
                  currentColor.color.withOpacity(0.5),
                  currentColor.color,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
