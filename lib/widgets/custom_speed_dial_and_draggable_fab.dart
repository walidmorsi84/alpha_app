import 'package:alpha/views/home_view.dart';
import 'package:alpha/widgets/speed_dial_and_draggable_fab.dart';
import 'package:flutter/material.dart';

class CustomSpeedDialAndDraggableFAB extends StatelessWidget {
  const CustomSpeedDialAndDraggableFAB({
    super.key,
    required this.icon,
    required this.label,
    required this.widget,
    required this.childIconColor,
    required this.closeMenuColor,
    required this.mainIconColor,
    required this.width,
    required this.height,
  });
  final IconData icon;
  final String label;
  final Widget widget;
  final Color childIconColor, closeMenuColor, mainIconColor;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return SpeedDialAndDraggableFAB(
      y: height,
      x: width,
      icon: icon,
      label: label,
      foregroundColor: mainIconColor,
      childBackgroundColor: childIconColor,
      activeBackgroundColor: closeMenuColor,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return widget;
            },
          ),
        );
      },
      homeOnTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HomeView();
            },
          ),
        );
      },
    );
  }
}
