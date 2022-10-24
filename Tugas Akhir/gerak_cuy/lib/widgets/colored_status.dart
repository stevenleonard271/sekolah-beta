import 'package:flutter/material.dart';
import 'package:gerak_cuy/shared/theme.dart';

class ColoredStatus extends StatelessWidget {
  const ColoredStatus(
      {super.key,
      required this.name,
      required this.color,
      required this.textColor,
      this.onTap});

  final String name;
  final Color color;
  final Color textColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(5),
        child: Text(
          name,
          style: whiteTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
