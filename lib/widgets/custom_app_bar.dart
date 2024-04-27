import 'package:alpha/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.titleColor,
  });

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
  final String title;
  final Color titleColor;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppBar(
        backgroundColor: kColor,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
        ),
      ),
    );
  }
}
