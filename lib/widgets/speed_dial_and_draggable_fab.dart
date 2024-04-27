import 'package:alpha/constants.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SpeedDialAndDraggableFAB extends StatelessWidget {
  const SpeedDialAndDraggableFAB({
    super.key,
    required this.label,
    required this.activeBackgroundColor,
    required this.foregroundColor,
    required this.childBackgroundColor,
    required this.onTap,
    required this.homeOnTap,
    required this.x,
    required this.y,
    required this.icon,
  });

  final String label;
  final double x, y;
  final Color activeBackgroundColor, foregroundColor, childBackgroundColor;
  final VoidCallback onTap, homeOnTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return DraggableFab(
      initPosition: Offset(x, y),
      child: SpeedDial(
        activeIcon: Icons.menu_book,
        activeBackgroundColor: activeBackgroundColor,
        activeForegroundColor: kColor,
        elevation: 20,
        //visible: true,
        //useRotationAnimation: true,
        backgroundColor: kColor,
        foregroundColor: foregroundColor,
        spaceBetweenChildren: 20.0,
        closeManually: false,
        animatedIcon: AnimatedIcons.menu_close,
        overlayOpacity: 0.4,
        children: [
          SpeedDialChild(
            onTap: homeOnTap,
            child: const Icon(Icons.home_filled),
            label: 'Home',
          ),
          SpeedDialChild(
            backgroundColor: childBackgroundColor,
            child: Icon(icon, color: kColor, size: 45),
            label: label,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
