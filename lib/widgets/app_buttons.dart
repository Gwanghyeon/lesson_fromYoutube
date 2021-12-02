import 'package:dbestech_211130/minsc/colors.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool isIcon;

  AppButtons({
    Key? key,
    this.text,
    this.icon,
    this.isIcon = false,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: isIcon
          ? Center(
              child: Icon(
                icon,
                color: color,
              ),
            )
          : Center(child: AppText(text: text!, color: color)),
    );
  }
}
